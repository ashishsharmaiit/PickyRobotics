import pyrealsense2 as rs
import numpy as np

# Create a pipeline
pipeline = rs.pipeline()

# Configure the pipeline to stream depth data
config = rs.config()
config.enable_stream(rs.stream.depth)

# Start the pipeline
pipeline.start(config)

# Define the pixel coordinates you want to convert to 3D
pixel_x = 320  # Example X pixel coordinate
pixel_y = 240  # Example Y pixel coordinate

try:
    while True:
        # Wait for a frame
        frames = pipeline.wait_for_frames()

        # Get the depth frame
        depth_frame = frames.get_depth_frame()

        if not depth_frame:
            continue

        # Get the depth value at the specified pixel coordinates
        depth = depth_frame.get_distance(pixel_x, pixel_y)

        # Convert pixel coordinates to 3D world coordinates
        intrinsics = depth_frame.profile.as_video_stream_profile().intrinsics
        x, y, z = rs.rs2_deproject_pixel_to_point(intrinsics, [pixel_x, pixel_y], depth)

        # Print the XYZ coordinates
        print(f"Pixel ({pixel_x}, {pixel_y}) is at 3D coordinates: ({x}, {y}, {z})")

except KeyboardInterrupt:
    pass
finally:
    pipeline.stop()

