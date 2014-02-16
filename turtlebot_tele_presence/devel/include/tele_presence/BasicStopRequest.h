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
 * Auto-generated by genmsg_cpp from file /home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/BasicStop.srv
 *
 */


#ifndef TELE_PRESENCE_MESSAGE_BASICSTOPREQUEST_H
#define TELE_PRESENCE_MESSAGE_BASICSTOPREQUEST_H


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
struct BasicStopRequest_
{
  typedef BasicStopRequest_<ContainerAllocator> Type;

  BasicStopRequest_()
    : command()  {
    }
  BasicStopRequest_(const ContainerAllocator& _alloc)
    : command(_alloc)  {
    }



   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _command_type;
  _command_type command;




  typedef boost::shared_ptr< ::tele_presence::BasicStopRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tele_presence::BasicStopRequest_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct BasicStopRequest_

typedef ::tele_presence::BasicStopRequest_<std::allocator<void> > BasicStopRequest;

typedef boost::shared_ptr< ::tele_presence::BasicStopRequest > BasicStopRequestPtr;
typedef boost::shared_ptr< ::tele_presence::BasicStopRequest const> BasicStopRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tele_presence::BasicStopRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tele_presence::BasicStopRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tele_presence

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/hydro/share/std_msgs/cmake/../msg'], 'tele_presence': ['/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg'], 'actionlib_msgs': ['/opt/ros/hydro/share/actionlib_msgs/cmake/../msg'], 'nav_msgs': ['/opt/ros/hydro/share/nav_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/hydro/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tele_presence::BasicStopRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tele_presence::BasicStopRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tele_presence::BasicStopRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tele_presence::BasicStopRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tele_presence::BasicStopRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tele_presence::BasicStopRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tele_presence::BasicStopRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3adcc4a2100c5ff118c0238c960ed0f4";
  }

  static const char* value(const ::tele_presence::BasicStopRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3adcc4a2100c5ff1ULL;
  static const uint64_t static_value2 = 0x18c0238c960ed0f4ULL;
};

template<class ContainerAllocator>
struct DataType< ::tele_presence::BasicStopRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tele_presence/BasicStopRequest";
  }

  static const char* value(const ::tele_presence::BasicStopRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tele_presence::BasicStopRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
string[] command\n\
";
  }

  static const char* value(const ::tele_presence::BasicStopRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tele_presence::BasicStopRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.command);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct BasicStopRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tele_presence::BasicStopRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tele_presence::BasicStopRequest_<ContainerAllocator>& v)
  {
    s << indent << "command[]" << std::endl;
    for (size_t i = 0; i < v.command.size(); ++i)
    {
      s << indent << "  command[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.command[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TELE_PRESENCE_MESSAGE_BASICSTOPREQUEST_H
