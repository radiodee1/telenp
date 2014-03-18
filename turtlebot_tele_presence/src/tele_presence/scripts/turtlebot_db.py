#!/usr/bin/env python

import rospy
from pymongo import MongoClient
import datetime
import hashlib

import rosjson 
import json #, ast
import subprocess

from nav_msgs.msg import *
from nav_msgs.srv import *
from std_msgs.msg import *
from geometry_msgs.msg import *
from tele_presence.msg import *
from tele_presence.srv import *

#subprocess.call(['mongod', '--dbpath', '/var/lib/mongodb/'])
client = MongoClient('localhost', 28018) #NON STANDARD PORT NUM
db = client.warehouse_concept
collection = db.test_maps

map_pub = None
meta_pub = None
grid = OccupancyGrid()
whole_map = MapWithMetaData()


def db_stuff():
    global client, db, collection, grid, map_pub, meta_pub
    #
    
    rospy.init_node('turtlebot_db', anonymous=True)
    map_pub = rospy.Publisher('map', OccupancyGrid, latch=True)
    meta_pub = rospy.Publisher('map_metadata', MapMetaData, latch=True)
    #
    rospy.Service('save_map', MapSave, map_save)
    rospy.Service('map_all', MapUniversal, map_all)
    rospy.Service('load_map', MapLoad, map_load)
    rospy.Service('rename_map', MapRename, map_rename)
    rospy.Service('delete_map', MapDelete , map_delete )
    rospy.Service('list_map', MapList , map_list )
    #
    rospy.Subscriber("map", OccupancyGrid, callback_map) # THROWS WARNING!!
    
    #map_list(MapList())
    #req = MapSave()
    #req.name = "new-name2"
    #grid = create_map(None)
    #map_save(req)
    
    #idmap = MapLoad()
    #idmap.map_id = '1b4cb19c5e8f75871da5b40c3128dbaf'
    #map_load(idmap)
    #map_list(MapList())
    #
    rospy.spin()
    

def map_all(req):
    global map_pub, meta_pub
    if req.op == 0 : # list
        return map_list(req)
    #
    if req.op == 1 : # save
        return [ map_save(req) ]
    if req.op == 2 : # rename
        return [ map_rename(req) ]
    if req.op == 3 : # delete
        return [ map_delete(req) ]
    if req.op == 4 : # publish
        return [ map_load(req) ]
    return [[]]
    

def map_save(req):
    global collection, grid, whole_map
    whole_map.info.name = req.name
    whole_map.grid = grid
    newmap = MapWithMetaData()
    newmap = prep_map(whole_map)
    #
    newjson = rosjson.value_to_json(newmap)
    collection.insert(json.loads(newjson))
    return []

def map_loading(req):
    return 'kljhkljh'

def map_load(req):
    #
    global map_pub, meta_pub
    #
    whole_map = MapWithMetaData()
    whole_map = collection.find_one({ 'info.map_id' : req.map_id })
    if whole_map == None :
        return []# ['badmap']
    
    oldmap = OccupancyGrid()
    h = Header()
    oldmap.header = h
    oldmap.header.stamp.secs = 0
    oldmap.header.stamp.nsecs = 0
    
    oldmap.header.frame_id = 'map'
    #oldmap.header.seq = 0
    
    oldmap.info = MapMetaData()
    oldmap.info.map_load_time = rospy.Time() #
    oldmap.info.resolution = whole_map['grid']['info']['resolution']
    oldmap.info.width = whole_map['grid']['info']['width']
    oldmap.info.height = whole_map['grid']['info']['height']
    #
    
    oldmap.info.origin.position = Point()
    oldmap.info.origin.position.x = whole_map['grid']['info']['origin']['position']['x']
    oldmap.info.origin.position.y = whole_map['grid']['info']['origin']['position']['y']
    oldmap.info.origin.position.z = whole_map['grid']['info']['origin']['position']['z']
    
    oldmap.info.origin.orientation = Quaternion()
    oldmap.info.origin.orientation.x = whole_map['grid']['info']['origin']['orientation']['x']
    oldmap.info.origin.orientation.y = whole_map['grid']['info']['origin']['orientation']['y']
    oldmap.info.origin.orientation.z = whole_map['grid']['info']['origin']['orientation']['z']
    oldmap.info.origin.orientation.w = whole_map['grid']['info']['origin']['orientation']['w']
    
    oldmap.data = whole_map['grid']['data']
    
    # print oldmap
    # print whole_map
    
    map_pub.publish(oldmap)
    meta_pub.publish(oldmap.info)
    #
    return [] # ['done']

def map_rename(req):
    #
    global collection
    # x = MapWithMetaData()
    # print x.info.name
    collection.update({'info.map_id' : req.map_id}, {'$set' : { 'info.name' : req.name}})
    # print req.name
    return []

def map_delete(req):
    #
    global collection
    # x = MapWithMetaData()
    collection.remove({ 'info.map_id' : req.map_id})
    return []

def map_list(req):
    #
    maplist = []
    maps = collection.find()
    #num = maps.count()
    for x in maps : #range(num):
        onemap = MapListEntry()
        onemap.name = x['info']['name']
        onemap.map_id = x['info']['map_id']
        maplist.append(onemap)
        # print x
    return [ maplist ]

def callback_map(data):
    global grid #, whole_map
    #whole_map.grid = data
    #print data._connection_header
    grid = data
    # print '---------------------', grid
    return 

def prep_map(whole_map):
    #
    newmap = MapWithMetaData()
    #
    newmap.info = whole_map.info
    #
    newmap.info.date = str(datetime.datetime.utcnow())
    newmap.info.session_id = str(datetime.datetime.utcnow())
    newmap.info.map_id = str(hashlib.md5( str(datetime.datetime.utcnow()) ).hexdigest())
    #
    newmap.grid = whole_map.grid
    
    return newmap

def create_map(req ):
    if (req is not None):
        width = req.width 
        height = req.height 
    else :
        width = 10
        height = 25
    global map_pub
    h = Header()
    h.frame_id = 'map'
    test_map = OccupancyGrid()
    test_map.header = h
    test_map.info.resolution = 0.05 
    test_map.info.width = width
    test_map.info.height = height
    test_map.info.origin.position.x = 0 # width / 2
    test_map.info.origin.position.y = 0 # height / 2
    test_map.info.origin.position.z = 1.0
    test_map.info.origin.orientation.x = 0 
    test_map.info.origin.orientation.y = 0 
    test_map.info.origin.orientation.z = 0 
    test_map.info.origin.orientation.w = 0 
    test_map.data = []
    for i in range(0, (width*height)):
        test_map.data.append( 0) # ( i % 8 )
    #print test_map
    #map_pub.publish(test_map);
    my_map = test_map
    #map_pub.publish(my_map)
    #meta_pub.publish(my_map.info)
    return my_map

if __name__ == '__main__':
    try:
        db_stuff()
    except rospy.ROSInterruptException:
        pass
