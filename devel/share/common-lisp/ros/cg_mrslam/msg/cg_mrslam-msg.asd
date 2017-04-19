
(cl:in-package :asdf)

(defsystem "cg_mrslam-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "RobotLaser" :depends-on ("_package_RobotLaser"))
    (:file "_package_RobotLaser" :depends-on ("_package"))
    (:file "info" :depends-on ("_package_info"))
    (:file "_package_info" :depends-on ("_package"))
    (:file "Edge" :depends-on ("_package_Edge"))
    (:file "_package_Edge" :depends-on ("_package"))
    (:file "Ping" :depends-on ("_package_Ping"))
    (:file "_package_Ping" :depends-on ("_package"))
    (:file "VSE2" :depends-on ("_package_VSE2"))
    (:file "_package_VSE2" :depends-on ("_package"))
    (:file "SLAM" :depends-on ("_package_SLAM"))
    (:file "_package_SLAM" :depends-on ("_package"))
  ))