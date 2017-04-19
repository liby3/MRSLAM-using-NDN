; Auto-generated. Do not edit!


(cl:in-package cg_mrslam-msg)


;//! \htmlinclude Ping.msg.html

(cl:defclass <Ping> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (robotFrom
    :reader robotFrom
    :initarg :robotFrom
    :type cl:integer
    :initform 0)
   (robotTo
    :reader robotTo
    :initarg :robotTo
    :type cl:integer
    :initform 0))
)

(cl:defclass Ping (<Ping>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ping>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ping)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cg_mrslam-msg:<Ping> is deprecated: use cg_mrslam-msg:Ping instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Ping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:header-val is deprecated.  Use cg_mrslam-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'robotFrom-val :lambda-list '(m))
(cl:defmethod robotFrom-val ((m <Ping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:robotFrom-val is deprecated.  Use cg_mrslam-msg:robotFrom instead.")
  (robotFrom m))

(cl:ensure-generic-function 'robotTo-val :lambda-list '(m))
(cl:defmethod robotTo-val ((m <Ping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:robotTo-val is deprecated.  Use cg_mrslam-msg:robotTo instead.")
  (robotTo m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ping>) ostream)
  "Serializes a message object of type '<Ping>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'robotFrom)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'robotTo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ping>) istream)
  "Deserializes a message object of type '<Ping>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotFrom) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotTo) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ping>)))
  "Returns string type for a message object of type '<Ping>"
  "cg_mrslam/Ping")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ping)))
  "Returns string type for a message object of type 'Ping"
  "cg_mrslam/Ping")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ping>)))
  "Returns md5sum for a message object of type '<Ping>"
  "dbb8c06e269de6d27aacbfe820c1a146")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ping)))
  "Returns md5sum for a message object of type 'Ping"
  "dbb8c06e269de6d27aacbfe820c1a146")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ping>)))
  "Returns full string definition for message of type '<Ping>"
  (cl:format cl:nil "Header header~%int32 robotFrom~%int32 robotTo~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ping)))
  "Returns full string definition for message of type 'Ping"
  (cl:format cl:nil "Header header~%int32 robotFrom~%int32 robotTo~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ping>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ping>))
  "Converts a ROS message object to a list"
  (cl:list 'Ping
    (cl:cons ':header (header msg))
    (cl:cons ':robotFrom (robotFrom msg))
    (cl:cons ':robotTo (robotTo msg))
))
