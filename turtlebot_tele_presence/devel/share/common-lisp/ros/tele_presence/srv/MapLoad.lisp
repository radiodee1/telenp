; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapLoad-request.msg.html

(cl:defclass <MapLoad-request> (roslisp-msg-protocol:ros-message)
  ((map_id
    :reader map_id
    :initarg :map_id
    :type cl:string
    :initform "")
   (map_entry
    :reader map_entry
    :initarg :map_entry
    :type tele_presence-msg:MapListEntry
    :initform (cl:make-instance 'tele_presence-msg:MapListEntry)))
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

(cl:ensure-generic-function 'map_entry-val :lambda-list '(m))
(cl:defmethod map_entry-val ((m <MapLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:map_entry-val is deprecated.  Use tele_presence-srv:map_entry instead.")
  (map_entry m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapLoad-request>) ostream)
  "Serializes a message object of type '<MapLoad-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map_entry) ostream)
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
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map_entry) istream)
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
  "5e2740fe7ba2f74d120fcf5c061ae638")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapLoad-request)))
  "Returns md5sum for a message object of type 'MapLoad-request"
  "5e2740fe7ba2f74d120fcf5c061ae638")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapLoad-request>)))
  "Returns full string definition for message of type '<MapLoad-request>"
  (cl:format cl:nil "~%string map_id~%MapListEntry map_entry~%~%================================================================================~%MSG: tele_presence/MapListEntry~%# One entry in a list of maps.~%~%# Naming a map is optional.~%string name~%~%# Maps made by the make-a-map app are given a session ID, which is the~%# time when the map-making session was started, expressed as seconds~%# since the epoch and converted to a string.~%string session_id~%~%# Creation time of this map, in seconds since the epoch.~%int64 date~%~%# Unique ID of this map.~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapLoad-request)))
  "Returns full string definition for message of type 'MapLoad-request"
  (cl:format cl:nil "~%string map_id~%MapListEntry map_entry~%~%================================================================================~%MSG: tele_presence/MapListEntry~%# One entry in a list of maps.~%~%# Naming a map is optional.~%string name~%~%# Maps made by the make-a-map app are given a session ID, which is the~%# time when the map-making session was started, expressed as seconds~%# since the epoch and converted to a string.~%string session_id~%~%# Creation time of this map, in seconds since the epoch.~%int64 date~%~%# Unique ID of this map.~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapLoad-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'map_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map_entry))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapLoad-request
    (cl:cons ':map_id (map_id msg))
    (cl:cons ':map_entry (map_entry msg))
))
;//! \htmlinclude MapLoad-response.msg.html

(cl:defclass <MapLoad-response> (roslisp-msg-protocol:ros-message)
  ((message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass MapLoad-response (<MapLoad-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapLoad-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapLoad-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapLoad-response> is deprecated: use tele_presence-srv:MapLoad-response instead.")))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <MapLoad-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:message-val is deprecated.  Use tele_presence-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapLoad-response>) ostream)
  "Serializes a message object of type '<MapLoad-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapLoad-response>) istream)
  "Deserializes a message object of type '<MapLoad-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
  "5e2740fe7ba2f74d120fcf5c061ae638")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapLoad-response)))
  "Returns md5sum for a message object of type 'MapLoad-response"
  "5e2740fe7ba2f74d120fcf5c061ae638")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapLoad-response>)))
  "Returns full string definition for message of type '<MapLoad-response>"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapLoad-response)))
  "Returns full string definition for message of type 'MapLoad-response"
  (cl:format cl:nil "string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapLoad-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapLoad-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapLoad-response
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapLoad)))
  'MapLoad-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapLoad)))
  'MapLoad-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapLoad)))
  "Returns string type for a service object of type '<MapLoad>"
  "tele_presence/MapLoad")