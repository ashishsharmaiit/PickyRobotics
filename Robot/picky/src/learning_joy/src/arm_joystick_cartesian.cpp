#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/Twist.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>
#include <moveit_visual_tools/moveit_visual_tools.h>
#include <moveit_msgs/MoveItErrorCodes.h>
#include <iostream>
#include <ros/console.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2/LinearMath/Matrix3x3.h>
#include <web_joystick_control/JoystickData.h>

// Global variables to store joystick values
double joy_x = 0.0;
double joy_y = 0.0;
double joy_z_inc = 0.0;
double joy_z_dec = 0.0;
bool joy_rx = false;
bool joy_ry = false;
bool joy_rz = false;
bool toggle = false;
double qx = 0.0;
double qy = 0.0;
double qz = 0.0;
double qw = 0.0;
double rx = 0.0;
double ry = 0.0;
double rz = 0.0;

// Joystick callback function
// void joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
void joyCallback(const web_joystick_control::JoystickData::ConstPtr& joy)
{
  // Set linear velocities based on joystick axes
  joy_x = joy->axes[6];  // X-axis control
  joy_y = joy->axes[7];  // Y-axis control
  joy_z_inc = joy->buttons[4];  // +Z-axis control
  joy_z_dec = joy->buttons[5];  // -Z-axis control
  joy_rx = joy->buttons[2] == 1;  // rx-axis control
  joy_ry = joy->buttons[3] == 1;  // ry-axis control
  joy_rz = joy->buttons[1] == 1;  // rz-axis control
  toggle = joy->buttons[6] == 1; // toggle
}

int main(int argc, char** argv)
{
  // Initialize ROS
  ros::init(argc, argv, "arm_joystick_node");
  ros::NodeHandle node_handle;
  ros::AsyncSpinner spinner(1);
  spinner.start();

  // Subscribe to joystick topic
  // Joystick connected to local computer
  // ros::Subscriber joy_sub = node_handle.subscribe<sensor_msgs::Joy>("joy", 10, joyCallback);
  // Joystick connected to remote computer
  ros::Subscriber joy_sub = node_handle.subscribe<web_joystick_control::JoystickData>("/joystick_data", 10, joyCallback);
  
  // Initialize MoveIt
  static const std::string PLANNING_GROUP = "arm";  // Replace with your planning group name
  moveit::planning_interface::MoveGroupInterface move_group(PLANNING_GROUP);

  // Set the planner
  move_group.setPlannerId("RRTConnect");
  move_group.setPlanningTime(1);
  move_group.setNumPlanningAttempts(10);
  move_group.setMaxVelocityScalingFactor(1.0);
  move_group.setMaxAccelerationScalingFactor(1.0);

  // Get the current pose as the initial pose
  geometry_msgs::PoseStamped current_pose = move_group.getCurrentPose();

  // Set the initial pose as the target pose
  geometry_msgs::Pose target_pose;

  // rotation quaternions
  tf2::Quaternion quat_rx, quat_ry, quat_rz, orientation;

  // Main loop
  while (ros::ok())
  {
    while (joy_x != 0.0 || joy_y != 0.0 || joy_z_inc != 0.0 || joy_z_dec != 0.0 || joy_rx != 0.0 || joy_ry != 0.0 || joy_rz != 0.0)
    {
      // Update current pose
      current_pose = move_group.getCurrentPose();

      // Update target position based on joystick input
      target_pose.position.x += joy_x * 0.05;  // Scale the joystick input as needed
      target_pose.position.y += joy_y * 0.05;
      target_pose.position.z += joy_z_inc * 0.05;
      target_pose.position.z -= joy_z_dec * 0.05;

      // Current orientation of robot.
      qx = target_pose.orientation.x;
      qy = target_pose.orientation.y;
      qz = target_pose.orientation.z;
      qw = target_pose.orientation.w;
      orientation = tf2::Quaternion(qx, qy, qz, qw);
      orientation.normalize();

      if (toggle) {
        if (joy_rx){
          rx -= joy_rx * 0.025;  // Scale the joystick input as needed
        }
        if (joy_ry){
          ry -= joy_ry * 0.025;
        }
        if (joy_ry){
          rz -= joy_rz * 0.025;
        }
      } else {
        if (joy_rx){
          rx += joy_rx * 0.025;  // Scale the joystick input as needed
        }
        if (joy_ry){
          ry += joy_ry * 0.025;
        }
        if (joy_rz){
          rz += joy_rz * 0.025;
        }
      }

      // Create the rotation quaternions
      quat_rx.setRPY(rx, 0.0, 0.0);
      quat_ry.setRPY(0.0, ry, 0.0);
      quat_rz.setRPY(0.0, 0.0, rz);

      // Perform the rotations
      tf2::Quaternion new_orientation = quat_rz * quat_ry * quat_rx * orientation;
      new_orientation.normalize();
      target_pose.orientation.x = new_orientation.x();
      target_pose.orientation.y = new_orientation.y();
      target_pose.orientation.z = new_orientation.z();
      target_pose.orientation.w = new_orientation.w();

      // Set the updated target pose
      move_group.setPoseTarget(target_pose);

      // Plan and execute the motion
      moveit::planning_interface::MoveGroupInterface::Plan my_plan;
      bool success = (move_group.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS);
      if (success) {
        move_group.execute(my_plan);
        ROS_INFO("Motion execution complete");
      } else {
        ROS_ERROR("Failed to plan motion");
      }
    }
    target_pose = current_pose.pose;

    ros::spinOnce();
  }

  // Stop the spinner and shutdown ROS
  spinner.stop();
  ros::shutdown();

  return 0;
}
