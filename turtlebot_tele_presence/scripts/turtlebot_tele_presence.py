#!/usr/bin/env python
import rospy
from std_msgs.msg import String


def talker():
    pub_string = rospy.Publisher('chatter', String)
    pub_move = rospy.Publisher('movement', String)
    rospy.init_node('turtlebot_tele_presence')
    while not rospy.is_shutdown():
        str = "hello world %s" % rospy.get_time()
        rospy.loginfo(str)
        pub_string.publish(String(str))
        pub_move.publish(String(str))
        rospy.sleep(1.0)


if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
