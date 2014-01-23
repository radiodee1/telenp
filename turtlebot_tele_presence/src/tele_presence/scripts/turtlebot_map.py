#!/usr/bin/env python
import rospy
import numpy as np
import sensor_msgs.point_cloud2 as pc2

import roslib; roslib.load_manifest('map_store')
import sys
import unittest
from nav_msgs.msg import *
from nav_msgs.srv import *
from map_store.srv import *

from roslib import message

from std_msgs.msg import String
from std_msgs.msg import Header
from std_msgs.msg import UInt8

from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Vector3
from sensor_msgs.msg import PointCloud2, PointField

basename = "telenp"


def map_stuff():
    rospy.init_node('turtlebot_map', anonymous=True)
    rospy.Subscriber('/' + basename + "/command_velocity", TwistStamped, callback_list)
    #rospy.Subscriber("/" + basename + "/camera/depth/points", PointCloud2, callback_kinect)
    #rospy.Subscriber("/camera/depth/points", PointCloud2, callback_kinect)
    pub_kinect = rospy.Publisher('/'+ basename +'/kinect_feedback', UInt8)
    while not rospy.is_shutdown():
        temp_var = 0
        pub_kinect.publish (np.uint8(temp_var))
        rospy.loginfo("kinect feedback " + str(temp_var) )
        rospy.sleep(1.0)

def callback_list(data):
    pub_move = rospy.Publisher('/mobile_base/commands/velocity', Twist)
    global twist ;
    rospy.loginfo(rospy.get_name() + ": I heard " + str( data.header.seq)) #non-standard use of 'seq'
    # global vars
    global seq_counter, linear_x, angular_z , kinect_obstruction
    # don't use 'seq' from 'header'
    if not kinect_obstruction  : 
        linear_x = data.twist.linear.x
        angular_z = data.twist.angular.z
    else :
        linear_x = 0
        angular_z = data.twist.angular.z
    # twist output
    twist = Twist();
    twist.linear.x = linear_x
    twist.linear.y = 0;
    twist.linear.z = 0;
    twist.angular.x = 0;
    twist.angular.y = 0;
    twist.angular.z = angular_z
    pub_move.publish(twist)
    rospy.loginfo(twist)


if __name__ == '__main__':
    try:
        map_stuff()
    except rospy.ROSInterruptException:
        pass
