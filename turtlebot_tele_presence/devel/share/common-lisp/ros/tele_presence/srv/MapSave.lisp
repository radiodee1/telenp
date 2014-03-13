; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapSave-request.msg.html

(cl:defclass <MapSave-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass MapSave-request (<MapSave-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapSave-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapSave-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapSave-request> is deprecated: use tele_presence-srv:MapSave-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <MapSave-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:name-val is deprecated.  Use tele_presence-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapSave-request>) ostream)
  "Serializes a message object of type '<MapSave-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapSave-request>) istream)
  "Deserializes a message object of type '<MapSave-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapSave-request>)))
  "Returns string type for a service object of type '<MapSave-request>"
  "tele_presence/MapSaveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapSave-request)))
  "Returns string type for a service object of type 'MapSave-request"
  "tele_presence/MapSaveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapSave-request>)))
  "Returns md5sum for a message object of type '<MapSave-request>"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapSave-request)))
  "Returns md5sum for a message object of type 'MapSave-request"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapSave-request>)))
  "Returns full string definition for message of type '<MapSave-request>"
  (cl:format cl:nil "~%~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapSave-request)))
  "Returns full string definition for message of type 'MapSave-request"
  (cl:format cl:nil "~%~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapSave-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapSave-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapSave-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude MapSave-response.msg.html

(cl:defclass <MapSave-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapSave-response (<MapSave-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapSave-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapSave-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapSave-response> is deprecated: use tele_presence-srv:MapSave-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapSave-response>) ostream)
  "Serializes a message object of type '<MapSave-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapSave-response>) istream)
  "Deserializes a message object of type '<MapSave-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapSave-response>)))
  "Returns string type for a service object of type '<MapSave-response>"
  "tele_presence/MapSaveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapSave-response)))
  "Returns string type for a service object of type 'MapSave-response"
  "tele_presence/MapSaveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapSave-response>)))
  "Returns md5sum for a message object of type '<MapSave-response>"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapSave-response)))
  "Returns md5sum for a message object of type 'MapSave-response"
  "c1f3d28f1b044c871e6eff2e9fc3c667")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapSave-response>)))
  "Returns full string definition for message of type '<MapSave-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapSave-response)))
  "Returns full string definition for message of type 'MapSave-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapSave-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapSave-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapSave-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapSave)))
  'MapSave-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapSave)))
  'MapSave-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapSave)))
  "Returns string type for a service object of type '<MapSave>"
  "tele_presence/MapSave")