; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude CreateMap-request.msg.html

(cl:defclass <CreateMap-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CreateMap-request (<CreateMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CreateMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CreateMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<CreateMap-request> is deprecated: use tele_presence-srv:CreateMap-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CreateMap-request>) ostream)
  "Serializes a message object of type '<CreateMap-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CreateMap-request>) istream)
  "Deserializes a message object of type '<CreateMap-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CreateMap-request>)))
  "Returns string type for a service object of type '<CreateMap-request>"
  "tele_presence/CreateMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreateMap-request)))
  "Returns string type for a service object of type 'CreateMap-request"
  "tele_presence/CreateMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CreateMap-request>)))
  "Returns md5sum for a message object of type '<CreateMap-request>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CreateMap-request)))
  "Returns md5sum for a message object of type 'CreateMap-request"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CreateMap-request>)))
  "Returns full string definition for message of type '<CreateMap-request>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CreateMap-request)))
  "Returns full string definition for message of type 'CreateMap-request"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CreateMap-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CreateMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CreateMap-request
))
;//! \htmlinclude CreateMap-response.msg.html

(cl:defclass <CreateMap-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass CreateMap-response (<CreateMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CreateMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CreateMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<CreateMap-response> is deprecated: use tele_presence-srv:CreateMap-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CreateMap-response>) ostream)
  "Serializes a message object of type '<CreateMap-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CreateMap-response>) istream)
  "Deserializes a message object of type '<CreateMap-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CreateMap-response>)))
  "Returns string type for a service object of type '<CreateMap-response>"
  "tele_presence/CreateMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreateMap-response)))
  "Returns string type for a service object of type 'CreateMap-response"
  "tele_presence/CreateMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CreateMap-response>)))
  "Returns md5sum for a message object of type '<CreateMap-response>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CreateMap-response)))
  "Returns md5sum for a message object of type 'CreateMap-response"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CreateMap-response>)))
  "Returns full string definition for message of type '<CreateMap-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CreateMap-response)))
  "Returns full string definition for message of type 'CreateMap-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CreateMap-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CreateMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CreateMap-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CreateMap)))
  'CreateMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CreateMap)))
  'CreateMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CreateMap)))
  "Returns string type for a service object of type '<CreateMap>"
  "tele_presence/CreateMap")