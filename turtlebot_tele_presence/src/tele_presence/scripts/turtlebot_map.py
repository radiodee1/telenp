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


basename = "telenp"

def map_stuff():
    rospy.init_node('turtlebot_map', anonymous=True)
    if not rospy.is_shutdown():
        #
        #rospy.Service('new_map', CreateMap, create_map)
        create_map()
        #create_map(0)
        print "ready to make new map."
        rospy.spin()

def create_map( ):
    h = Header()
    h.frame_id = ''
    test_map = OccupancyGrid()
    test_map.header = h
    test_map.info.resolution = 1.0 
    test_map.info.width = 10
    test_map.info.height = 10
    test_map.info.origin.position.x = 0.0 
    test_map.info.origin.position.y = 1.0 
    test_map.info.origin.position.z = 2.0 
    test_map.info.origin.orientation.x = 3.0 
    test_map.info.origin.orientation.y = 4.0 
    test_map.info.origin.orientation.z = 5.0 
    test_map.info.origin.orientation.w = 6.0 
    test_map.data = []
    for i in range(0, 100):
        test_map.data.append(i)
    print test_map
    map_pub = rospy.Publisher('/map', OccupancyGrid)
    map_pub.publish(test_map);
    return #test_map

if __name__ == '__main__':
    try:
        map_stuff()
    except rospy.ROSInterruptException:
        pass
