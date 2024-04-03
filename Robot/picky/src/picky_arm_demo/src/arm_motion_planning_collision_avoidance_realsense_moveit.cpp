#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <std_srvs/Empty.h>
// #include <ocotmap_msgs/Octomap.h>

int main(int argc, char **argv)
{
    ros::init(argc, argv, "arm_motion_planning_moveit");
    ros::NodeHandle nh;
    ros::AsyncSpinner spinner(1);
    spinner.start();

    // Set up MoveIt! interfaces
    moveit::planning_interface::MoveGroupInterface arm_group("arm_group");
    moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
    
    // Clear octomap
    ros::service::waitForService("/clear_octomap");
    ros::ServiceClient clearOctomapClient = nh.serviceClient<std_srvs::Empty>("/clear_octomap");
    std_srvs::Empty srv;
    if (clearOctomapClient.call(srv)){
    	ROS_INFO("Octomap cleared successfully.");
    	ros::Duration(3.0).sleep();
    	ROS_INFO("Wait for 3 sec to update Octomap ...");
    	    
    	// Specify the reference frame
    	arm_group.setPlanningTime(10.0);  // Time to plan

    	// Set a target pose     
    	geometry_msgs::Pose target_pose;
    	target_pose.orientation.x = 0.0;
    	target_pose.orientation.y = 0.0;
    	target_pose.orientation.z = 0.0;
    	target_pose.orientation.w = 1.0;
    	target_pose.position.x = 0.0; // 0.16
    	target_pose.position.y = 0.250; // 0.16
    	target_pose.position.z = 0.10; // 0.16
    	arm_group.setPoseTarget(target_pose);
    
    	// Set HOME pose 
    	/***
    	geometry_msgs::Pose target_pose;
    	target_pose.orientation.x = 0.00661217;
    	target_pose.orientation.y = 0.00692955;
    	target_pose.orientation.z = -0.706745;
    	target_pose.orientation.w = 0.707448;
    	target_pose.position.x = 0.0453;
    	target_pose.position.y = -0.0633;
    	target_pose.position.z = 0.3123;
    	arm_group.setPoseTarget(target_pose);
    	***/


    	// Plan
    	moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    	bool success = arm_group.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS;

    	if (success)
    	{
        	ROS_INFO("Planning succeeded. You can now execute the trajectory or further modify it.");
    	}
    	else
    	{
        	ROS_WARN("Planning failed. Check if the target pose is reachable and that there are no collisions.");
    	}

    	// Note: Executing the trajectory requires you to uncomment below
    	arm_group.execute(my_plan);
    }
    else{
    	ROS_ERROR("Failed to call clear_octomap service");
    	return 1;
    }

    ros::waitForShutdown();
    return 0;
}

