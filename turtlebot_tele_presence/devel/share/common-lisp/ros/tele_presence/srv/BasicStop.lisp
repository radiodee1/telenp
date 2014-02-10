; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude BasicStop-request.msg.html

(cl:defclass <BasicStop-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass BasicStop-request (<BasicStop-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicStop-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicStop-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<BasicStop-request> is deprecated: use tele_presence-srv:BasicStop-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <BasicStop-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:command-val is deprecated.  Use tele_presence-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicStop-request>) ostream)
  "Serializes a message object of type '<BasicStop-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicStop-request>) istream)
  "Deserializes a message object of type '<BasicStop-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'command) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'command)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicStop-request>)))
  "Returns string type for a service object of type '<BasicStop-request>"
  "tele_presence/BasicStopRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicStop-request)))
  "Returns string type for a service object of type 'BasicStop-request"
  "tele_presence/BasicStopRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicStop-request>)))
  "Returns md5sum for a message object of type '<BasicStop-request>"
  "3adcc4a2100c5ff118c0238c960ed0f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicStop-request)))
  "Returns md5sum for a message object of type 'BasicStop-request"
  "3adcc4a2100c5ff118c0238c960ed0f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicStop-request>)))
  "Returns full string definition for message of type '<BasicStop-request>"
  (cl:format cl:nil "~%~%string[] command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicStop-request)))
  "Returns full string definition for message of type 'BasicStop-request"
  (cl:format cl:nil "~%~%string[] command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicStop-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'command) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicStop-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicStop-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude BasicStop-response.msg.html

(cl:defclass <BasicStop-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass BasicStop-response (<BasicStop-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicStop-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicStop-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<BasicStop-response> is deprecated: use tele_presence-srv:BasicStop-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicStop-response>) ostream)
  "Serializes a message object of type '<BasicStop-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicStop-response>) istream)
  "Deserializes a message object of type '<BasicStop-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicStop-response>)))
  "Returns string type for a service object of type '<BasicStop-response>"
  "tele_presence/BasicStopResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicStop-response)))
  "Returns string type for a service object of type 'BasicStop-response"
  "tele_presence/BasicStopResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicStop-response>)))
  "Returns md5sum for a message object of type '<BasicStop-response>"
  "3adcc4a2100c5ff118c0238c960ed0f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicStop-response)))
  "Returns md5sum for a message object of type 'BasicStop-response"
  "3adcc4a2100c5ff118c0238c960ed0f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicStop-response>)))
  "Returns full string definition for message of type '<BasicStop-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicStop-response)))
  "Returns full string definition for message of type 'BasicStop-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicStop-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicStop-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicStop-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BasicStop)))
  'BasicStop-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BasicStop)))
  'BasicStop-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicStop)))
  "Returns string type for a service object of type '<BasicStop>"
  "tele_presence/BasicStop")