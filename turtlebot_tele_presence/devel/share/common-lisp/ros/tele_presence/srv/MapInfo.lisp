; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude MapInfo-request.msg.html

(cl:defclass <MapInfo-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MapInfo-request (<MapInfo-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapInfo-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapInfo-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapInfo-request> is deprecated: use tele_presence-srv:MapInfo-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapInfo-request>) ostream)
  "Serializes a message object of type '<MapInfo-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapInfo-request>) istream)
  "Deserializes a message object of type '<MapInfo-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapInfo-request>)))
  "Returns string type for a service object of type '<MapInfo-request>"
  "tele_presence/MapInfoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapInfo-request)))
  "Returns string type for a service object of type 'MapInfo-request"
  "tele_presence/MapInfoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapInfo-request>)))
  "Returns md5sum for a message object of type '<MapInfo-request>"
  "93f442f1ef5b47ae94c60376f3e41b25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapInfo-request)))
  "Returns md5sum for a message object of type 'MapInfo-request"
  "93f442f1ef5b47ae94c60376f3e41b25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapInfo-request>)))
  "Returns full string definition for message of type '<MapInfo-request>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapInfo-request)))
  "Returns full string definition for message of type 'MapInfo-request"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapInfo-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapInfo-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapInfo-request
))
;//! \htmlinclude MapInfo-response.msg.html

(cl:defclass <MapInfo-response> (roslisp-msg-protocol:ros-message)
  ((info
    :reader info
    :initarg :info
    :type nav_msgs-msg:MapMetaData
    :initform (cl:make-instance 'nav_msgs-msg:MapMetaData)))
)

(cl:defclass MapInfo-response (<MapInfo-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapInfo-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapInfo-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<MapInfo-response> is deprecated: use tele_presence-srv:MapInfo-response instead.")))

(cl:ensure-generic-function 'info-val :lambda-list '(m))
(cl:defmethod info-val ((m <MapInfo-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:info-val is deprecated.  Use tele_presence-srv:info instead.")
  (info m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapInfo-response>) ostream)
  "Serializes a message object of type '<MapInfo-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'info) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapInfo-response>) istream)
  "Deserializes a message object of type '<MapInfo-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'info) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapInfo-response>)))
  "Returns string type for a service object of type '<MapInfo-response>"
  "tele_presence/MapInfoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapInfo-response)))
  "Returns string type for a service object of type 'MapInfo-response"
  "tele_presence/MapInfoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapInfo-response>)))
  "Returns md5sum for a message object of type '<MapInfo-response>"
  "93f442f1ef5b47ae94c60376f3e41b25")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapInfo-response)))
  "Returns md5sum for a message object of type 'MapInfo-response"
  "93f442f1ef5b47ae94c60376f3e41b25")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapInfo-response>)))
  "Returns full string definition for message of type '<MapInfo-response>"
  (cl:format cl:nil "~%nav_msgs/MapMetaData info~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapInfo-response)))
  "Returns full string definition for message of type 'MapInfo-response"
  (cl:format cl:nil "~%nav_msgs/MapMetaData info~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapInfo-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'info))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapInfo-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapInfo-response
    (cl:cons ':info (info msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapInfo)))
  'MapInfo-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapInfo)))
  'MapInfo-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapInfo)))
  "Returns string type for a service object of type '<MapInfo>"
  "tele_presence/MapInfo")