#!/usr/bin/env python
import rospy

#import roslib
#roslib.load_manifest('tele_presence') # map_store

import sys
#import map_store.srv
#import tele_presence
from tele_presence.msg import MapListEntryList, MapListElement
from nav_msgs.msg import *
from nav_msgs.srv import *
from map_store.srv import *

from roslib import message


# type 'rosrun map_store map_manager' to start...
# or 'roslaunch tele_presence full.launch' to start...

basename = "telenp"


def map_stuff():
    rospy.init_node('turtlebot_map', anonymous=True)
    while not rospy.is_shutdown():
        #
        try_list()
        rospy.sleep(1.0)

def try_list():
    pub_list = rospy.Publisher("/" + basename + '/map_list', MapListEntryList)
    list_message = MapListEntryList()
    #
    rospy.wait_for_service("/list_maps")
    list_maps = rospy.ServiceProxy('/list_maps', map_store.srv.ListMaps)
    initial_map_list = []
    for m in list_maps().map_list:
        element = MapListElement()
        element.name = m.name
        element.id = m.map_id
        initial_map_list.append(element)
        print "map: " , element.name
    print "done" 
    list_message.len = len(initial_map_list)
    list_message.list = initial_map_list
    pub_list.publish(list_message)
    
def save_a_map() :
    #if (list_message.len == 0) :
        newmap = create_map( 0 ) 
        #print newmap
        #Create services, publishers, and subscribers
        map_pub = rospy.Publisher('/map', OccupancyGrid)
        map_pub.publish(newmap)
        #test_map_sub = rospy.Subscriber('/test_map', OccupancyGrid, on_map)
        #dynamic_map = rospy.Service('dynamic_map', GetMap, lambda x: GetMapResponse(map=test_map_2))
        #print "Wait for /list_maps"
        #rospy.wait_for_service("/list_maps")
        #list_maps = rospy.ServiceProxy('/list_maps', map_store.srv.ListMaps)
        print "Wait for /name_latest_map"
        rospy.wait_for_service("/save_map")
        save_map = rospy.ServiceProxy('/save_map', map_store.srv.SaveMap)
        #print "Wait for /delete_map"
        #rospy.wait_for_service("/delete_map")
        #delete_map = rospy.ServiceProxy('/delete_map', map_store.srv.DeleteMap)
        #print "Wait for /rename_map"
        #rospy.wait_for_service("/rename_map")
        #rename_map = rospy.ServiceProxy('/rename_map', map_store.srv.RenameMap)
        print "Wait for /publish_map"
        rospy.wait_for_service("/publish_map")
        publish_map = rospy.ServiceProxy('/publish_map', map_store.srv.PublishMap)
        #print "Wait for /test_dynamic_map"
        #rospy.wait_for_service("/test_dynamic_map")
        #test_dynamic_map = rospy.ServiceProxy('/test_dynamic_map', map_store.srv.GetMap)
        #
        #rospy.wait_for_service("/save_map")
        #name_latest_map = rospy.ServiceProxy('/save_map', SaveMap)
        saved_map_name = "test_map_srv"
        save_map(map_name=saved_map_name)

def on_map( data ) :
    print "found ", data

def create_map( d):
    test_map = OccupancyGrid()
    test_map.info.resolution = 1.0 + d
    test_map.info.width = 10
    test_map.info.height = 10
    test_map.info.origin.position.x = 0.0 + d
    test_map.info.origin.position.y = 1.0 + d
    test_map.info.origin.position.z = 2.0 + d
    test_map.info.origin.orientation.x = 3.0 + d
    test_map.info.origin.orientation.y = 4.0 + d
    test_map.info.origin.orientation.z = 5.0 + d
    test_map.info.origin.orientation.w = 6.0 + d
    test_map.data = []
    for i in range(0, 100):
        test_map.data.append(i)
    return test_map

if __name__ == '__main__':
    try:
        map_stuff()
    except rospy.ROSInterruptException:
        pass
