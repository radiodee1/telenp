#!/usr/bin/env python
import rospy
import numpy as np
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
boundary_depth = 5
mult = 1

linear_x = 0
angular_z = 0
seq_counter = 0
kinect_obstruction = False
kinect_left = False
kinect_middle = False
kinect_right = False
basename = "telenp"
twist = Twist()

def listen():
    rospy.init_node('turtlebot_listen', anonymous=True)
    global kinect_obstruction
    global kinect_left, kinect_right, kinect_middle
    kinect_obstruction = False
    kinect_left = False
    kinect_right = False
    kinect_middle = False
    #rospy.Subscriber('/' + basename + "/command_velocity", TwistStamped, callback_move)
    rospy.Subscriber("/" + basename + "/camera/depth/points", PointCloud2, callback_kinect)
    rospy.Subscriber("/camera/depth/points", PointCloud2, callback_kinect)
    pub_kinect = rospy.Publisher('/'+ basename +'/kinect_feedback', UInt8)
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
    rospy.loginfo(rospy.get_name() + ": I heard " + str( data.header.seq)) #non-standard use of 'seq'
    # global vars
    global seq_counter, linear_x, angular_z , kinect_obstruction
    # don't use 'seq' from 'header'
    if not kinect_obstruction  : 
        linear_x = data.twist.linear.x
        angular_z = data.twist.angular.z
    else :
        linear_x = 0
        angular_z = data.twist.angular.z
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
    rospy.loginfo("detect kinect")
    # no obstruction to start
    global kinect_obstruction
    global kinect_left, kinect_right, kinect_middle
    # kinect_obstruction = True
    rospy.loginfo("kinect " + str(kinect_obstruction))
    # pick a height
    rospy.loginfo("height " + str(data.height) + " width " + str(data.width))
    start = read_depth_tuple(0, 0, data)
    end = read_depth_tuple( (data.width - 1), 0 , data)
    rospy.loginfo("start " + str(start) + " -- end " + str(end) )
    xx = 0
    yy = 1
    zz = 0
    height =  int ((end[zz] - start[zz]) / 2)
    # pick three x coords near front and center
    padding = int (height * (end[zz] - start[zz])) 
    left_x =  int ( (end[yy] - start[yy]) * 3 / 8) + padding
    middle_x =  int ( (end[yy] - start[yy]) / 2) + padding
    right_x =  int ( (end[yy] -start[yy]) - ( (end[yy] - start[yy]) * 3 / 8 )) + padding
    
    rospy.loginfo("left middle right height " + \
        str(left_x) + " " + str(middle_x) + " " +str(right_x) +" "+ str(height))
    
    # examine three points
    left = read_depth (left_x, 0, data)
    middle = read_depth (middle_x, 0, data)
    right = read_depth (right_x, 0, data)
    # do stuff
    if (left == -1 or middle == -1 or right == -1) :
        rospy.loginfo("exit -- bad depth")
        return
    kinect_obstruction = False
    kinect_left = False
    kinect_right = False
    kinect_middle = False
    if (left * mult < boundary_depth) :
        kinect_obstruction = True
        kinect_left = True
    if (middle * mult < boundary_depth) :
        kinect_obstruction = True
        kinect_middle = True
    if (right * mult < boundary_depth) :
        kinect_obstruction = True
        kinect_right = True
    # exit ?
    if ( kinect_obstruction ) :
        rospy.loginfo("HIT ON KINECT!!")
    # form reply message


def read_depth(width, height, data) :
    return (read_depth_tuple(width, height, data) )[2]


def read_depth_tuple(width, height, data) :
    # read function
    if (height > data.height) :
        rospy.loginfo("data height "+ str(data.height) )
        return -1
    if (width > data.width) :
        return -2
    data_out = pc2.read_points(data, field_names=None, skip_nans=False, uvs=[[width, height]])
    int_data = next(data_out) # this returns a tuple!!
    #rospy.loginfo("out_data " + str(  mult * int_data[2]) + " all info: " + str(int_data))
    #rospy.loginfo("length " + str(len( int_data)))
    return int_data # [2] # 0 is x, 1 is y, 2 is z
        

if __name__ == '__main__':
    try:
        listen()
    except rospy.ROSInterruptException:
        pass
