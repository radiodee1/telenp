#!/usr/bin/env python
import rospy
import numpy as np
import math
import sensor_msgs.point_cloud2 as pc2
from roslib import message

from std_msgs.msg import String
from std_msgs.msg import Header
from std_msgs.msg import UInt8

from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Vector3
from sensor_msgs.msg import PointCloud2, PointField

mod_base = 512
boundary_depth = 1
mult = 5000

linear_x = 0
angular_z = 0
seq_counter = 0
kinect_obstruction = False
kinect_left = False
kinect_middle = False
kinect_right = False
basename = "telenp"
twist = Twist()
# order of axis in point cloud tuple
xx = 0
yy = 1
zz = 2


def listen():
    rospy.init_node('turtlebot_listen', anonymous=True)
    global kinect_obstruction
    global kinect_left, kinect_right, kinect_middle
    kinect_obstruction = False
    kinect_left = False
    kinect_right = False
    kinect_middle = False
    rospy.Subscriber('/' + basename + "/command_velocity", TwistStamped, callback_move)
    #rospy.Subscriber("/camera/depth_registered/points", PointCloud2, callback_kinect)
    rospy.Subscriber("/camera/depth/points", PointCloud2, callback_kinect)
    pub_kinect = rospy.Publisher('/'+ basename +'/kinect_feedback', UInt8, latch=True)
    while not rospy.is_shutdown():
        str1 = "hello world " + str (rospy.get_time())
        if not kinect_obstruction :
            rospy.loginfo(str1)
        temp_var = 0
        if (kinect_left) :
            temp_var = temp_var + 4
        if (kinect_middle) :
            temp_var = temp_var + 2
        if (kinect_right) :
            temp_var = temp_var + 1
        pub_kinect.publish (np.uint8(temp_var))
        rospy.loginfo("kinect feedback " + str(temp_var) )
        temp_var = 0
        kinect_obstruction = False
        kinect_left = False
        kinect_right = False
        kinect_middle = False
        rospy.sleep(1.0)

def callback_move(data):
    pub_move = rospy.Publisher('/mobile_base/commands/velocity', Twist)
    global twist ;
    #rospy.loginfo(rospy.get_name() + ": I heard " + str( data.header.seq)) #non-standard use of 'seq'
    # global vars
    global seq_counter, linear_x, angular_z , kinect_obstruction
    # don't use 'seq' from 'header'
    linear_x = 0;
    angular_z = 0;
    if not kinect_obstruction or data.twist.linear.x < 0 : 
        linear_x = data.twist.linear.x
        kinect_obstruction = False
    else :
        linear_x = 0
    if data.twist.angular.z != 0 or data.twist.linear.x < 0 :
        angular_z = data.twist.angular.z
        kinect_obstruction = False
    # twist output
    twist = Twist();
    twist.linear.x = linear_x
    twist.linear.y = 0;
    twist.linear.z = 0;
    twist.angular.x = 0;
    twist.angular.y = 0;
    twist.angular.z = angular_z
    pub_move.publish(twist)
    rospy.loginfo(twist)


def callback_kinect(data) :
    # no obstruction to start
    global kinect_obstruction
    global kinect_left, kinect_right, kinect_middle
    rospy.loginfo("kinect " + str(kinect_obstruction))
    # pick a height
    rospy.loginfo(str(data.width) + " -- " + str(data.height));
    # pick three x coords near front and center
    height = int( data.height / 2 ) 
    line =  int (data.width) 
    #
    left_x =  int ( line * 3 / 8) 
    middle_x =  int ( line / 2) 
    right_x =  int ( line - ( line * 3 / 8 )) 
    #
    rospy.loginfo("left middle right height " + \
        str(left_x) + " " + str(middle_x) + " " +str(right_x) +" "+ str(height)  )
    #
    rospy.loginfo(str (read_depth_tuple(middle_x, height, data)) )
    #rospy.loginfo(str(data.fields))
    # examine three points
    left = read_depth (left_x, height, data)
    middle = read_depth (middle_x, height, data)
    right = read_depth (right_x, height, data)
    # do stuff
    if (math.isnan(left)  or math.isnan(middle) or math.isnan(right) ) :
        rospy.loginfo("exit -- bad depth : " + str(not math.isnan(left)) + " " +\
            str(not math.isnan(middle)) + " " + str( not math.isnan(right)))
        #return
    kinect_obstruction = False
    kinect_left = False
    kinect_right = False
    kinect_middle = False
    if ( not math.isnan(left) and left * mult < boundary_depth) :
        kinect_obstruction = True
        kinect_left = True
        rospy.loginfo("HIT ON KINECT!! LEFT")
    if ( not math.isnan(middle) and middle * mult < boundary_depth) :
        kinect_obstruction = True
        kinect_middle = True
        rospy.loginfo("HIT ON KINECT!! MIDDLE")
    if ( not math.isnan(right) and right * mult < boundary_depth) :
        kinect_obstruction = True
        kinect_right = True
        rospy.loginfo("HIT ON KINECT!! RIGHT")
    # exit ?
    if ( kinect_obstruction ) :
        rospy.loginfo("HIT ON KINECT!!")
    # form reply message


def read_depth(width, height, data) :
    return (read_depth_tuple(width, height, data) )[zz]


def read_depth_tuple(width, height, data) :
    #
    data_out = pc2.read_points(data, field_names=None, skip_nans=False, uvs=[[width, height]])
    return next(data_out)


if __name__ == '__main__':
    try:
        listen()
    except rospy.ROSInterruptException:
        pass
