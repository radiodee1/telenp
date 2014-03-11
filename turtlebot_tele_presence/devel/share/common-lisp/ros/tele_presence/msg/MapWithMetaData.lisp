; Auto-generated. Do not edit!


(cl:in-package tele_presence-msg)


;//! \htmlinclude MapWithMetaData.msg.html

(cl:defclass <MapWithMetaData> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (session_id
    :reader session_id
    :initarg :session_id
    :type cl:string
    :initform "")
   (date
    :reader date
    :initarg :date
    :type cl:integer
    :initform 0)
   (map_id
    :reader map_id
    :initarg :map_id
    :type cl:string
    :initform "")
   (grid
    :reader grid
    :initarg :grid
    :type nav_msgs-msg:OccupancyGrid
    :initform (cl:make-instance 'nav_msgs-msg:OccupancyGrid)))
)

(cl:defclass MapWithMetaData (<MapWithMetaData>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapWithMetaData>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapWithMetaData)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-msg:<MapWithMetaData> is deprecated: use tele_presence-msg:MapWithMetaData instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <MapWithMetaData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:name-val is deprecated.  Use tele_presence-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'session_id-val :lambda-list '(m))
(cl:defmethod session_id-val ((m <MapWithMetaData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:session_id-val is deprecated.  Use tele_presence-msg:session_id instead.")
  (session_id m))

(cl:ensure-generic-function 'date-val :lambda-list '(m))
(cl:defmethod date-val ((m <MapWithMetaData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:date-val is deprecated.  Use tele_presence-msg:date instead.")
  (date m))

(cl:ensure-generic-function 'map_id-val :lambda-list '(m))
(cl:defmethod map_id-val ((m <MapWithMetaData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:map_id-val is deprecated.  Use tele_presence-msg:map_id instead.")
  (map_id m))

(cl:ensure-generic-function 'grid-val :lambda-list '(m))
(cl:defmethod grid-val ((m <MapWithMetaData>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:grid-val is deprecated.  Use tele_presence-msg:grid instead.")
  (grid m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapWithMetaData>) ostream)
  "Serializes a message object of type '<MapWithMetaData>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'session_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'session_id))
  (cl:let* ((signed (cl:slot-value msg 'date)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'map_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'map_id))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'grid) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapWithMetaData>) istream)
  "Deserializes a message object of type '<MapWithMetaData>"
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
      (cl:setf (cl:slot-value msg 'session_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'session_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'date) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'map_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'map_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'grid) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapWithMetaData>)))
  "Returns string type for a message object of type '<MapWithMetaData>"
  "tele_presence/MapWithMetaData")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapWithMetaData)))
  "Returns string type for a message object of type 'MapWithMetaData"
  "tele_presence/MapWithMetaData")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapWithMetaData>)))
  "Returns md5sum for a message object of type '<MapWithMetaData>"
  "c4f0432dbbaf8b2972e01c8ae605ce7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapWithMetaData)))
  "Returns md5sum for a message object of type 'MapWithMetaData"
  "c4f0432dbbaf8b2972e01c8ae605ce7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapWithMetaData>)))
  "Returns full string definition for message of type '<MapWithMetaData>"
  (cl:format cl:nil "# One entry in a list of maps.~%~%# Naming a map is optional.~%string name~%~%# Maps made by the make-a-map app are given a session ID, which is the~%# time when the map-making session was started, expressed as seconds~%# since the epoch and converted to a string.~%string session_id~%~%# Creation time of this map, in seconds since the epoch.~%int64 date~%~%# Unique ID of this map.~%string map_id~%~%# Entire map object~%nav_msgs/OccupancyGrid grid~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapWithMetaData)))
  "Returns full string definition for message of type 'MapWithMetaData"
  (cl:format cl:nil "# One entry in a list of maps.~%~%# Naming a map is optional.~%string name~%~%# Maps made by the make-a-map app are given a session ID, which is the~%# time when the map-making session was started, expressed as seconds~%# since the epoch and converted to a string.~%string session_id~%~%# Creation time of this map, in seconds since the epoch.~%int64 date~%~%# Unique ID of this map.~%string map_id~%~%# Entire map object~%nav_msgs/OccupancyGrid grid~%~%================================================================================~%MSG: nav_msgs/OccupancyGrid~%# This represents a 2-D grid map, in which each cell represents the probability of~%# occupancy.~%~%Header header ~%~%#MetaData for the map~%MapMetaData info~%~%# The map data, in row-major order, starting with (0,0).  Occupancy~%# probabilities are in the range [0,100].  Unknown is -1.~%int8[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapWithMetaData>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'session_id))
     8
     4 (cl:length (cl:slot-value msg 'map_id))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'grid))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapWithMetaData>))
  "Converts a ROS message object to a list"
  (cl:list 'MapWithMetaData
    (cl:cons ':name (name msg))
    (cl:cons ':session_id (session_id msg))
    (cl:cons ':date (date msg))
    (cl:cons ':map_id (map_id msg))
    (cl:cons ':grid (grid msg))
))
