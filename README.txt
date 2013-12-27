Setup your 'eclipse' style workspace by going to your home directory and typing:

$ mkdir workspace

Then go to that directory and download the whole project from the git repository:

$ git clone https://david.c.liebman@code.google.com/p/telenp/ 

This will make a 'telenp' folder in your 'workspace' folder. There are two parts to the project. One is the Google Hangout part, that uses the Google Appengine service. This partis called 'awesometelenp'. The other part is the ROS node. That part is called 'turtlebot_tele_presence'. See README files in each of these projects for instructions on how they work.

You may have to run the script 'set-path.bash' to use the ROS node. This is located in the 'telenp' folder. You would type the following to get that to work.

$ ./set-path.bash
