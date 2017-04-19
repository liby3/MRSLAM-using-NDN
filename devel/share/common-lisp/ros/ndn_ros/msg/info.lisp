; Auto-generated. Do not edit!


(cl:in-package ndn_ros-msg)


;//! \htmlinclude info.msg.html

(cl:defclass <info> (roslisp-msg-protocol:ros-message)
  ((testInfo
    :reader testInfo
    :initarg :testInfo
    :type cl:string
    :initform ""))
)

(cl:defclass info (<info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ndn_ros-msg:<info> is deprecated: use ndn_ros-msg:info instead.")))

(cl:ensure-generic-function 'testInfo-val :lambda-list '(m))
(cl:defmethod testInfo-val ((m <info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ndn_ros-msg:testInfo-val is deprecated.  Use ndn_ros-msg:testInfo instead.")
  (testInfo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <info>) ostream)
  "Serializes a message object of type '<info>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'testInfo))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'testInfo))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <info>) istream)
  "Deserializes a message object of type '<info>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'testInfo) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'testInfo) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<info>)))
  "Returns string type for a message object of type '<info>"
  "ndn_ros/info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'info)))
  "Returns string type for a message object of type 'info"
  "ndn_ros/info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<info>)))
  "Returns md5sum for a message object of type '<info>"
  "dd28e0abe28786cbb9432df03a243809")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'info)))
  "Returns md5sum for a message object of type 'info"
  "dd28e0abe28786cbb9432df03a243809")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<info>)))
  "Returns full string definition for message of type '<info>"
  (cl:format cl:nil "string testInfo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'info)))
  "Returns full string definition for message of type 'info"
  (cl:format cl:nil "string testInfo~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <info>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'testInfo))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <info>))
  "Converts a ROS message object to a list"
  (cl:list 'info
    (cl:cons ':testInfo (testInfo msg))
))
