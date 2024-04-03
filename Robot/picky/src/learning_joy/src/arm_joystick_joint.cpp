#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <trajectory_msgs/JointTrajectory.h>
#include <trajectory_msgs/JointTrajectoryPoint.h>
#include <iostream>
#include <ros/console.h>
#include <web_joystick_control/JoystickData.h>

// Global variables to store joystick values
std::vector<double> joy_joint_values(6, 0.0);

// Joystick callback function
// void joyCallback(const sensor_msgs::Joy::ConstPtr& joy)
void joyCallback(const web_joystick_control::JoystickData::ConstPtr& joy)
{
  // Set joint values based on joystick axes
  const double increment = 0.01;  // Adjust the increment value as needed

  joy_joint_values[0] += joy->axes[0] * increment;  // Joint 1 control
  joy_joint_values[1] += joy->axes[1] * increment;  // Joint 2 control
  joy_joint_values[2] += joy->axes[3] * increment;  // Joint 3 control
  joy_joint_values[3] += joy->axes[4] * increment;  // Joint 4 control
  joy_joint_values[4] += joy->axes[6] * increment * 5.0;  // Joint 5 control
  joy_joint_values[5] += joy->axes[7] * increment * 5.0;  // Joint 6 control
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

  // Initialize joint trajectory publisher
  ros::Publisher joint_trajectory_pub = node_handle.advertise<trajectory_msgs::JointTrajectory>("/mycobot_trajectory_controller/command", 10);

  // Joint names
  std::vector<std::string> joint_names = {"joint1", "joint2", "joint3", "joint4", "joint5", "joint6"};

  // Main loop
  while (ros::ok())
  {
    // Create joint trajectory message
    trajectory_msgs::JointTrajectory joint_trajectory;
    joint_trajectory.joint_names = joint_names;

    // Create a joint trajectory point
    trajectory_msgs::JointTrajectoryPoint point;
    point.positions = joy_joint_values;
    point.time_from_start = ros::Duration(0.1);  // Adjust the duration as needed

    // Add the point to the joint trajectory
    joint_trajectory.points.push_back(point);

    // Publish the joint trajectory
    joint_trajectory_pub.publish(joint_trajectory);

    ros::spinOnce();
  }

  // Stop the spinner and shutdown ROS
  spinner.stop();
  ros::shutdown();

  return 0;
}
