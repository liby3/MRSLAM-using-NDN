; Auto-generated. Do not edit!


(cl:in-package cg_mrslam-msg)


;//! \htmlinclude RobotLaser.msg.html

(cl:defclass <RobotLaser> (roslisp-msg-protocol:ros-message)
  ((nodeId
    :reader nodeId
    :initarg :nodeId
    :type cl:integer
    :initform 0)
   (readings
    :reader readings
    :initarg :readings
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (minAngle
    :reader minAngle
    :initarg :minAngle
    :type cl:float
    :initform 0.0)
   (angleInc
    :reader angleInc
    :initarg :angleInc
    :type cl:float
    :initform 0.0)
   (maxRange
    :reader maxRange
    :initarg :maxRange
    :type cl:float
    :initform 0.0)
   (accuracy
    :reader accuracy
    :initarg :accuracy
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotLaser (<RobotLaser>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotLaser>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotLaser)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cg_mrslam-msg:<RobotLaser> is deprecated: use cg_mrslam-msg:RobotLaser instead.")))

(cl:ensure-generic-function 'nodeId-val :lambda-list '(m))
(cl:defmethod nodeId-val ((m <RobotLaser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:nodeId-val is deprecated.  Use cg_mrslam-msg:nodeId instead.")
  (nodeId m))

(cl:ensure-generic-function 'readings-val :lambda-list '(m))
(cl:defmethod readings-val ((m <RobotLaser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:readings-val is deprecated.  Use cg_mrslam-msg:readings instead.")
  (readings m))

(cl:ensure-generic-function 'minAngle-val :lambda-list '(m))
(cl:defmethod minAngle-val ((m <RobotLaser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:minAngle-val is deprecated.  Use cg_mrslam-msg:minAngle instead.")
  (minAngle m))

(cl:ensure-generic-function 'angleInc-val :lambda-list '(m))
(cl:defmethod angleInc-val ((m <RobotLaser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:angleInc-val is deprecated.  Use cg_mrslam-msg:angleInc instead.")
  (angleInc m))

(cl:ensure-generic-function 'maxRange-val :lambda-list '(m))
(cl:defmethod maxRange-val ((m <RobotLaser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:maxRange-val is deprecated.  Use cg_mrslam-msg:maxRange instead.")
  (maxRange m))

(cl:ensure-generic-function 'accuracy-val :lambda-list '(m))
(cl:defmethod accuracy-val ((m <RobotLaser>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:accuracy-val is deprecated.  Use cg_mrslam-msg:accuracy instead.")
  (accuracy m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotLaser>) ostream)
  "Serializes a message object of type '<RobotLaser>"
  (cl:let* ((signed (cl:slot-value msg 'nodeId)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'readings))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'readings))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'minAngle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angleInc))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'maxRange))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'accuracy))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotLaser>) istream)
  "Deserializes a message object of type '<RobotLaser>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nodeId) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'readings) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'readings)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'minAngle) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angleInc) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maxRange) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'accuracy) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotLaser>)))
  "Returns string type for a message object of type '<RobotLaser>"
  "cg_mrslam/RobotLaser")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotLaser)))
  "Returns string type for a message object of type 'RobotLaser"
  "cg_mrslam/RobotLaser")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotLaser>)))
  "Returns md5sum for a message object of type '<RobotLaser>"
  "b8902142cac87a16bb07fb5598e39ab0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotLaser)))
  "Returns md5sum for a message object of type 'RobotLaser"
  "b8902142cac87a16bb07fb5598e39ab0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotLaser>)))
  "Returns full string definition for message of type '<RobotLaser>"
  (cl:format cl:nil "int32 nodeId~%float64[] readings~%float64 minAngle~%float64 angleInc~%float64 maxRange~%float64 accuracy~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotLaser)))
  "Returns full string definition for message of type 'RobotLaser"
  (cl:format cl:nil "int32 nodeId~%float64[] readings~%float64 minAngle~%float64 angleInc~%float64 maxRange~%float64 accuracy~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotLaser>))
  (cl:+ 0
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'readings) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotLaser>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotLaser
    (cl:cons ':nodeId (nodeId msg))
    (cl:cons ':readings (readings msg))
    (cl:cons ':minAngle (minAngle msg))
    (cl:cons ':angleInc (angleInc msg))
    (cl:cons ':maxRange (maxRange msg))
    (cl:cons ':accuracy (accuracy msg))
))
