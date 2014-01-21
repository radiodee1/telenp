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
    pub_cloud = rospy.Publisher("/"+ basename + "/camera/depth_registered/points", PointCloud2)
    linearx = 1
    angularz = 1
    counter = 0
    while not rospy.is_shutdown():
        pcloud2 = make_cloud()
        # publish twist
        stamped = TwistStamped()
        stamped.header = Header()
        stamped.header.stamp = rospy.Time.now()
        stamped.twist.linear.x = linearx + counter
        stamped.twist.angular.z = angularz + counter
        # pub_twist.publish(stamped)
        # publish pointcloud
        pub_cloud.publish(pcloud2)
        rospy.loginfo(pcloud2)
        rospy.sleep(1.0)

def make_cloud() :
    # make point cloud
    cloud =  [[1,1,3],[2,1,33],[3,1,333],[4,1,344],[5,1,35],[6,1,36],
        [1,2,3],[2,2,33],[3,2,333],[4,2,344],[5,2,35],[6,2,36],
        [1,3,3],[2,3,33],[3,3,333],[4,3,344],[5,3,35],[6,3,36],
        [1,4,3],[2,4,33],[3,4,333],[4,4,344],[5,4,35],[6,4,36],
        [1,5,3],[2,5,33],[3,5,333],[4,5,344],[5,5,35],[6,5,36],
        [1,6,3],[2,6,33],[3,6,333],[4,6,344],[5,6,35],[6,6,36]] 
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
