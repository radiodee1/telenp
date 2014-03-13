; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapLoad-request.msg.html

(cl:defclass <MapLoad-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapLoad-request (<MapLoad-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapLoad-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapLoad-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapLoad-request> is deprecated: use tele_presence-srv:MapLoad-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapLoad-request>) ostream)
  "Serializes a message object of type '<MapLoad-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapLoad-request>) istream)
  "Deserializes a message object of type '<MapLoad-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapLoad-request>)))
  "Returns string type for a service object of type '<MapLoad-request>"
  "tele_presence/MapLoadRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapLoad-request)))
  "Returns string type for a service object of type 'MapLoad-request"
  "tele_presence/MapLoadRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapLoad-request>)))
  "Returns md5sum for a message object of type '<MapLoad-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapLoad-request)))
  "Returns md5sum for a message object of type 'MapLoad-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapLoad-request>)))
  "Returns full string definition for message of type '<MapLoad-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapLoad-request)))
  "Returns full string definition for message of type 'MapLoad-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapLoad-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapLoad-request
))
;//! \htmlinclude MapLoad-response.msg.html

(cl:defclass <MapLoad-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapLoad-response (<MapLoad-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapLoad-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapLoad-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapLoad-response> is deprecated: use tele_presence-srv:MapLoad-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapLoad-response>) ostream)
  "Serializes a message object of type '<MapLoad-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapLoad-response>) istream)
  "Deserializes a message object of type '<MapLoad-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapLoad-response>)))
  "Returns string type for a service object of type '<MapLoad-response>"
  "tele_presence/MapLoadResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapLoad-response)))
  "Returns string type for a service object of type 'MapLoad-response"
  "tele_presence/MapLoadResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapLoad-response>)))
  "Returns md5sum for a message object of type '<MapLoad-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapLoad-response)))
  "Returns md5sum for a message object of type 'MapLoad-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapLoad-response>)))
  "Returns full string definition for message of type '<MapLoad-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapLoad-response)))
  "Returns full string definition for message of type 'MapLoad-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapLoad-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapLoad-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapLoad-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapLoad)))
  'MapLoad-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapLoad)))
  'MapLoad-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapLoad)))
  "Returns string type for a service object of type '<MapLoad>"
  "tele_presence/MapLoad")