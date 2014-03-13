#!/usr/bin/env python

import rospy
from pymongo import MongoClient
import datetime
import hashlib

import rosjson 
import json, ast

from nav_msgs.msg import *
from nav_msgs.srv import *
from std_msgs.msg import *
from tele_presence.msg import *
from tele_presence.srv import *

client = MongoClient('localhost', 27018) #NON STANDARD PORT NUM
db = client.warehouse_concept
collection = db.test_maps

map_pub = None
my_map = OccupancyGrid()
grid = OccupancyGrid()
whole_map = MapWithMetaData()


def db_stuff():
    global client, db, collection, grid, map_pub, meta_pub
    #
    rospy.init_node('turtlebot_db', anonymous=True)
    map_pub = rospy.Publisher('/map', OccupancyGrid, latch=True)
    meta_pub = rospy.Publisher('/map_metadata', MapMetaData, latch=True)
    rospy.Subscriber("/map", OccupancyGrid, callback_map)
    #
    rospy.Service('save_map', MapSave, map_save)
    rospy.Service('load_map', MapLoad, map_load)
    rospy.Service('rename_map', MapRename, map_rename)
    rospy.Service('delete_map', MapDelete , map_delete )
    rospy.Service('list_map', MapList , map_list )
    #
    map_list(MapList())
    req = MapSave()
    req.name = "dave-n-such"
    grid = create_map(None)
    map_save(req)
    #map_list(MapList())
    #
    #
    while not rospy.is_shutdown():
        #
        rospy.sleep(1.0)

def map_save(req):
    global collection, grid, whole_map
    whole_map.info.name = req.name
    whole_map.grid = grid
    newmap = MapWithMetaData()
    newmap = prep_map(whole_map)
    #
    newjson = rosjson.value_to_json(newmap)
    collection.insert(json.loads(newjson))
    return

def map_load(req):
    #
    whole_map = MapWithMetaData()
    whole_map = collection.find_one({ info.map_id : req.map_id })
    oldmap = OccupancyGrid()
    oldmap = whole_map.grid
    map_pub.publish(oldmap)
    meta_pub.publish(oldmap.info)
    #
    return

def map_rename(req):
    #
    global collection
    # x = MapWithMetaData()
    print x.info.name
    collection.update({info.map_id : req.map_id},{ info.name : req.name})
    print req.name
    return

def map_delete(req):
    #
    global collection
    # x = MapWithMetaData()
    collection.remove({info.map_id: req.map_id})
    return

def map_list(req):
    #
    maps = collection.find()
    num = maps.count()
    for x in maps : #range(num):
        print x
        print (x)['info']['map_id'] #nothing??
        #print item
        #for u in item:
        #    #print u
        #    if u == '_id' :
        #        print u
    return

def callback_map(data):
    global grid, whole_map
    whole_map.grid = data
    #
    grid = data
    #print grid
    return

def prep_map(whole_map):
    #
    newmap = MapWithMetaData()
    #
    newmap.info = whole_map.info
    #
    newmap.info.date = datetime.datetime.utcnow()
    newmap.info.session_id = str(datetime.datetime.utcnow())
    newmap.info.map_id = str(hashlib.md5( str(datetime.datetime.utcnow()) ).hexdigest())
    #whole_map.grid = newmap
    newmap.grid = whole_map.grid
    #
    print newmap.info.map_id
    print newmap.info.session_id
    print newmap.info.date
    return newmap

def create_map(req ):
    if (req is not None):
        width = req.width 
        height = req.height 
    else :
        width = 10
        height = 25
    global my_map, map_pub
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
    map_pub.publish(my_map)
    meta_pub.publish(my_map.info)
    return my_map

if __name__ == '__main__':
    try:
        db_stuff()
    except rospy.ROSInterruptException:
        pass
