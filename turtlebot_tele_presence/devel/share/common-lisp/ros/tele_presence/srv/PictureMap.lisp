; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude PictureMap-request.msg.html

(cl:defclass <PictureMap-request> (roslisp-msg-protocol:ros-message)
  ((width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0))
)

(cl:defclass PictureMap-request (<PictureMap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PictureMap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PictureMap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<PictureMap-request> is deprecated: use tele_presence-srv:PictureMap-request instead.")))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <PictureMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:width-val is deprecated.  Use tele_presence-srv:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <PictureMap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:height-val is deprecated.  Use tele_presence-srv:height instead.")
  (height m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PictureMap-request>) ostream)
  "Serializes a message object of type '<PictureMap-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PictureMap-request>) istream)
  "Deserializes a message object of type '<PictureMap-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'width)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'height)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'height)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PictureMap-request>)))
  "Returns string type for a service object of type '<PictureMap-request>"
  "tele_presence/PictureMapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PictureMap-request)))
  "Returns string type for a service object of type 'PictureMap-request"
  "tele_presence/PictureMapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PictureMap-request>)))
  "Returns md5sum for a message object of type '<PictureMap-request>"
  "2072cf7b323fcffc102c0e499eefea97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PictureMap-request)))
  "Returns md5sum for a message object of type 'PictureMap-request"
  "2072cf7b323fcffc102c0e499eefea97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PictureMap-request>)))
  "Returns full string definition for message of type '<PictureMap-request>"
  (cl:format cl:nil "~%~%uint32 width~%uint32 height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PictureMap-request)))
  "Returns full string definition for message of type 'PictureMap-request"
  (cl:format cl:nil "~%~%uint32 width~%uint32 height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PictureMap-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PictureMap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PictureMap-request
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
))
;//! \htmlinclude PictureMap-response.msg.html

(cl:defclass <PictureMap-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass PictureMap-response (<PictureMap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PictureMap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PictureMap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<PictureMap-response> is deprecated: use tele_presence-srv:PictureMap-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <PictureMap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:data-val is deprecated.  Use tele_presence-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PictureMap-response>) ostream)
  "Serializes a message object of type '<PictureMap-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PictureMap-response>) istream)
  "Deserializes a message object of type '<PictureMap-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PictureMap-response>)))
  "Returns string type for a service object of type '<PictureMap-response>"
  "tele_presence/PictureMapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PictureMap-response)))
  "Returns string type for a service object of type 'PictureMap-response"
  "tele_presence/PictureMapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PictureMap-response>)))
  "Returns md5sum for a message object of type '<PictureMap-response>"
  "2072cf7b323fcffc102c0e499eefea97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PictureMap-response)))
  "Returns md5sum for a message object of type 'PictureMap-response"
  "2072cf7b323fcffc102c0e499eefea97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PictureMap-response>)))
  "Returns full string definition for message of type '<PictureMap-response>"
  (cl:format cl:nil "string data~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PictureMap-response)))
  "Returns full string definition for message of type 'PictureMap-response"
  (cl:format cl:nil "string data~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PictureMap-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PictureMap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PictureMap-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PictureMap)))
  'PictureMap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PictureMap)))
  'PictureMap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PictureMap)))
  "Returns string type for a service object of type '<PictureMap>"
  "tele_presence/PictureMap")