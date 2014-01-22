#!/usr/bin/env python
import rospy
import roslib; roslib.load_manifest('sensor_msgs')

import ctypes
import math
import struct

import sensor_msgs.point_cloud2 as pc2
from roslib import message
from std_msgs.msg import String
from std_msgs.msg import Header

from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Vector3
from sensor_msgs.msg import PointCloud2, PointField

basename = "telenp"

def test():
    rospy.init_node('turtlebot_talktest', anonymous=True)
    pub_twist = rospy.Publisher("/" + basename + "/command_velocity", TwistStamped)
    pub_cloud = rospy.Publisher("/"+ basename + "/camera/depth/points", PointCloud2)
    linearx = 0
    angularz = 0
    counter = 0
    while not rospy.is_shutdown():
        pcloud2 = make_cloud()
        # publish twist for testing only!!
        stamped = TwistStamped()
        stamped.header = Header()
        stamped.header.stamp = rospy.Time.now()
        stamped.twist.linear.x = linearx + counter
        stamped.twist.angular.z = angularz + counter
        pub_twist.publish(stamped)
        # publish pointcloud
        pub_cloud.publish(pcloud2)
        rospy.loginfo(pcloud2)
        rospy.sleep(1.0)

def make_cloud() :
    # make point cloud
    cloud =  [[3,1,1],[33,2,1],[333,3,1],[344,4,1],[35,5,1],[36,6,1],
        [3,1,2],[33,2,2],[333,3,2],[344,4,2],[35,5,2],[36,6,2],
        [3,1,3],[33,2,3],[333,3,3],[344,4,3],[35,5,3],[36,6,3],
        [3,1,4],[33,2,4],[333,3,4],[344,4,4],[35,5,4],[36,6,4],
        [3,1,5],[33,2,5],[333,3,5],[344,4,5],[35,5,5],[36,6,5],
        [3,1,6],[33,2,6],[333,3,6],[344,4,6],[35,5,6],[36,6,6]] 
    header = Header()
    header.stamp = rospy.Time.now()
    header.frame_id = 'base_footprint'
    pcloud2 = pc2.create_cloud_xyz32(header ,cloud);
    return pcloud2



if __name__ == '__main__':
    try:
        test()
    except rospy.ROSInterruptException:
        pass
