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
  "ca5a33dd106a2c24cfd54c927d214957")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapList-request)))
  "Returns md5sum for a message object of type 'MapList-request"
  "ca5a33dd106a2c24cfd54c927d214957")
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
  ((map_list
    :reader map_list
    :initarg :map_list
    :type (cl:vector tele_presence-msg:MapListEntry)
   :initform (cl:make-array 0 :element-type 'tele_presence-msg:MapListEntry :initial-element (cl:make-instance 'tele_presence-msg:MapListEntry))))
)

(cl:defclass MapList-response (<MapList-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapList-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapList-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapList-response> is deprecated: use tele_presence-srv:MapList-response instead.")))

(cl:ensure-generic-function 'map_list-val :lambda-list '(m))
(cl:defmethod map_list-val ((m <MapList-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:map_list-val is deprecated.  Use tele_presence-srv:map_list instead.")
  (map_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapList-response>) ostream)
  "Serializes a message object of type '<MapList-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'map_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'map_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapList-response>) istream)
  "Deserializes a message object of type '<MapList-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapList-response>)))
  "Returns string type for a service object of type '<MapList-response>"
  "tele_presence/MapListResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapList-response)))
  "Returns string type for a service object of type 'MapList-response"
  "tele_presence/MapListResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapList-response>)))
  "Returns md5sum for a message object of type '<MapList-response>"
  "ca5a33dd106a2c24cfd54c927d214957")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapList-response)))
  "Returns md5sum for a message object of type 'MapList-response"
  "ca5a33dd106a2c24cfd54c927d214957")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapList-response>)))
  "Returns full string definition for message of type '<MapList-response>"
  (cl:format cl:nil "~%MapListEntry[] map_list~%~%~%================================================================================~%MSG: tele_presence/MapListEntry~%# One entry in a list of maps.~%~%# Naming a map is optional.~%string name~%~%# Maps made by the make-a-map app are given a session ID, which is the~%# time when the map-making session was started, expressed as seconds~%# since the epoch and converted to a string.~%string session_id~%~%# Creation time of this map, in seconds since the epoch.~%int64 date~%~%# Unique ID of this map.~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapList-response)))
  "Returns full string definition for message of type 'MapList-response"
  (cl:format cl:nil "~%MapListEntry[] map_list~%~%~%================================================================================~%MSG: tele_presence/MapListEntry~%# One entry in a list of maps.~%~%# Naming a map is optional.~%string name~%~%# Maps made by the make-a-map app are given a session ID, which is the~%# time when the map-making session was started, expressed as seconds~%# since the epoch and converted to a string.~%string session_id~%~%# Creation time of this map, in seconds since the epoch.~%int64 date~%~%# Unique ID of this map.~%string map_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapList-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'map_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapList-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapList-response
    (cl:cons ':map_list (map_list msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapList)))
  'MapList-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapList)))
  'MapList-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapList)))
  "Returns string type for a service object of type '<MapList>"
  "tele_presence/MapList")