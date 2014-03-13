; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapDelete-request.msg.html

(cl:defclass <MapDelete-request> (roslisp-msg-protocol:ros-message)
  ((map_id
    :reader map_id
    :initarg :map_id
    :type cl:string
    :initform ""))
)

(cl:defclass MapDelete-request (<MapDelete-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapDelete-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapDelete-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapDelete-request> is deprecated: use tele_presence-srv:MapDelete-request instead.")))

(cl:ensure-generic-function 'map_id-val :lambda-list '(m))
(cl:defmethod map_id-val ((m <MapDelete-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:map_id-val is deprecated.  Use tele_presence-srv:map_id instead.")
  (map_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapDelete-request>) ostream)
  "Serializes a message object of type '<MapDelete-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapDelete-request>) istream)
  "Deserializes a message object of type '<MapDelete-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'map_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'map_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapDelete-request>)))
  "Returns string type for a service object of type '<MapDelete-request>"
  "tele_presence/MapDeleteRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapDelete-request)))
  "Returns string type for a service object of type 'MapDelete-request"
  "tele_presence/MapDeleteRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapDelete-request>)))
  "Returns md5sum for a message object of type '<MapDelete-request>"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapDelete-request)))
  "Returns md5sum for a message object of type 'MapDelete-request"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapDelete-request>)))
  "Returns full string definition for message of type '<MapDelete-request>"
  (cl:format cl:nil "~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapDelete-request)))
  "Returns full string definition for message of type 'MapDelete-request"
  (cl:format cl:nil "~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapDelete-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'map_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapDelete-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapDelete-request
    (cl:cons ':map_id (map_id msg))
))
;//! \htmlinclude MapDelete-response.msg.html

(cl:defclass <MapDelete-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapDelete-response (<MapDelete-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapDelete-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapDelete-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapDelete-response> is deprecated: use tele_presence-srv:MapDelete-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapDelete-response>) ostream)
  "Serializes a message object of type '<MapDelete-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapDelete-response>) istream)
  "Deserializes a message object of type '<MapDelete-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapDelete-response>)))
  "Returns string type for a service object of type '<MapDelete-response>"
  "tele_presence/MapDeleteResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapDelete-response)))
  "Returns string type for a service object of type 'MapDelete-response"
  "tele_presence/MapDeleteResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapDelete-response>)))
  "Returns md5sum for a message object of type '<MapDelete-response>"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapDelete-response)))
  "Returns md5sum for a message object of type 'MapDelete-response"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapDelete-response>)))
  "Returns full string definition for message of type '<MapDelete-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapDelete-response)))
  "Returns full string definition for message of type 'MapDelete-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapDelete-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapDelete-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapDelete-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapDelete)))
  'MapDelete-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapDelete)))
  'MapDelete-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapDelete)))
  "Returns string type for a service object of type '<MapDelete>"
  "tele_presence/MapDelete")