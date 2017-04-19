; Auto-generated. Do not edit!


(cl:in-package cg_mrslam-msg)


;//! \htmlinclude Edge.msg.html

(cl:defclass <Edge> (roslisp-msg-protocol:ros-message)
  ((idFrom
    :reader idFrom
    :initarg :idFrom
    :type cl:integer
    :initform 0)
   (idTo
    :reader idTo
    :initarg :idTo
    :type cl:integer
    :initform 0)
   (estimate
    :reader estimate
    :initarg :estimate
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (information
    :reader information
    :initarg :information
    :type (cl:vector cl:float)
   :initform (cl:make-array 6 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Edge (<Edge>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Edge>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Edge)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cg_mrslam-msg:<Edge> is deprecated: use cg_mrslam-msg:Edge instead.")))

(cl:ensure-generic-function 'idFrom-val :lambda-list '(m))
(cl:defmethod idFrom-val ((m <Edge>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:idFrom-val is deprecated.  Use cg_mrslam-msg:idFrom instead.")
  (idFrom m))

(cl:ensure-generic-function 'idTo-val :lambda-list '(m))
(cl:defmethod idTo-val ((m <Edge>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:idTo-val is deprecated.  Use cg_mrslam-msg:idTo instead.")
  (idTo m))

(cl:ensure-generic-function 'estimate-val :lambda-list '(m))
(cl:defmethod estimate-val ((m <Edge>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:estimate-val is deprecated.  Use cg_mrslam-msg:estimate instead.")
  (estimate m))

(cl:ensure-generic-function 'information-val :lambda-list '(m))
(cl:defmethod information-val ((m <Edge>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:information-val is deprecated.  Use cg_mrslam-msg:information instead.")
  (information m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Edge>) ostream)
  "Serializes a message object of type '<Edge>"
  (cl:let* ((signed (cl:slot-value msg 'idFrom)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'idTo)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'estimate))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'information))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Edge>) istream)
  "Deserializes a message object of type '<Edge>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idFrom) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'idTo) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (cl:setf (cl:slot-value msg 'estimate) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'estimate)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'information) (cl:make-array 6))
  (cl:let ((vals (cl:slot-value msg 'information)))
    (cl:dotimes (i 6)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Edge>)))
  "Returns string type for a message object of type '<Edge>"
  "cg_mrslam/Edge")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Edge)))
  "Returns string type for a message object of type 'Edge"
  "cg_mrslam/Edge")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Edge>)))
  "Returns md5sum for a message object of type '<Edge>"
  "384fe2e5bedbc35780991580d2e3ab00")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Edge)))
  "Returns md5sum for a message object of type 'Edge"
  "384fe2e5bedbc35780991580d2e3ab00")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Edge>)))
  "Returns full string definition for message of type '<Edge>"
  (cl:format cl:nil "int32 idFrom~%int32 idTo~%float64[3] estimate~%float64[6] information~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Edge)))
  "Returns full string definition for message of type 'Edge"
  (cl:format cl:nil "int32 idFrom~%int32 idTo~%float64[3] estimate~%float64[6] information~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Edge>))
  (cl:+ 0
     4
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'estimate) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'information) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Edge>))
  "Converts a ROS message object to a list"
  (cl:list 'Edge
    (cl:cons ':idFrom (idFrom msg))
    (cl:cons ':idTo (idTo msg))
    (cl:cons ':estimate (estimate msg))
    (cl:cons ':information (information msg))
))
