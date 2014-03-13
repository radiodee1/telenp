; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapList-request.msg.html

(cl:defclass <MapList-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapList-request (<MapList-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapList-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapList-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapList-request> is deprecated: use tele_presence-srv:MapList-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapList-request>) ostream)
  "Serializes a message object of type '<MapList-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapList-request>) istream)
  "Deserializes a message object of type '<MapList-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapList-request>)))
  "Returns string type for a service object of type '<MapList-request>"
  "tele_presence/MapListRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapList-request)))
  "Returns string type for a service object of type 'MapList-request"
  "tele_presence/MapListRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapList-request>)))
  "Returns md5sum for a message object of type '<MapList-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapList-request)))
  "Returns md5sum for a message object of type 'MapList-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapList-request>)))
  "Returns full string definition for message of type '<MapList-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapList-request)))
  "Returns full string definition for message of type 'MapList-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapList-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapList-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapList-request
))
;//! \htmlinclude MapList-response.msg.html

(cl:defclass <MapList-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapList-response (<MapList-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapList-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapList-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapList-response> is deprecated: use tele_presence-srv:MapList-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapList-response>) ostream)
  "Serializes a message object of type '<MapList-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapList-response>) istream)
  "Deserializes a message object of type '<MapList-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapList-response>)))
  "Returns string type for a service object of type '<MapList-response>"
  "tele_presence/MapListResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapList-response)))
  "Returns string type for a service object of type 'MapList-response"
  "tele_presence/MapListResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapList-response>)))
  "Returns md5sum for a message object of type '<MapList-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapList-response)))
  "Returns md5sum for a message object of type 'MapList-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapList-response>)))
  "Returns full string definition for message of type '<MapList-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapList-response)))
  "Returns full string definition for message of type 'MapList-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapList-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapList-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapList-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapList)))
  'MapList-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapList)))
  'MapList-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapList)))
  "Returns string type for a service object of type '<MapList>"
  "tele_presence/MapList")