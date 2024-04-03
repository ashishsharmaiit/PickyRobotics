 #include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/Twist.h>
#include <web_joystick_control/JoystickData.h>

class RobotController
{
public:
  RobotController();

private:
  // void joyCallback(const sensor_msgs::Joy::ConstPtr& joy);
  void joyCallback(const web_joystick_control::JoystickData::ConstPtr& joy);

  ros::NodeHandle nh_;
  ros::Publisher twist_pub_;
  ros::Subscriber joy_sub_;

  int forward_backward_axis_;    // Joystick axis index for forward/backward motion
  int sideways_axis_;            // Joystick axis index for sideways motion
  int clockwise_axis_;           // Joystick buttons index for clockwise rotation
  int counter_clockwise_axis_;   // Joystick buttons index for clockwise rotation
  double linear_scale_;          // Scaling factor for linear motion
  double angular_scale_;         // Scaling factor for angular motion
  bool stop_robot_;              // Flag to stop the robot

  geometry_msgs::Twist stop_twist_;  // Twist message with zero velocities

};

RobotController::RobotController():
  forward_backward_axis_(7),
  sideways_axis_(6),
  clockwise_axis_(5),
  counter_clockwise_axis_(4),
  linear_scale_(0.3),
  angular_scale_(1.0),
  stop_robot_(false)
{
  twist_pub_ = nh_.advertise<geometry_msgs::Twist>("cmd_vel", 1);
  // Joystick connected to local computer
  // Joystick connected to remote computer  
  joy_sub_ = nh_.subscribe<web_joystick_control::JoystickData>("/joystick_data", 10, &RobotController::joyCallback, this);

  // Initialize the stop_twist_ message with zero velocities
  stop_twist_.linear.x = 0.0;
  stop_twist_.linear.y = 0.0;
  stop_twist_.angular.z = 0.0;
}

// void RobotController::joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
void RobotController::joyCallback(const web_joystick_control::JoystickData::ConstPtr& joy)
{
  geometry_msgs::Twist twist;

  if (stop_robot_)
  {
    // If the robot is stopped, check if any axes keys are pressed to move the robot again
    if (joy->axes[forward_backward_axis_] != 0.0 ||
        joy->axes[sideways_axis_] != 0.0 ||
        joy->buttons[clockwise_axis_] != 0.0 || joy->buttons[counter_clockwise_axis_] != 0.0)
    {
      stop_robot_ = false; // Reset the stop_robot_ flag to allow movement
    }
    else
    {
      // If no axes keys are pressed, publish the stop_twist_ message to keep the robot stopped
      twist_pub_.publish(stop_twist_);
      return;
    }
  }
  
  // Joystick connected to local computer needs positive gain 
  // int js_gain = +1
  // Joystick connected to remote computer needs negative 
  int js_gain = -1;
  twist.linear.x = js_gain * linear_scale_ * joy->axes[forward_backward_axis_];
  twist.linear.y = js_gain * linear_scale_ * joy->axes[sideways_axis_];
  if (joy->buttons[clockwise_axis_]){
  	twist.angular.z = js_gain * angular_scale_ * joy->buttons[clockwise_axis_];
  } else if (joy->buttons[counter_clockwise_axis_]){
  	twist.angular.z = - js_gain * angular_scale_ * joy->buttons[counter_clockwise_axis_];
  }
  
  twist_pub_.publish(twist);
  
  // Check for the "X" button press (Button 2 on Xbox controller) to stop the robot
  if (joy->buttons[2])
  {
    stop_robot_ = true;
  }
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "base_joystick_control");
  RobotController robot_controller;

  ros::spin();

  return 0;
}

