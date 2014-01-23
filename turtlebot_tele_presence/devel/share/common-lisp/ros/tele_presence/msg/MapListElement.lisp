; Auto-generated. Do not edit!


(cl:in-package tele_presence-msg)


;//! \htmlinclude MapListElement.msg.html

(cl:defclass <MapListElement> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (id
    :reader id
    :initarg :id
    :type cl:string
    :initform ""))
)

(cl:defclass MapListElement (<MapListElement>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapListElement>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapListElement)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-msg:<MapListElement> is deprecated: use tele_presence-msg:MapListElement instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <MapListElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:name-val is deprecated.  Use tele_presence-msg:name instead.")
  (name m))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <MapListElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-msg:id-val is deprecated.  Use tele_presence-msg:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapListElement>) ostream)
  "Serializes a message object of type '<MapListElement>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapListElement>) istream)
  "Deserializes a message object of type '<MapListElement>"
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
      (cl:setf (cl:slot-value msg 'id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapListElement>)))
  "Returns string type for a message object of type '<MapListElement>"
  "tele_presence/MapListElement")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapListElement)))
  "Returns string type for a message object of type 'MapListElement"
  "tele_presence/MapListElement")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapListElement>)))
  "Returns md5sum for a message object of type '<MapListElement>"
  "950df7116b43513740d4d56345eb3851")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapListElement)))
  "Returns md5sum for a message object of type 'MapListElement"
  "950df7116b43513740d4d56345eb3851")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapListElement>)))
  "Returns full string definition for message of type '<MapListElement>"
  (cl:format cl:nil "#MapListElement.msg~%~%string name~%string id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapListElement)))
  "Returns full string definition for message of type 'MapListElement"
  (cl:format cl:nil "#MapListElement.msg~%~%string name~%string id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapListElement>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     4 (cl:length (cl:slot-value msg 'id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapListElement>))
  "Converts a ROS message object to a list"
  (cl:list 'MapListElement
    (cl:cons ':name (name msg))
    (cl:cons ':id (id msg))
))
