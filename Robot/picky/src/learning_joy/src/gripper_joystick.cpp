// %Tag(FULL)%
// %Tag(INCLUDE)%
#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <std_msgs/Float64.h>
// %EndTag(INCLUDE)%
#include <web_joystick_control/JoystickData.h>


// %Tag(CLASSDEF)%
class GripperController
{
public:
  GripperController();

private:
  // void joyCallback(const sensor_msgs::Joy::ConstPtr& joy);
  void joyCallback(const web_joystick_control::JoystickData::ConstPtr& joy);
  ros::NodeHandle nh_;

  int gripper_button_;  // Joystick button index for gripper control
  bool is_gripper_open_;  // Variable to track the gripper state
  ros::Publisher gripper_pub_;
  ros::Subscriber joy_sub_;
};
// %EndTag(CLASSDEF)%

// %Tag(PARAMS)%
GripperController::GripperController():
  gripper_button_(0),  // Set the default joystick button index for gripper control
  is_gripper_open_(false)  // Set the initial gripper state to closed
{
  nh_.param("gripper_button", gripper_button_, gripper_button_);

  gripper_pub_ = nh_.advertise<std_msgs::Float64>("/rh_p12_rn_position/command", 1);

  // Joystick connected to local computer
  // joy_sub_ = nh_.subscribe<sensor_msgs::Joy>("joy", 10, &GripperController::joyCallback, this);
  // Joystick connected to remote computer
  joy_sub_ = nh_.subscribe<web_joystick_control::JoystickData>("/joystick_data", 10, &GripperController::joyCallback, this);

}
// %EndTag(PARAMS)%

// %Tag(CALLBACK)%
// void GripperController::joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
void GripperController::joyCallback(const web_joystick_control::JoystickData::ConstPtr& joy)
{
  // Toggle the gripper state when the specified button is pressed
  if (joy->buttons[gripper_button_] == 1)
  {
    is_gripper_open_ = !is_gripper_open_;

    std_msgs::Float64 gripper_cmd;
    gripper_cmd.data = is_gripper_open_ ? 0.75 : 0.0;  // Set the gripper command based on the gripper state

    gripper_pub_.publish(gripper_cmd);
  }
}
// %EndTag(CALLBACK)%

// %Tag(MAIN)%
int main(int argc, char** argv)
{
  ros::init(argc, argv, "gripper_joystick_node");
  GripperController gripper_controller;

  ros::spin();
}
// %EndTag(MAIN)%
// %EndTag(FULL)%

