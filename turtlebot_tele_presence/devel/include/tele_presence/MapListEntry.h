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
 * Auto-generated by genmsg_cpp from file /home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/msg/MapListEntry.msg
 *
 */


#ifndef TELE_PRESENCE_MESSAGE_MAPLISTENTRY_H
#define TELE_PRESENCE_MESSAGE_MAPLISTENTRY_H


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
struct MapListEntry_
{
  typedef MapListEntry_<ContainerAllocator> Type;

  MapListEntry_()
    : name()
    , session_id()
    , date(0)
    , map_id()  {
    }
  MapListEntry_(const ContainerAllocator& _alloc)
    : name(_alloc)
    , session_id(_alloc)
    , date(0)
    , map_id(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _session_id_type;
  _session_id_type session_id;

   typedef int64_t _date_type;
  _date_type date;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _map_id_type;
  _map_id_type map_id;




  typedef boost::shared_ptr< ::tele_presence::MapListEntry_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tele_presence::MapListEntry_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct MapListEntry_

typedef ::tele_presence::MapListEntry_<std::allocator<void> > MapListEntry;

typedef boost::shared_ptr< ::tele_presence::MapListEntry > MapListEntryPtr;
typedef boost::shared_ptr< ::tele_presence::MapListEntry const> MapListEntryConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tele_presence::MapListEntry_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tele_presence::MapListEntry_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::tele_presence::MapListEntry_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tele_presence::MapListEntry_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tele_presence::MapListEntry_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tele_presence::MapListEntry_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tele_presence::MapListEntry_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tele_presence::MapListEntry_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tele_presence::MapListEntry_<ContainerAllocator> >
{
  static const char* value()
  {
    return "092f024758d394d17196cd37d999fdb0";
  }

  static const char* value(const ::tele_presence::MapListEntry_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x092f024758d394d1ULL;
  static const uint64_t static_value2 = 0x7196cd37d999fdb0ULL;
};

template<class ContainerAllocator>
struct DataType< ::tele_presence::MapListEntry_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tele_presence/MapListEntry";
  }

  static const char* value(const ::tele_presence::MapListEntry_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tele_presence::MapListEntry_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# One entry in a list of maps.\n\
\n\
# Naming a map is optional.\n\
string name\n\
\n\
# Maps made by the make-a-map app are given a session ID, which is the\n\
# time when the map-making session was started, expressed as seconds\n\
# since the epoch and converted to a string.\n\
string session_id\n\
\n\
# Creation time of this map, in seconds since the epoch.\n\
int64 date\n\
\n\
# Unique ID of this map.\n\
string map_id\n\
";
  }

  static const char* value(const ::tele_presence::MapListEntry_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tele_presence::MapListEntry_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
      stream.next(m.session_id);
      stream.next(m.date);
      stream.next(m.map_id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct MapListEntry_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tele_presence::MapListEntry_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tele_presence::MapListEntry_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
    s << indent << "session_id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.session_id);
    s << indent << "date: ";
    Printer<int64_t>::stream(s, indent + "  ", v.date);
    s << indent << "map_id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.map_id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TELE_PRESENCE_MESSAGE_MAPLISTENTRY_H
