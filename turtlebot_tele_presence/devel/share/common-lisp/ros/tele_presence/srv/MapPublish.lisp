; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapPublish-request.msg.html

(cl:defclass <MapPublish-request> (roslisp-msg-protocol:ros-message)
  ((map_id
    :reader map_id
    :initarg :map_id
    :type cl:string
    :initform ""))
)

(cl:defclass MapPublish-request (<MapPublish-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapPublish-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapPublish-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapPublish-request> is deprecated: use tele_presence-srv:MapPublish-request instead.")))

(cl:ensure-generic-function 'map_id-val :lambda-list '(m))
(cl:defmethod map_id-val ((m <MapPublish-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:map_id-val is deprecated.  Use tele_presence-srv:map_id instead.")
  (map_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapPublish-request>) ostream)
  "Serializes a message object of type '<MapPublish-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapPublish-request>) istream)
  "Deserializes a message object of type '<MapPublish-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapPublish-request>)))
  "Returns string type for a service object of type '<MapPublish-request>"
  "tele_presence/MapPublishRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapPublish-request)))
  "Returns string type for a service object of type 'MapPublish-request"
  "tele_presence/MapPublishRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapPublish-request>)))
  "Returns md5sum for a message object of type '<MapPublish-request>"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapPublish-request)))
  "Returns md5sum for a message object of type 'MapPublish-request"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapPublish-request>)))
  "Returns full string definition for message of type '<MapPublish-request>"
  (cl:format cl:nil "~%~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapPublish-request)))
  "Returns full string definition for message of type 'MapPublish-request"
  (cl:format cl:nil "~%~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapPublish-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'map_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapPublish-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapPublish-request
    (cl:cons ':map_id (map_id msg))
))
;//! \htmlinclude MapPublish-response.msg.html

(cl:defclass <MapPublish-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapPublish-response (<MapPublish-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapPublish-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapPublish-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapPublish-response> is deprecated: use tele_presence-srv:MapPublish-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapPublish-response>) ostream)
  "Serializes a message object of type '<MapPublish-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapPublish-response>) istream)
  "Deserializes a message object of type '<MapPublish-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapPublish-response>)))
  "Returns string type for a service object of type '<MapPublish-response>"
  "tele_presence/MapPublishResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapPublish-response)))
  "Returns string type for a service object of type 'MapPublish-response"
  "tele_presence/MapPublishResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapPublish-response>)))
  "Returns md5sum for a message object of type '<MapPublish-response>"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapPublish-response)))
  "Returns md5sum for a message object of type 'MapPublish-response"
  "d742ddbd5e3e8937162044ae4b300275")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapPublish-response>)))
  "Returns full string definition for message of type '<MapPublish-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapPublish-response)))
  "Returns full string definition for message of type 'MapPublish-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapPublish-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapPublish-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapPublish-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapPublish)))
  'MapPublish-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapPublish)))
  'MapPublish-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapPublish)))
  "Returns string type for a service object of type '<MapPublish>"
  "tele_presence/MapPublish")