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
 * Auto-generated by genmsg_cpp from file /home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapRename.srv
 *
 */


#ifndef TELE_PRESENCE_MESSAGE_MAPRENAMEREQUEST_H
#define TELE_PRESENCE_MESSAGE_MAPRENAMEREQUEST_H


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
struct MapRenameRequest_
{
  typedef MapRenameRequest_<ContainerAllocator> Type;

  MapRenameRequest_()
    : map_id()
    , name()  {
    }
  MapRenameRequest_(const ContainerAllocator& _alloc)
    : map_id(_alloc)
    , name(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _map_id_type;
  _map_id_type map_id;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;




  typedef boost::shared_ptr< ::tele_presence::MapRenameRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tele_presence::MapRenameRequest_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct MapRenameRequest_

typedef ::tele_presence::MapRenameRequest_<std::allocator<void> > MapRenameRequest;

typedef boost::shared_ptr< ::tele_presence::MapRenameRequest > MapRenameRequestPtr;
typedef boost::shared_ptr< ::tele_presence::MapRenameRequest const> MapRenameRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tele_presence::MapRenameRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tele_presence::MapRenameRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tele_presence

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/hydro/share/std_msgs/cmake/../msg'], 'tele_presence': ['/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg', '/home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg'], 'actionlib_msgs': ['/opt/ros/hydro/share/actionlib_msgs/cmake/../msg'], 'nav_msgs': ['/opt/ros/hydro/share/nav_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/hydro/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tele_presence::MapRenameRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tele_presence::MapRenameRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tele_presence::MapRenameRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tele_presence::MapRenameRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tele_presence::MapRenameRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tele_presence::MapRenameRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tele_presence::MapRenameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4bf82fff8af93a6939dea34f6621b712";
  }

  static const char* value(const ::tele_presence::MapRenameRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4bf82fff8af93a69ULL;
  static const uint64_t static_value2 = 0x39dea34f6621b712ULL;
};

template<class ContainerAllocator>
struct DataType< ::tele_presence::MapRenameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tele_presence/MapRenameRequest";
  }

  static const char* value(const ::tele_presence::MapRenameRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tele_presence::MapRenameRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
string map_id\n\
\n\
\n\
string name\n\
\n\
";
  }

  static const char* value(const ::tele_presence::MapRenameRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tele_presence::MapRenameRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.map_id);
      stream.next(m.name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct MapRenameRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tele_presence::MapRenameRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tele_presence::MapRenameRequest_<ContainerAllocator>& v)
  {
    s << indent << "map_id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.map_id);
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TELE_PRESENCE_MESSAGE_MAPRENAMEREQUEST_H