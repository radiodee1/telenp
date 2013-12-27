#!/bin/bash

cd ~/workspace/telenp/turtlebot_tele_presence/src/
catkin_init_workspace
cd ..
catkin_make
export ROS_PACKAGE_PATH=~/workspace/telenp/turtlebot_tele_presence/:$ROS_PACKAGE_PATH;





#catkin_create_pkg turtlebot_tele_presence std_msgs rospy roscpp
