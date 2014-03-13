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
 * Auto-generated by gensrv_cpp from file /home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapList.srv
 *
 */


#ifndef TELE_PRESENCE_MESSAGE_MAPLIST_H
#define TELE_PRESENCE_MESSAGE_MAPLIST_H

#include <ros/service_traits.h>


#include <tele_presence/MapListRequest.h>
#include <tele_presence/MapListResponse.h>


namespace tele_presence
{

struct MapList
{

typedef MapListRequest Request;
typedef MapListResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct MapList
} // namespace tele_presence


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::tele_presence::MapList > {
  static const char* value()
  {
    return "ca5a33dd106a2c24cfd54c927d214957";
  }

  static const char* value(const ::tele_presence::MapList&) { return value(); }
};

template<>
struct DataType< ::tele_presence::MapList > {
  static const char* value()
  {
    return "tele_presence/MapList";
  }

  static const char* value(const ::tele_presence::MapList&) { return value(); }
};


// service_traits::MD5Sum< ::tele_presence::MapListRequest> should match 
// service_traits::MD5Sum< ::tele_presence::MapList > 
template<>
struct MD5Sum< ::tele_presence::MapListRequest>
{
  static const char* value()
  {
    return MD5Sum< ::tele_presence::MapList >::value();
  }
  static const char* value(const ::tele_presence::MapListRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::tele_presence::MapListRequest> should match 
// service_traits::DataType< ::tele_presence::MapList > 
template<>
struct DataType< ::tele_presence::MapListRequest>
{
  static const char* value()
  {
    return DataType< ::tele_presence::MapList >::value();
  }
  static const char* value(const ::tele_presence::MapListRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::tele_presence::MapListResponse> should match 
// service_traits::MD5Sum< ::tele_presence::MapList > 
template<>
struct MD5Sum< ::tele_presence::MapListResponse>
{
  static const char* value()
  {
    return MD5Sum< ::tele_presence::MapList >::value();
  }
  static const char* value(const ::tele_presence::MapListResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::tele_presence::MapListResponse> should match 
// service_traits::DataType< ::tele_presence::MapList > 
template<>
struct DataType< ::tele_presence::MapListResponse>
{
  static const char* value()
  {
    return DataType< ::tele_presence::MapList >::value();
  }
  static const char* value(const ::tele_presence::MapListResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TELE_PRESENCE_MESSAGE_MAPLIST_H
