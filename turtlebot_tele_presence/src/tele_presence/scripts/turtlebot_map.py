#!/usr/bin/env python
import rospy
#import numpy as np
#import sensor_msgs.point_cloud2 as pc2

import roslib
#roslib.load_manifest('tele_presence') # map_store

import sys
import map_store.srv

from nav_msgs.msg import *
from nav_msgs.srv import *
from map_store.srv import *

from roslib import message

#from std_msgs.msg import String
#from std_msgs.msg import Header
#from std_msgs.msg import UInt8
from tele_presence.msg import * # MapListEntryList

#from geometry_msgs.msg import Twist
#from geometry_msgs.msg import TwistStamped
#from geometry_msgs.msg import Vector3
#from sensor_msgs.msg import PointCloud2, PointField

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
        initial_map_list.append(m.map_id)
        print "map: " , m.map_id
    print "done" 
    list_message.len = len(list_maps)
    list_message.list = list_maps
    pub_list.Publish(list_message)


if __name__ == '__main__':
    try:
        map_stuff()
    except rospy.ROSInterruptException:
        pass
