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
 * Auto-generated by gensrv_cpp from file /tmp/buildd/ros-hydro-map-store-0.3.1-0precise-20140130-2200/srv/DeleteMap.srv
 *
 */


#ifndef MAP_STORE_MESSAGE_DELETEMAP_H
#define MAP_STORE_MESSAGE_DELETEMAP_H

#include <ros/service_traits.h>


#include <map_store_np/DeleteMapRequest.h>
#include <map_store_np/DeleteMapResponse.h>


namespace map_store_np
{

struct DeleteMap
{

typedef DeleteMapRequest Request;
typedef DeleteMapResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct DeleteMap
} // namespace map_store_np


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::map_store_np::DeleteMap > {
  static const char* value()
  {
    return "d742ddbd5e3e8937162044ae4b300275";
  }

  static const char* value(const ::map_store_np::DeleteMap&) { return value(); }
};

template<>
struct DataType< ::map_store_np::DeleteMap > {
  static const char* value()
  {
    return "map_store_np/DeleteMap";
  }

  static const char* value(const ::map_store_np::DeleteMap&) { return value(); }
};


// service_traits::MD5Sum< ::map_store_np::DeleteMapRequest> should match 
// service_traits::MD5Sum< ::map_store_np::DeleteMap > 
template<>
struct MD5Sum< ::map_store_np::DeleteMapRequest>
{
  static const char* value()
  {
    return MD5Sum< ::map_store_np::DeleteMap >::value();
  }
  static const char* value(const ::map_store_np::DeleteMapRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::map_store_np::DeleteMapRequest> should match 
// service_traits::DataType< ::map_store_np::DeleteMap > 
template<>
struct DataType< ::map_store_np::DeleteMapRequest>
{
  static const char* value()
  {
    return DataType< ::map_store_np::DeleteMap >::value();
  }
  static const char* value(const ::map_store_np::DeleteMapRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::map_store_np::DeleteMapResponse> should match 
// service_traits::MD5Sum< ::map_store_np::DeleteMap > 
template<>
struct MD5Sum< ::map_store_np::DeleteMapResponse>
{
  static const char* value()
  {
    return MD5Sum< ::map_store_np::DeleteMap >::value();
  }
  static const char* value(const ::map_store_np::DeleteMapResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::map_store_np::DeleteMapResponse> should match 
// service_traits::DataType< ::map_store_np::DeleteMap > 
template<>
struct DataType< ::map_store_np::DeleteMapResponse>
{
  static const char* value()
  {
    return DataType< ::map_store_np::DeleteMap >::value();
  }
  static const char* value(const ::map_store_np::DeleteMapResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MAP_STORE_MESSAGE_DELETEMAP_H