; Auto-generated. Do not edit!


(cl:in-package cg_mrslam-msg)


;//! \htmlinclude SLAM.msg.html

(cl:defclass <SLAM> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (robotId
    :reader robotId
    :initarg :robotId
    :type cl:integer
    :initform 0)
   (type
    :reader type
    :initarg :type
    :type cl:integer
    :initform 0)
   (laser
    :reader laser
    :initarg :laser
    :type cg_mrslam-msg:RobotLaser
    :initform (cl:make-instance 'cg_mrslam-msg:RobotLaser))
   (vertices
    :reader vertices
    :initarg :vertices
    :type (cl:vector cg_mrslam-msg:VSE2)
   :initform (cl:make-array 0 :element-type 'cg_mrslam-msg:VSE2 :initial-element (cl:make-instance 'cg_mrslam-msg:VSE2)))
   (edges
    :reader edges
    :initarg :edges
    :type (cl:vector cg_mrslam-msg:Edge)
   :initform (cl:make-array 0 :element-type 'cg_mrslam-msg:Edge :initial-element (cl:make-instance 'cg_mrslam-msg:Edge)))
   (closures
    :reader closures
    :initarg :closures
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass SLAM (<SLAM>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SLAM>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SLAM)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cg_mrslam-msg:<SLAM> is deprecated: use cg_mrslam-msg:SLAM instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SLAM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:header-val is deprecated.  Use cg_mrslam-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'robotId-val :lambda-list '(m))
(cl:defmethod robotId-val ((m <SLAM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:robotId-val is deprecated.  Use cg_mrslam-msg:robotId instead.")
  (robotId m))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <SLAM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:type-val is deprecated.  Use cg_mrslam-msg:type instead.")
  (type m))

(cl:ensure-generic-function 'laser-val :lambda-list '(m))
(cl:defmethod laser-val ((m <SLAM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:laser-val is deprecated.  Use cg_mrslam-msg:laser instead.")
  (laser m))

(cl:ensure-generic-function 'vertices-val :lambda-list '(m))
(cl:defmethod vertices-val ((m <SLAM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:vertices-val is deprecated.  Use cg_mrslam-msg:vertices instead.")
  (vertices m))

(cl:ensure-generic-function 'edges-val :lambda-list '(m))
(cl:defmethod edges-val ((m <SLAM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:edges-val is deprecated.  Use cg_mrslam-msg:edges instead.")
  (edges m))

(cl:ensure-generic-function 'closures-val :lambda-list '(m))
(cl:defmethod closures-val ((m <SLAM>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:closures-val is deprecated.  Use cg_mrslam-msg:closures instead.")
  (closures m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SLAM>) ostream)
  "Serializes a message object of type '<SLAM>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'robotId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'type)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'laser) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'vertices))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'vertices))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'edges))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'edges))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'closures))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'closures))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SLAM>) istream)
  "Deserializes a message object of type '<SLAM>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robotId) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'laser) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'vertices) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'vertices)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cg_mrslam-msg:VSE2))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'edges) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'edges)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'cg_mrslam-msg:Edge))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'closures) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'closures)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SLAM>)))
  "Returns string type for a message object of type '<SLAM>"
  "cg_mrslam/SLAM")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SLAM)))
  "Returns string type for a message object of type 'SLAM"
  "cg_mrslam/SLAM")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SLAM>)))
  "Returns md5sum for a message object of type '<SLAM>"
  "70b623315e98c3f1c102abd4f25f9c4c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SLAM)))
  "Returns md5sum for a message object of type 'SLAM"
  "70b623315e98c3f1c102abd4f25f9c4c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SLAM>)))
  "Returns full string definition for message of type '<SLAM>"
  (cl:format cl:nil "#Common to al types~%Header header~%int32 robotId~%int32 type~%~%#For Combo Messages~%RobotLaser laser~%VSE2[] vertices~%~%#For Condensed Graph Messages~%Edge[] edges~%int32[] closures~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cg_mrslam/RobotLaser~%int32 nodeId~%float64[] readings~%float64 minAngle~%float64 angleInc~%float64 maxRange~%float64 accuracy~%================================================================================~%MSG: cg_mrslam/VSE2~%int32 id~%float64[3] estimate~%================================================================================~%MSG: cg_mrslam/Edge~%int32 idFrom~%int32 idTo~%float64[3] estimate~%float64[6] information~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SLAM)))
  "Returns full string definition for message of type 'SLAM"
  (cl:format cl:nil "#Common to al types~%Header header~%int32 robotId~%int32 type~%~%#For Combo Messages~%RobotLaser laser~%VSE2[] vertices~%~%#For Condensed Graph Messages~%Edge[] edges~%int32[] closures~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: cg_mrslam/RobotLaser~%int32 nodeId~%float64[] readings~%float64 minAngle~%float64 angleInc~%float64 maxRange~%float64 accuracy~%================================================================================~%MSG: cg_mrslam/VSE2~%int32 id~%float64[3] estimate~%================================================================================~%MSG: cg_mrslam/Edge~%int32 idFrom~%int32 idTo~%float64[3] estimate~%float64[6] information~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SLAM>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'laser))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'vertices) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'edges) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'closures) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SLAM>))
  "Converts a ROS message object to a list"
  (cl:list 'SLAM
    (cl:cons ':header (header msg))
    (cl:cons ':robotId (robotId msg))
    (cl:cons ':type (type msg))
    (cl:cons ':laser (laser msg))
    (cl:cons ':vertices (vertices msg))
    (cl:cons ':edges (edges msg))
    (cl:cons ':closures (closures msg))
))
