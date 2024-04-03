#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit/robot_model/robot_model.h>
#include <moveit/robot_state/robot_state.h>
#include <moveit_visual_tools/moveit_visual_tools.h>
#include <moveit_msgs/MoveItErrorCodes.h>

int main(int argc, char** argv)
{
  // Initialize ROS
  ros::init(argc, argv, "arm_control");
  ros::NodeHandle node_handle;
  ros::AsyncSpinner spinner(1);
  spinner.start();

  // Initialize MoveIt
  static const std::string PLANNING_GROUP = "arm";  // Replace with your planning group name
  moveit::planning_interface::MoveGroupInterface move_group(PLANNING_GROUP);

  // Set the planner
  move_group.setPlannerId("RRTConnect");
  move_group.setPlanningTime(1);
  move_group.setNumPlanningAttempts(10);
  move_group.setNumPlanningAttempts(10);
  move_group.setMaxVelocityScalingFactor(1.0);	
  move_group.setMaxAccelerationScalingFactor(1.0);

  // Set the goal position and orientation
  geometry_msgs::Pose target_pose;
  target_pose.orientation.x = -0.64077;
  target_pose.orientation.y = -0.098808;
  target_pose.orientation.z = +0.75933;
  target_pose.orientation.w = 0.055434;
  target_pose.position.x = -0.2101;
  target_pose.position.y = 0.049254;
  target_pose.position.z = 0.14216;
  move_group.setPoseTarget(target_pose);

  // Plan and execute the motion
  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success = (move_group.plan(my_plan) == true);
  if (success)
  {
    move_group.execute(my_plan);
    ROS_INFO("Motion execution complete");
  }
  else
  {
    ROS_ERROR("Failed to plan motion");
  }

  // Stop the spinner and shutdown ROS
  spinner.stop();
  ros::shutdown();

  return 0;
}
