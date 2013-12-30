An eclipse style workspace is used in this project. Setup your 'eclipse' style workspace by going to your home directory and typing:

$ mkdir workspace

Then go to that directory and download the whole project from 
the git repository:

$ git clone https://david.c.liebman@code.google.com/p/telenp/ 

This will make a 'telenp' folder in your 'workspace' folder. 
There are two parts to the project. One is the Google Hangout part, 
that uses the Google Appengine service. This part is called 'awesometelenp'. 
The other part is the ROS node. That part is called 
'turtlebot_tele_presence'. See README files in each of these 
projects for instructions on how they work.

You may have to run the script 'set-workspace.bash' to use the ROS 
node. This is located in the 'telenp' folder. Change directory to the 
telenp project root before running the script. You would type the following 
to get that to work.

$ cd ~/workspace/telenp/
$ ./set-workspace.bash

You may want to add the projects path to the ROS_PACKAGE_PATH to your '.bashrc' 
file. Use the following code:

export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/workspace/telenp/turtlebot_tele_presence/;


