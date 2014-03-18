; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapUniversal-request.msg.html

(cl:defclass <MapUniversal-request> (roslisp-msg-protocol:ros-message)
  ((op
    :reader op
    :initarg :op
    :type cl:fixnum
    :initform 0)
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (map_id
    :reader map_id
    :initarg :map_id
    :type cl:string
    :initform ""))
)

(cl:defclass MapUniversal-request (<MapUniversal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapUniversal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapUniversal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapUniversal-request> is deprecated: use tele_presence-srv:MapUniversal-request instead.")))

(cl:ensure-generic-function 'op-val :lambda-list '(m))
(cl:defmethod op-val ((m <MapUniversal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:op-val is deprecated.  Use tele_presence-srv:op instead.")
  (op m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <MapUniversal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:name-val is deprecated.  Use tele_presence-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'map_id-val :lambda-list '(m))
(cl:defmethod map_id-val ((m <MapUniversal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:map_id-val is deprecated.  Use tele_presence-srv:map_id instead.")
  (map_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapUniversal-request>) ostream)
  "Serializes a message object of type '<MapUniversal-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'op)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'op)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapUniversal-request>) istream)
  "Deserializes a message object of type '<MapUniversal-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'op)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'op)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapUniversal-request>)))
  "Returns string type for a service object of type '<MapUniversal-request>"
  "tele_presence/MapUniversalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapUniversal-request)))
  "Returns string type for a service object of type 'MapUniversal-request"
  "tele_presence/MapUniversalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapUniversal-request>)))
  "Returns md5sum for a message object of type '<MapUniversal-request>"
  "2ec01afc6ffd904ea7b57b7cec9bb998")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapUniversal-request)))
  "Returns md5sum for a message object of type 'MapUniversal-request"
  "2ec01afc6ffd904ea7b57b7cec9bb998")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapUniversal-request>)))
  "Returns full string definition for message of type '<MapUniversal-request>"
  (cl:format cl:nil "~%~%~%~%~%~%~%~%uint16 op~%string name~%string map_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapUniversal-request)))
  "Returns full string definition for message of type 'MapUniversal-request"
  (cl:format cl:nil "~%~%~%~%~%~%~%~%uint16 op~%string name~%string map_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapUniversal-request>))
  (cl:+ 0
     2
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'map_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapUniversal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapUniversal-request
    (cl:cons ':op (op msg))
    (cl:cons ':name (name msg))
    (cl:cons ':map_id (map_id msg))
))
;//! \htmlinclude MapUniversal-response.msg.html

(cl:defclass <MapUniversal-response> (roslisp-msg-protocol:ros-message)
  ((map_list
    :reader map_list
    :initarg :map_list
    :type (cl:vector tele_presence-msg:MapListEntry)
   :initform (cl:make-array 0 :element-type 'tele_presence-msg:MapListEntry :initial-element (cl:make-instance 'tele_presence-msg:MapListEntry))))
)

(cl:defclass MapUniversal-response (<MapUniversal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapUniversal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapUniversal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapUniversal-response> is deprecated: use tele_presence-srv:MapUniversal-response instead.")))

(cl:ensure-generic-function 'map_list-val :lambda-list '(m))
(cl:defmethod map_list-val ((m <MapUniversal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:map_list-val is deprecated.  Use tele_presence-srv:map_list instead.")
  (map_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapUniversal-response>) ostream)
  "Serializes a message object of type '<MapUniversal-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'map_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'map_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapUniversal-response>) istream)
  "Deserializes a message object of type '<MapUniversal-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'map_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'map_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tele_presence-msg:MapListEntry))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapUniversal-response>)))
  "Returns string type for a service object of type '<MapUniversal-response>"
  "tele_presence/MapUniversalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapUniversal-response)))
  "Returns string type for a service object of type 'MapUniversal-response"
  "tele_presence/MapUniversalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapUniversal-response>)))
  "Returns md5sum for a message object of type '<MapUniversal-response>"
  "2ec01afc6ffd904ea7b57b7cec9bb998")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapUniversal-response)))
  "Returns md5sum for a message object of type 'MapUniversal-response"
  "2ec01afc6ffd904ea7b57b7cec9bb998")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapUniversal-response>)))
  "Returns full string definition for message of type '<MapUniversal-response>"
  (cl:format cl:nil "~%MapListEntry[] map_list~%~%~%================================================================================~%MSG: tele_presence/MapListEntry~%# One entry in a list of maps.~%~%# Naming a map is optional.~%string name~%~%# Maps made by the make-a-map app are given a session ID, which is the~%# time when the map-making session was started, expressed as seconds~%# since the epoch and converted to a string.~%string session_id~%~%# Creation time of this map, in seconds since the epoch.~%int64 date~%~%# Unique ID of this map.~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapUniversal-response)))
  "Returns full string definition for message of type 'MapUniversal-response"
  (cl:format cl:nil "~%MapListEntry[] map_list~%~%~%================================================================================~%MSG: tele_presence/MapListEntry~%# One entry in a list of maps.~%~%# Naming a map is optional.~%string name~%~%# Maps made by the make-a-map app are given a session ID, which is the~%# time when the map-making session was started, expressed as seconds~%# since the epoch and converted to a string.~%string session_id~%~%# Creation time of this map, in seconds since the epoch.~%int64 date~%~%# Unique ID of this map.~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapUniversal-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'map_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapUniversal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapUniversal-response
    (cl:cons ':map_list (map_list msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapUniversal)))
  'MapUniversal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapUniversal)))
  'MapUniversal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapUniversal)))
  "Returns string type for a service object of type '<MapUniversal>"
  "tele_presence/MapUniversal")