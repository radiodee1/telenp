; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapLoad-request.msg.html

(cl:defclass <MapLoad-request> (roslisp-msg-protocol:ros-message)
  ((map_id
    :reader map_id
    :initarg :map_id
    :type cl:string
    :initform ""))
)

(cl:defclass MapLoad-request (<MapLoad-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapLoad-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapLoad-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapLoad-request> is deprecated: use tele_presence-srv:MapLoad-request instead.")))

(cl:ensure-generic-function 'map_id-val :lambda-list '(m))
(cl:defmethod map_id-val ((m <MapLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:map_id-val is deprecated.  Use tele_presence-srv:map_id instead.")
  (map_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapLoad-request>) ostream)
  "Serializes a message object of type '<MapLoad-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapLoad-request>) istream)
  "Deserializes a message object of type '<MapLoad-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapLoad-request>)))
  "Returns string type for a service object of type '<MapLoad-request>"
  "tele_presence/MapLoadRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapLoad-request)))
  "Returns string type for a service object of type 'MapLoad-request"
  "tele_presence/MapLoadRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapLoad-request>)))
  "Returns md5sum for a message object of type '<MapLoad-request>"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapLoad-request)))
  "Returns md5sum for a message object of type 'MapLoad-request"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapLoad-request>)))
  "Returns full string definition for message of type '<MapLoad-request>"
  (cl:format cl:nil "~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapLoad-request)))
  "Returns full string definition for message of type 'MapLoad-request"
  (cl:format cl:nil "~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapLoad-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'map_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapLoad-request
    (cl:cons ':map_id (map_id msg))
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
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapLoad-response)))
  "Returns md5sum for a message object of type 'MapLoad-response"
  "d742ddbd5e3e8937162044ae4b300275")
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