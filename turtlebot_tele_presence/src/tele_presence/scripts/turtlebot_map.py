#!/usr/bin/env python

import rospy
import sys

#from tele_presence.msg import MapListEntryList, MapListElement
from tele_presence.srv import CreateMap
from nav_msgs.msg import *
from nav_msgs.srv import *
from map_store.srv import *
from std_msgs.msg import *

#from roslib import message

map_pub = None
my_map = OccupancyGrid()

def map_stuff():
    global my_map, map_pub
    rospy.init_node('turtlebot_map', anonymous=True)
    map_pub = rospy.Publisher('/map', OccupancyGrid, latch=True)
    req = None
    create_map(req)
    rospy.Service('new_map', CreateMap, create_map)
    #
    while not rospy.is_shutdown():
        #if (my_map.info.width is not 0) :
            #
        rospy.spin()

def create_map(req ):
    if (req is not None):
        width = req.width
        height = req.height
    else :
        width = 10
        height = 10
    global my_map, map_pub
    h = Header()
    h.frame_id = ''
    test_map = OccupancyGrid()
    test_map.header = h
    test_map.info.resolution = 1.0 
    test_map.info.width = width
    test_map.info.height = height
    test_map.info.origin.position.x = width / 2
    test_map.info.origin.position.y = height / 2
    test_map.info.origin.position.z = 1.0
    test_map.info.origin.orientation.x = 1.0 
    test_map.info.origin.orientation.y = 1.0 
    test_map.info.origin.orientation.z = 1.0 
    test_map.info.origin.orientation.w = 1.0 
    test_map.data = []
    for i in range(0, (width*height)):
        test_map.data.append(1)
    print test_map
    #map_pub.publish(test_map);
    my_map = test_map
    map_pub.publish(my_map)
    return []

if __name__ == '__main__':
    try:
        map_stuff()
    except rospy.ROSInterruptException:
        pass
