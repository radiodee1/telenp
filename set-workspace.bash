#!/bin/bash

cd ~/workspace/telenp/turtlebot_tele_presence/src/
catkin_init_workspace
cd ..
# you may have to do this because my username doesn't match yours :
# rm -fr build devel

catkin_make
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/workspace/telenp/turtlebot_tele_presence/;





#catkin_create_pkg turtlebot_tele_presence std_msgs rospy roscpp
