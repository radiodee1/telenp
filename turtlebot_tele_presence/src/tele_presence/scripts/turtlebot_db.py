#!/usr/bin/env python

import rospy
from pymongo import MongoClient
import datetime
import hashlib

from nav_msgs.msg import *
from nav_msgs.srv import *
from std_msgs.msg import *
from tele_presence.msg import *

client = MongoClient('localhost', 27017)
db = client.warehouse_concept
collection = db.test_maps

grid = OccupancyGrid()
whole_map = MapWithMetaData()

def db_stuff():
    global client, db, collection
    #
    rospy.init_node('turtlebot_db', anonymous=True)
    map_pub = rospy.Publisher('/map', OccupancyGrid, latch=True)
    rospy.Subscriber("/map", OccupancyGrid, callback_map)
    #
    rospy.Service('save_map', MapSave, map_save)
    rospy.Service('load_map', MapLoad, map_load)
    rospy.Service('rename_map', MapRename, map_rename)
    rospy.Service('delete_map', MapDelete , map_delete )
    rospy.Service('list_map', MapList , map_list )
    #
    #
    #
    while not rospy.is_shutdown():
        #
        rospy.sleep(1.0)

def map_save(req):
    global collection, grid, whole_map
    whole_map.name = req.name
    newmap = MapWithMetaData()
    newmap = prep_map(whole_map)
    collection.insert(whole_map)
    return

def map_load(req):
    #
    return

def map_rename(req):
    #
    return

def map_delete(req):
    #
    return

def map_list(req):
    #
    return

def callback_map(data):
    global grid, whole_map
    whole_map.grid = data
    #
    print grid
    return

def prep_map(whole_map):
    #
    newmap = MapWithMetaData()
    #
    newmap.date = datetime.datetime.utcnow()
    newmap.sesion_id = str(datetime.datetime.utcnow())
    newmap.map_id = hashlib.md5( datetime.datetime.utcnow() ).hexdigest()
    print newmap.map_id
    return newmap

if __name__ == '__main__':
    try:
        db_stuff()
    except rospy.ROSInterruptException:
        pass
