#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from std_msgs.msg import Header

from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Vector3

def test():
    rospy.init_node('turtlebot_talktest', anonymous=True)
    pub_twist = rospy.Publisher("instructions/command_velocity", TwistStamped)
    linearx = 111
    angularz = 222
    counter = 0
    while not rospy.is_shutdown():
        counter = counter + 1
        stamped = TwistStamped()
        stamped.header.seq = counter
        stamped.twist.linear.x = linearx + counter
        stamped.twist.angular.z = angularz + counter
        pub_twist.publish(stamped)
        rospy.loginfo(stamped)
        rospy.sleep(1.0)






if __name__ == '__main__':
    try:
        test()
    except rospy.ROSInterruptException:
        pass
