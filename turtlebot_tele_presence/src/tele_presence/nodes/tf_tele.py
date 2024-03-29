#!/usr/bin/env python  
import roslib
roslib.load_manifest('tele_presence')
import rospy

import tf
import nav_msgs.msg 

name_from = 'map'
name_to = 'base_link'

def handle_baselink(msg):
    br = tf.TransformBroadcaster()
    br.sendTransform( (0,0,0),# ( - msg.info.origin.position.x , - msg.info.origin.position.y , 0),
                     tf.transformations.quaternion_from_euler(0, 0, 0),
                     rospy.Time.now(),
                     name_to, #child
                     name_from) #parent

if __name__ == '__main__':
    rospy.init_node('tf_tele')
    rospy.Subscriber(name_from,
                     nav_msgs.msg.OccupancyGrid,
                     handle_baselink)
    rospy.spin()
