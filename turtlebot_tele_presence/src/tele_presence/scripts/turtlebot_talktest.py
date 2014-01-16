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
    pub_cloud = rospy.Publisher("camera/depth_registered/points", PointCloud2)
    linearx = 1
    angularz = 1
    counter = 0
    while not rospy.is_shutdown():
        counter = counter + 1
        # make point cloud
        pcloud2 = make_cloud()
        # publish twist
        stamped = TwistStamped()
        stamped.header.seq = counter
        stamped.twist.linear.x = linearx + counter
        stamped.twist.angular.z = angularz + counter
        pub_twist.publish(stamped)
        # publish pointcloud
        pub_cloud.publish(pcloud2)
        rospy.loginfo(pcloud2)
        rospy.sleep(1.0)

def make_cloud() :
    pcloud = PointCloud2()
    c_height = 6
    c_width = 6
    # make point cloud
    fields = [PointField('x',0, PointField.INT16, 1)]
    cloud2 =  [1,2,6,1,2,6,
        1,2,6,1,2,6,
        1,2,6,1,2,6,
        1,2,6,1,2,6,
        1,2,6,1,2,6,
        1,2,6,1,2,6] 
    cloud_struct = struct.Struct(pc2._get_struct_fmt(False, fields))
    buff = ctypes.create_string_buffer(cloud_struct.size * len(cloud2))
    point_step, pack_into = cloud_struct.size, cloud_struct.pack_into
    offset = 0
    for p in cloud2:
        pack_into(buff, offset, p)
        offset += point_step
    pcloud.header.frame_id = '/map'
    pcloud2 = PointCloud2(header=pcloud.header,
        height=c_height,
        width=c_width, 
        is_dense=False,
        is_bigendian=False,
        fields=fields,
        point_step=cloud_struct.size,
        row_step= len(cloud2) / c_height,
        data=buff.raw)
    return pcloud2



if __name__ == '__main__':
    try:
        test()
    except rospy.ROSInterruptException:
        pass
