; Auto-generated. Do not edit!


(cl:in-package tele_presence-srv)


;//! \htmlinclude BasicLaunch-request.msg.html

(cl:defclass <BasicLaunch-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass BasicLaunch-request (<BasicLaunch-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicLaunch-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicLaunch-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<BasicLaunch-request> is deprecated: use tele_presence-srv:BasicLaunch-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <BasicLaunch-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader tele_presence-srv:command-val is deprecated.  Use tele_presence-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicLaunch-request>) ostream)
  "Serializes a message object of type '<BasicLaunch-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicLaunch-request>) istream)
  "Deserializes a message object of type '<BasicLaunch-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicLaunch-request>)))
  "Returns string type for a service object of type '<BasicLaunch-request>"
  "tele_presence/BasicLaunchRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicLaunch-request)))
  "Returns string type for a service object of type 'BasicLaunch-request"
  "tele_presence/BasicLaunchRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicLaunch-request>)))
  "Returns md5sum for a message object of type '<BasicLaunch-request>"
  "3adcc4a2100c5ff118c0238c960ed0f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicLaunch-request)))
  "Returns md5sum for a message object of type 'BasicLaunch-request"
  "3adcc4a2100c5ff118c0238c960ed0f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicLaunch-request>)))
  "Returns full string definition for message of type '<BasicLaunch-request>"
  (cl:format cl:nil "~%~%string[] command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicLaunch-request)))
  "Returns full string definition for message of type 'BasicLaunch-request"
  (cl:format cl:nil "~%~%string[] command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicLaunch-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'command) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicLaunch-request>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicLaunch-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude BasicLaunch-response.msg.html

(cl:defclass <BasicLaunch-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass BasicLaunch-response (<BasicLaunch-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BasicLaunch-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BasicLaunch-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name tele_presence-srv:<BasicLaunch-response> is deprecated: use tele_presence-srv:BasicLaunch-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BasicLaunch-response>) ostream)
  "Serializes a message object of type '<BasicLaunch-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BasicLaunch-response>) istream)
  "Deserializes a message object of type '<BasicLaunch-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BasicLaunch-response>)))
  "Returns string type for a service object of type '<BasicLaunch-response>"
  "tele_presence/BasicLaunchResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicLaunch-response)))
  "Returns string type for a service object of type 'BasicLaunch-response"
  "tele_presence/BasicLaunchResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BasicLaunch-response>)))
  "Returns md5sum for a message object of type '<BasicLaunch-response>"
  "3adcc4a2100c5ff118c0238c960ed0f4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BasicLaunch-response)))
  "Returns md5sum for a message object of type 'BasicLaunch-response"
  "3adcc4a2100c5ff118c0238c960ed0f4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BasicLaunch-response>)))
  "Returns full string definition for message of type '<BasicLaunch-response>"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BasicLaunch-response)))
  "Returns full string definition for message of type 'BasicLaunch-response"
  (cl:format cl:nil "~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BasicLaunch-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BasicLaunch-response>))
  "Converts a ROS message object to a list"
  (cl:list 'BasicLaunch-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'BasicLaunch)))
  'BasicLaunch-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'BasicLaunch)))
  'BasicLaunch-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BasicLaunch)))
  "Returns string type for a service object of type '<BasicLaunch>"
  "tele_presence/BasicLaunch")