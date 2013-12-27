#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from std_msgs.msg import Header
from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped

def listen():
    rospy.Subscriber("instructions/command_velocity", TwistStamped, callback)
    pub_string = rospy.Publisher('chatter', String)
    pub_move = rospy.Publisher('/mobile_base/commands/velocity', Twist)
    rospy.init_node('turtlebot_listen', anonymous=True)
    while not rospy.is_shutdown():
        str = "hello world %s" % rospy.get_time()
        rospy.loginfo(str)
        pub_string.publish(String(str))
        pub_move.publish(String(str))
        rospy.sleep(1.0)

def callback(data):
    rospy.loginfo(rospy.get_name() + ": I heard %s" % data.data)


def listener_x():
    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("chatter", String, callback)
    rospy.spin()




if __name__ == '__main__':
    try:
        listen()
    except rospy.ROSInterruptException:
        pass
