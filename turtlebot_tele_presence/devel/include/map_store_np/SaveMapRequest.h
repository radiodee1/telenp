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
 * Auto-generated by genmsg_cpp from file /home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/srv/SaveMap.srv
 *
 */


#ifndef MAP_STORE_NP_MESSAGE_SAVEMAPREQUEST_H
#define MAP_STORE_NP_MESSAGE_SAVEMAPREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace map_store_np
{
template <class ContainerAllocator>
struct SaveMapRequest_
{
  typedef SaveMapRequest_<ContainerAllocator> Type;

  SaveMapRequest_()
    : map_name()  {
    }
  SaveMapRequest_(const ContainerAllocator& _alloc)
    : map_name(_alloc)  {
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _map_name_type;
  _map_name_type map_name;




  typedef boost::shared_ptr< ::map_store_np::SaveMapRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::map_store_np::SaveMapRequest_<ContainerAllocator> const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;

}; // struct SaveMapRequest_

typedef ::map_store_np::SaveMapRequest_<std::allocator<void> > SaveMapRequest;

typedef boost::shared_ptr< ::map_store_np::SaveMapRequest > SaveMapRequestPtr;
typedef boost::shared_ptr< ::map_store_np::SaveMapRequest const> SaveMapRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::map_store_np::SaveMapRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::map_store_np::SaveMapRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace map_store_np

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'map_store_np': ['/home/dave/workspace/telenp/turtlebot_tele_presence/src/map_store_np/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::map_store_np::SaveMapRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::map_store_np::SaveMapRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::map_store_np::SaveMapRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::map_store_np::SaveMapRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::map_store_np::SaveMapRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::map_store_np::SaveMapRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::map_store_np::SaveMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "25e928a2d4ff388c294895b7af935978";
  }

  static const char* value(const ::map_store_np::SaveMapRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x25e928a2d4ff388cULL;
  static const uint64_t static_value2 = 0x294895b7af935978ULL;
};

template<class ContainerAllocator>
struct DataType< ::map_store_np::SaveMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "map_store_np/SaveMapRequest";
  }

  static const char* value(const ::map_store_np::SaveMapRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::map_store_np::SaveMapRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
\n\
string map_name\n\
";
  }

  static const char* value(const ::map_store_np::SaveMapRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::map_store_np::SaveMapRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.map_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct SaveMapRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::map_store_np::SaveMapRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::map_store_np::SaveMapRequest_<ContainerAllocator>& v)
  {
    s << indent << "map_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.map_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MAP_STORE_NP_MESSAGE_SAVEMAPREQUEST_H