; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapRename-request.msg.html

(cl:defclass <MapRename-request> (roslisp-msg-protocol:ros-message)
  ((map_id
    :reader map_id
    :initarg :map_id
    :type cl:string
    :initform "")
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass MapRename-request (<MapRename-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapRename-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapRename-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapRename-request> is deprecated: use tele_presence-srv:MapRename-request instead.")))

(cl:ensure-generic-function 'map_id-val :lambda-list '(m))
(cl:defmethod map_id-val ((m <MapRename-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:map_id-val is deprecated.  Use tele_presence-srv:map_id instead.")
  (map_id m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <MapRename-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:name-val is deprecated.  Use tele_presence-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapRename-request>) ostream)
  "Serializes a message object of type '<MapRename-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapRename-request>) istream)
  "Deserializes a message object of type '<MapRename-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'map_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'map_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapRename-request>)))
  "Returns string type for a service object of type '<MapRename-request>"
  "tele_presence/MapRenameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapRename-request)))
  "Returns string type for a service object of type 'MapRename-request"
  "tele_presence/MapRenameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapRename-request>)))
  "Returns md5sum for a message object of type '<MapRename-request>"
  "4bf82fff8af93a6939dea34f6621b712")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapRename-request)))
  "Returns md5sum for a message object of type 'MapRename-request"
  "4bf82fff8af93a6939dea34f6621b712")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapRename-request>)))
  "Returns full string definition for message of type '<MapRename-request>"
  (cl:format cl:nil "~%string map_id~%~%~%string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapRename-request)))
  "Returns full string definition for message of type 'MapRename-request"
  (cl:format cl:nil "~%string map_id~%~%~%string name~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapRename-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'map_id))
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapRename-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapRename-request
    (cl:cons ':map_id (map_id msg))
    (cl:cons ':name (name msg))
))
;//! \htmlinclude MapRename-response.msg.html

(cl:defclass <MapRename-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapRename-response (<MapRename-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapRename-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapRename-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapRename-response> is deprecated: use tele_presence-srv:MapRename-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapRename-response>) ostream)
  "Serializes a message object of type '<MapRename-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapRename-response>) istream)
  "Deserializes a message object of type '<MapRename-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapRename-response>)))
  "Returns string type for a service object of type '<MapRename-response>"
  "tele_presence/MapRenameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapRename-response)))
  "Returns string type for a service object of type 'MapRename-response"
  "tele_presence/MapRenameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapRename-response>)))
  "Returns md5sum for a message object of type '<MapRename-response>"
  "4bf82fff8af93a6939dea34f6621b712")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapRename-response)))
  "Returns md5sum for a message object of type 'MapRename-response"
  "4bf82fff8af93a6939dea34f6621b712")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapRename-response>)))
  "Returns full string definition for message of type '<MapRename-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapRename-response)))
  "Returns full string definition for message of type 'MapRename-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapRename-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapRename-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapRename-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapRename)))
  'MapRename-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapRename)))
  'MapRename-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapRename)))
  "Returns string type for a service object of type '<MapRename>"
  "tele_presence/MapRename")