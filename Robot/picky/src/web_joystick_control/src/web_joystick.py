#!/usr/bin/python3
import rospy
from web_joystick_control.msg import JoystickData  # Import the custom message
import websocket
import json

def on_message(ws, message):
    joystick_data = json.loads(message.decode())
    try:
        # Extract the data from the received message
        frameid_msg = joystick_data["id"]
        timestamp_msg = rospy.Time.from_sec(joystick_data["timestamp"])
        axes_msg = joystick_data["axes"]
        buttons_msg = [1 if button["value"] else 0 for button in joystick_data["buttons"]]
        joystick_data_msg = JoystickData(stamp=timestamp_msg, frame_id=frameid_msg, axes=axes_msg, buttons=buttons_msg)

        # Publish the message on the /joystick_data topic
        joystick_data_pub.publish(joystick_data_msg)

    except Exception as e:
        rospy.logerr("Error processing joystick data: %s", str(e))

def on_open(ws):
    rospy.loginfo('WebSocket connected')

if __name__ == '__main__':
    rospy.init_node('web_joystick_node')
    rospy.loginfo('WebSocket client node initialized')

    # Initialize the publisher for /joystick_data topic
    joystick_data_pub = rospy.Publisher('/joystick_data', JoystickData, queue_size=10)

    # # Set up the subscriber for /joystick_data topic
    # rospy.Subscriber('/joystick_data', JoystickData, joystick_data_callback)

    # Set up the WebSocket connection
    ws = websocket.WebSocketApp('ws://54.218.1.229:9000/',
                                on_message=on_message,
                                on_open=on_open)

    # Start the WebSocket communication
    ws.run_forever()

    # Spin until Ctrl+C is pressed
    rospy.spin()
