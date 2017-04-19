; Auto-generated. Do not edit!


(cl:in-package cg_mrslam-msg)


;//! \htmlinclude VSE2.msg.html

(cl:defclass <VSE2> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (estimate
    :reader estimate
    :initarg :estimate
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass VSE2 (<VSE2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <VSE2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'VSE2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name cg_mrslam-msg:<VSE2> is deprecated: use cg_mrslam-msg:VSE2 instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <VSE2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:id-val is deprecated.  Use cg_mrslam-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'estimate-val :lambda-list '(m))
(cl:defmethod estimate-val ((m <VSE2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader cg_mrslam-msg:estimate-val is deprecated.  Use cg_mrslam-msg:estimate instead.")
  (estimate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <VSE2>) ostream)
  "Serializes a message object of type '<VSE2>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
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
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <VSE2>) istream)
  "Deserializes a message object of type '<VSE2>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
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
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<VSE2>)))
  "Returns string type for a message object of type '<VSE2>"
  "cg_mrslam/VSE2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'VSE2)))
  "Returns string type for a message object of type 'VSE2"
  "cg_mrslam/VSE2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<VSE2>)))
  "Returns md5sum for a message object of type '<VSE2>"
  "4e742a0df2817c655a3ca88a845b4f80")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'VSE2)))
  "Returns md5sum for a message object of type 'VSE2"
  "4e742a0df2817c655a3ca88a845b4f80")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<VSE2>)))
  "Returns full string definition for message of type '<VSE2>"
  (cl:format cl:nil "int32 id~%float64[3] estimate~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'VSE2)))
  "Returns full string definition for message of type 'VSE2"
  (cl:format cl:nil "int32 id~%float64[3] estimate~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <VSE2>))
  (cl:+ 0
     4
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'estimate) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <VSE2>))
  "Converts a ROS message object to a list"
  (cl:list 'VSE2
    (cl:cons ':id (id msg))
    (cl:cons ':estimate (estimate msg))
))
