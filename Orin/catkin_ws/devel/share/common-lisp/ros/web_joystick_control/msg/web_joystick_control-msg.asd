
(cl:in-package :asdf)

(defsystem "web_joystick_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "JoystickData" :depends-on ("_package_JoystickData"))
    (:file "_package_JoystickData" :depends-on ("_package"))
  ))