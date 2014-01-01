#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from std_msgs.msg import Header

from geometry_msgs.msg import Twist
from geometry_msgs.msg import TwistStamped
from geometry_msgs.msg import Vector3
from sensor_msgs.msg import PointCloud2

mod_base = 16
linear_x = 0
angular_z = 0
seq_counter = 0
kinect_obstruction = False

def listen():
    rospy.init_node('turtlebot_listen', anonymous=True)
    rospy.Subscriber("instructions/command_velocity", TwistStamped, callback_move)
    rospy.Subscriber("camera/depth_registered/points", PointCloud2, callback_kinect)
    # remove me!!
    while not rospy.is_shutdown():
        str = "hello world %f" % rospy.get_time()
        rospy.loginfo(str)
        # callback_kinect(PointCloud2())
        rospy.sleep(1.0)

def callback_move(data):
    pub_move = rospy.Publisher('/mobile_base/commands/velocity', Twist)
    rospy.loginfo(rospy.get_name() + ": I heard " + str( data.header.seq))
    # global vars
    global seq_counter
    global linear_x
    global angular_z
    global kinect_obstruction
    # check seq counter
    seq_counter = seq_counter + 1
    seq_counter = seq_counter % mod_base
    if seq_counter == 0 :
        seq_counter = seq_counter + 1
    if data.header.seq == 0 :
        seq_counter = 0
    # linear_x
    if (not kinect_obstruction ) and ( seq_counter == data.header.seq )  :
        linear_x = data.twist.linear.x
    else :
        linear_x = 0
    # angular_z
    if seq_counter == data.header.seq :
        angular_z = data.twist.angular.z
    else :
        andular_z = 0
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
    # kinect_obstruction = True
    rospy.loginfo("kinect " + str(kinect_obstruction))


def read_depth(height, width, data) :
    # read function
    if (height >= data.height) or (width >= data.width) :
        return -1
    index = (height * data.step) + (width * (data.step/data.width));
    int_data = 0 
    # rectified depth image
    if ((data.step/data.width) == 4) :  
        for i in xrange ( 4 ) : 
            int_data = (int_data << 8) + data.data[index + i]
        return int(int_data * 1000)
    # raw depth image    
    if (data.is_bigendian) :
        int_data = (data.data[index] << 8 ) + data.data[ index + 1 ]
    else :
        int_data = data.data[index] + ( data.data [index + 1] << 8 )
    if int_data == int_data :
        return int_data
    return -1
        
        

if __name__ == '__main__':
    try:
        listen()
    except rospy.ROSInterruptException:
        pass
