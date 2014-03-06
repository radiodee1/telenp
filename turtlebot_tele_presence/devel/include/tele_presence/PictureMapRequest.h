/* Software License Agreement (BSD License)
 *
 * Copyright (c) 2011, Willow Garage, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *  * Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *  * Redistributions in binary form must reproduce the above
 *    copyright notice, this list of conditions and the following
 *    disclaimer in the documentation and/or other materials provided
 *    with the distribution.
 *  * Neither the name of Willow Garage, Inc. nor the names of its
 *    contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * Auto-generated by genmsg_cpp from file /home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/PictureMap.srv
 *
 */


#ifndef TELE_PRESENCE_MESSAGE_PICTUREMAPREQUEST_H
#define TELE_PRESENCE_MESSAGE_PICTUREMAPREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tele_presence
{
template <class ContainerAllocator>
struct PictureMapRequest_
{
  typedef PictureMapRequest_<ContainerAllocator> Type;

  PictureMapRequest_()
    : width(0)
    , height(0)  {
    }
  PictureMapRequest_(const ContainerAllocator& _alloc)
    : width(0)
    , height(0)  {
    }



   typedef uint32_t _width_type;
  _width_type width;

   typedef uint32_t _height_type;
  _height_type height;




  typedef boost::shared_ptr< ::tele_presence::PictureMapRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tele_presence::PictureMapRequest_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct PictureMapRequest_

typedef ::tele_presence::PictureMapRequest_<std::allocator<void> > PictureMapRequest;

typedef boost::shared_ptr< ::tele_presence::PictureMapRequest > PictureMapRequestPtr;
typedef boost::shared_ptr< ::tele_presence::PictureMapRequest const> PictureMapRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tele_presence::PictureMapRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tele_presence::PictureMapRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tele_presence

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/hydro/share/std_msgs/cmake/../msg'], 'tele_presence': ['/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg'], 'actionlib_msgs': ['/opt/ros/hydro/share/actionlib_msgs/cmake/../msg'], 'nav_msgs': ['/opt/ros/hydro/share/nav_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/hydro/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tele_presence::PictureMapRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tele_presence::PictureMapRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tele_presence::PictureMapRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tele_presence::PictureMapRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tele_presence::PictureMapRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tele_presence::PictureMapRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tele_presence::PictureMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d00b1659f7d843bad3388af53e042f94";
  }

  static const char* value(const ::tele_presence::PictureMapRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd00b1659f7d843baULL;
  static const uint64_t static_value2 = 0xd3388af53e042f94ULL;
};

template<class ContainerAllocator>
struct DataType< ::tele_presence::PictureMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tele_presence/PictureMapRequest";
  }

  static const char* value(const ::tele_presence::PictureMapRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tele_presence::PictureMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
uint32 width\n\
uint32 height\n\
";
  }

  static const char* value(const ::tele_presence::PictureMapRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tele_presence::PictureMapRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.width);
      stream.next(m.height);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct PictureMapRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tele_presence::PictureMapRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tele_presence::PictureMapRequest_<ContainerAllocator>& v)
  {
    s << indent << "width: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.width);
    s << indent << "height: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.height);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TELE_PRESENCE_MESSAGE_PICTUREMAPREQUEST_H
