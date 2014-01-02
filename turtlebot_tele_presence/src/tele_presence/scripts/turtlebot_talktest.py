#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from std_msgs.msg import Header

from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Vector3
from sensor_msgs.msg import PointCloud2

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
        pcloud.data = [33,33,33,33,33,33,33,33,33,33,  
            22,22,22,22,22,22,22,22,22,22, 
            11,11,11,11,11,11,11,11,11,11]
        pcloud.is_bigendian = True
        pcloud.point_step = 2
        pcloud.row_step = 10
        pcloud.width = 5
        pcloud.height = 3
        pub_cloud.publish(pcloud)
        stamped = TwistStamped()
        stamped.header.seq = counter
        stamped.twist.linear.x = linearx + counter
        stamped.twist.angular.z = angularz + counter
        pub_twist.publish(stamped)
        #rospy.loginfo(stamped)
        rospy.loginfo(pcloud)
        rospy.sleep(1.0)






if __name__ == '__main__':
    try:
        test()
    except rospy.ROSInterruptException:
        pass
