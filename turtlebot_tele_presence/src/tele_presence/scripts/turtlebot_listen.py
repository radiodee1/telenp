#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from std_msgs.msg import Header

from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Vector3

linear_x = 0
angular_z = 0
seq_counter = 0

def listen():
    rospy.init_node('turtlebot_listen', anonymous=True)
    rospy.Subscriber("instructions/command_velocity", TwistStamped, callback)
    while not rospy.is_shutdown():
        str = "hello world " + rospy.get_time()
        rospy.loginfo(str)
        #stamped = TwistStamped()
        #stamped.header.seq = 20
        #stamped.twist.linear.x = 111
        #stamped.twist.angular.z = 222
        rospy.sleep(1.0)

def callback(data):
    pub_move = rospy.Publisher('/mobile_base/commands/velocity', Twist)
    rospy.loginfo(rospy.get_name() + ": I heard " + data.header.seq)
    linear_x = data.twist.linear.x
    angular_z = data.twist.angular.z
    twist = Twist();
    twist.linear.x = linear_x
    twist.linear.y = 0;
    twist.linear.z = 0;
    twist.angular.x = 0;
    twist.angular.y = 0;
    twist.angular.z = angular_z
    pub_move.publish(twist)


def listener_x():
    rospy.spin()




if __name__ == '__main__':
    try:
        listen()
    except rospy.ROSInterruptException:
        pass
