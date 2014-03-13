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
 * Auto-generated by gensrv_cpp from file /home/dave/workspace/telenp/turtlebot_tele_presence/src/tele_presence/srv/MapSave.srv
 *
 */


#ifndef TELE_PRESENCE_MESSAGE_MAPSAVE_H
#define TELE_PRESENCE_MESSAGE_MAPSAVE_H

#include <ros/service_traits.h>


#include <tele_presence/MapSaveRequest.h>
#include <tele_presence/MapSaveResponse.h>


namespace tele_presence
{

struct MapSave
{

typedef MapSaveRequest Request;
typedef MapSaveResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct MapSave
} // namespace tele_presence


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::tele_presence::MapSave > {
  static const char* value()
  {
    return "c1f3d28f1b044c871e6eff2e9fc3c667";
  }

  static const char* value(const ::tele_presence::MapSave&) { return value(); }
};

template<>
struct DataType< ::tele_presence::MapSave > {
  static const char* value()
  {
    return "tele_presence/MapSave";
  }

  static const char* value(const ::tele_presence::MapSave&) { return value(); }
};


// service_traits::MD5Sum< ::tele_presence::MapSaveRequest> should match 
// service_traits::MD5Sum< ::tele_presence::MapSave > 
template<>
struct MD5Sum< ::tele_presence::MapSaveRequest>
{
  static const char* value()
  {
    return MD5Sum< ::tele_presence::MapSave >::value();
  }
  static const char* value(const ::tele_presence::MapSaveRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::tele_presence::MapSaveRequest> should match 
// service_traits::DataType< ::tele_presence::MapSave > 
template<>
struct DataType< ::tele_presence::MapSaveRequest>
{
  static const char* value()
  {
    return DataType< ::tele_presence::MapSave >::value();
  }
  static const char* value(const ::tele_presence::MapSaveRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::tele_presence::MapSaveResponse> should match 
// service_traits::MD5Sum< ::tele_presence::MapSave > 
template<>
struct MD5Sum< ::tele_presence::MapSaveResponse>
{
  static const char* value()
  {
    return MD5Sum< ::tele_presence::MapSave >::value();
  }
  static const char* value(const ::tele_presence::MapSaveResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::tele_presence::MapSaveResponse> should match 
// service_traits::DataType< ::tele_presence::MapSave > 
template<>
struct DataType< ::tele_presence::MapSaveResponse>
{
  static const char* value()
  {
    return DataType< ::tele_presence::MapSave >::value();
  }
  static const char* value(const ::tele_presence::MapSaveResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // TELE_PRESENCE_MESSAGE_MAPSAVE_H
