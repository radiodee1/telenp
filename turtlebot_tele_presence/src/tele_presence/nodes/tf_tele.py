#!/usr/bin/env python  
import roslib
roslib.load_manifest('tele_presence')
import rospy

import tf
#import turtlesim.msg
import nav_msgs.msg 

name_from = 'map'
name_to = 'base_link'

def handle_baselink(msg):
    br = tf.TransformBroadcaster()
    br.sendTransform((msg.info.origin.position.x, msg.info.origin.position.y, 0),
                     tf.transformations.quaternion_from_euler(0, 0, 0),
                     rospy.Time.now(),
                     name_to,
                     name_from)

if __name__ == '__main__':
    rospy.init_node('tf_tele')
    rospy.Subscriber('map',
                     nav_msgs.msg.OccupancyGrid,
                     handle_baselink)
    rospy.spin()
