;; Auto-generated. Do not edit!


(when (boundp 'web_joystick_control::JoystickData)
  (if (not (find-package "WEB_JOYSTICK_CONTROL"))
    (make-package "WEB_JOYSTICK_CONTROL"))
  (shadow 'JoystickData (find-package "WEB_JOYSTICK_CONTROL")))
(unless (find-package "WEB_JOYSTICK_CONTROL::JOYSTICKDATA")
  (make-package "WEB_JOYSTICK_CONTROL::JOYSTICKDATA"))

(in-package "ROS")
;;//! \htmlinclude JoystickData.msg.html


(defclass web_joystick_control::JoystickData
  :super ros::object
  :slots (_stamp _axes _buttons ))

(defmethod web_joystick_control::JoystickData
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:axes __axes) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:buttons __buttons) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _axes __axes)
   (setq _buttons __buttons)
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:axes
   (&optional __axes)
   (if __axes (setq _axes __axes)) _axes)
  (:buttons
   (&optional __buttons)
   (if __buttons (setq _buttons __buttons)) _buttons)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; float32[] _axes
    (* 4    (length _axes)) 4
    ;; int32[] _buttons
    (* 4    (length _buttons)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; float32[] _axes
     (write-long (length _axes) s)
     (dotimes (i (length _axes))
       (sys::poke (elt _axes i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _buttons
     (write-long (length _buttons) s)
     (dotimes (i (length _buttons))
       (write-long (elt _buttons i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32[] _axes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _axes (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _axes i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _buttons
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _buttons (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _buttons i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get web_joystick_control::JoystickData :md5sum-) "850b4f36c57999e6c2ba9e1c61f93ee3")
(setf (get web_joystick_control::JoystickData :datatype-) "web_joystick_control/JoystickData")
(setf (get web_joystick_control::JoystickData :definition-)
      "time stamp
float32[] axes
int32[] buttons

")



(provide :web_joystick_control/JoystickData "850b4f36c57999e6c2ba9e1c61f93ee3")


