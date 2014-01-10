#!/usr/bin/env python
import rospy
import sensor_msgs.point_cloud2 as pc2
from roslib import message
from std_msgs.msg import String
from std_msgs.msg import Header

from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Vector3
from sensor_msgs.msg import PointCloud2, PointField

def test():
    rospy.init_node('turtlebot_talktest', anonymous=True)
    pub_twist = rospy.Publisher("instructions/command_velocity", TwistStamped)
    pub_cloud = rospy.Publisher("camera/depth_registered/points", PointCloud2)
    linearx = 111
    angularz = 222
    counter = 0
    while not rospy.is_shutdown():
        counter = counter + 1
        pcloud = PointCloud2()
        # make point cloud
        cloud = [[99,77,11],[55,33,22],[44,88,66],[99,77,11],[55,33,22],[44,88,66],
            [99,77,11],[55,33,22],[44,88,66],[99,77,11],[55,33,22],[44,88,66],
            [99,77,11],[55,33,22],[44,88,66],[99,77,11],[55,33,22],[44,88,66],
            [99,77,11],[55,33,22],[44,88,66],[99,77,11],[55,33,22],[44,88,66],
            [99,77,11],[55,33,22],[44,88,66],[99,77,11],[55,33,22],[44,88,66],
            [99,77,11],[55,33,22],[44,88,66],[99,77,11],[55,33,22],[44,88,66]]
        pcloud = pc2.create_cloud_xyz32(pcloud.header, cloud)
        pcloud.height = 6
        pcloud.width = 6
        stamped = TwistStamped()
        stamped.header.seq = counter
        stamped.twist.linear.x = linearx + counter
        stamped.twist.angular.z = angularz + counter
        pub_twist.publish(stamped)
        pub_cloud.publish(pcloud)
        #rospy.loginfo(stamped)
        rospy.loginfo(pcloud)
        rospy.sleep(1.0)






if __name__ == '__main__':
    try:
        test()
    except rospy.ROSInterruptException:
        pass
