#!/usr/bin/env python

import rospy
import sys
import os
import subprocess
import base64
import Image
#import png

from tele_presence.srv import CreateMap, PictureMap, BasicLaunch, BasicStop, MapInfo
from nav_msgs.msg import *
from nav_msgs.srv import *
from std_msgs.msg import *

#from roslib import message

map_pub = None
meta_pub = None
my_map = OccupancyGrid()
read_map = OccupancyGrid()
read_map_called = False
mypath = "rosmap"
process = None # some process

def map_stuff():
    global my_map, map_pub, meta_pub
    rospy.init_node('turtlebot_map', anonymous=True)
    map_pub = rospy.Publisher('/map', OccupancyGrid, latch=True)
    meta_pub = rospy.Publisher('/map_metadata', MapMetaData, latch=True)
    #rospy.Subscriber("/map", OccupancyGrid, callback_map)
    req = None
    #create_map(req)
    rospy.Service('new_map', CreateMap, create_map)
    rospy.Service('picture_map', PictureMap, picture_map)
    rospy.Service('basic_launch', BasicLaunch, basic_launch)
    rospy.Service('basic_stop', BasicStop , basic_stop )
    #rospy.Service('map_info', MapInfo , map_info )
    #picture_map(req)
    while not rospy.is_shutdown():
        #
        #if (my_map.info.width is not 0) :
        #
        rospy.sleep(1.0)

def picture_map( req ) :
    width = req.width
    height = req.height
    try:
        os.remove(mypath + '.pgm')
        os.remove(mypath + '.png')
        os.remove(mypath + '.yaml')
        os.remove(mypath + ".jpeg")
    except:
        print 'error while removing'
    try:
        subprocess.call(['rosrun', 'map_server', 'map_saver', '-f', mypath])
    except:
        print 'error at rosrun'
    try:
        im = Image.open(mypath + '.pgm')
        im.convert('RGBA')
        im.resize((width,height), Image.ANTIALIAS)
        im.save(mypath + '.jpeg')
        im.save(mypath + '.png')
    except:
        print 'error at save/convert'
    #
    try:
        data_uri = str(base64.b64encode(open(mypath + ".png", "rb").read())) .encode( "utf8").replace("\n", "")
    except:
        print 'error at base64.encodestring'
    try:
        img_tag = 'data:image/png;base64,{0}'.format(data_uri)
    except:
        print 'error at img_tag'
    return img_tag

def create_map(req ):
    if (req is not None):
        width = req.width 
        height = req.height 
    else :
        width = 10
        height = 25
    global my_map, map_pub, meta_pub
    h = Header()
    h.frame_id = ''
    test_map = OccupancyGrid()
    test_map.header = h
    test_map.info.resolution = 0.05 
    test_map.info.width = width
    test_map.info.height = height
    test_map.info.origin.position.x = 0 # width / 2
    test_map.info.origin.position.y = 0 # height / 2
    test_map.info.origin.position.z = 1.0
    test_map.info.origin.orientation.x = 0 
    test_map.info.origin.orientation.y = 0 
    test_map.info.origin.orientation.z = 0 
    test_map.info.origin.orientation.w = 0 
    test_map.data = []
    for i in range(0, (width*height)):
        test_map.data.append( 0) # ( i % 8 )
    #print test_map
    #map_pub.publish(test_map);
    my_map = test_map
    map_pub.publish(my_map)
    meta_pub.publish(my_map.info)
    return []

def basic_launch(req) :
    #subprocess.call(req.command)
    if len(req.command) is 0 :
        return []
    global process
    sub = subprocess.Popen(req.command, shell=False, \
        stdin=None, stdout=None, stderr=None, close_fds=True, creationflags=0)
    #if (req.remember) :
    #    process = sub
    #else :
    #    process = None
    return []

def basic_stop(req) :
    global process
    print req.command
    print process
    for i in req.command:
        #subprocess.call(["rosnode","kill", i])
        sub = subprocess.Popen(["rosnode","kill", i], shell=False, \
            stdin=None, stdout=None, stderr=None, close_fds=True, creationflags=0)
    return []
    #if len(req.command) > 0 :
        #process.kill();
    #return []


if __name__ == '__main__':
    try:
        map_stuff()
    except rospy.ROSInterruptException:
        pass
