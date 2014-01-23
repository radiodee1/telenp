; Auto-generated. Do not edit!


(cl:in-package tele_presence-msg)


;//! \htmlinclude MapListEntryList.msg.html

(cl:defclass <MapListEntryList> (roslisp-msg-protocol:ros-message)
  ((len
    :reader len
    :initarg :len
    :type cl:fixnum
    :initform 0)
   (list
    :reader list
    :initarg :list
    :type (cl:vector tele_presence-msg:MapListElement)
   :initform (cl:make-array 0 :element-type 'tele_presence-msg:MapListElement :initial-element (cl:make-instance 'tele_presence-msg:MapListElement))))
)

(cl:defclass MapListEntryList (<MapListEntryList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapListEntryList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapListEntryList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-msg:<MapListEntryList> is deprecated: use tele_presence-msg:MapListEntryList instead.")))

(cl:ensure-generic-function 'len-val :lambda-list '(m))
(cl:defmethod len-val ((m <MapListEntryList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:len-val is deprecated.  Use tele_presence-msg:len instead.")
  (len m))

(cl:ensure-generic-function 'list-val :lambda-list '(m))
(cl:defmethod list-val ((m <MapListEntryList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:list-val is deprecated.  Use tele_presence-msg:list instead.")
  (list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapListEntryList>) ostream)
  "Serializes a message object of type '<MapListEntryList>"
  (cl:let* ((signed (cl:slot-value msg 'len)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapListEntryList>) istream)
  "Deserializes a message object of type '<MapListEntryList>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'len) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'tele_presence-msg:MapListElement))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapListEntryList>)))
  "Returns string type for a message object of type '<MapListEntryList>"
  "tele_presence/MapListEntryList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapListEntryList)))
  "Returns string type for a message object of type 'MapListEntryList"
  "tele_presence/MapListEntryList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapListEntryList>)))
  "Returns md5sum for a message object of type '<MapListEntryList>"
  "5c762e362468140551c91eb577f1fd7a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapListEntryList)))
  "Returns md5sum for a message object of type 'MapListEntryList"
  "5c762e362468140551c91eb577f1fd7a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapListEntryList>)))
  "Returns full string definition for message of type '<MapListEntryList>"
  (cl:format cl:nil "# num of available maps/ num of maps in list~%int8 len~%~%# list of available map_id objects~%tele_presence/MapListElement[] list~%~%~%~%================================================================================~%MSG: tele_presence/MapListElement~%#MapListElement.msg~%~%string name~%string id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapListEntryList)))
  "Returns full string definition for message of type 'MapListEntryList"
  (cl:format cl:nil "# num of available maps/ num of maps in list~%int8 len~%~%# list of available map_id objects~%tele_presence/MapListElement[] list~%~%~%~%================================================================================~%MSG: tele_presence/MapListElement~%#MapListElement.msg~%~%string name~%string id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapListEntryList>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapListEntryList>))
  "Converts a ROS message object to a list"
  (cl:list 'MapListEntryList
    (cl:cons ':len (len msg))
    (cl:cons ':list (list msg))
))
