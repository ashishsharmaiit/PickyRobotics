import rospy
from std_msgs.msg import String
import websocket

def on_message(ws, message):
    print('Received message:', message)

def on_open(ws):
    print('WebSocket connected')

rospy.init_node('websocket_client')
rospy.loginfo('WebSocket client node initialized')

rospy.sleep(1)

ws = websocket.WebSocketApp('ws://54.218.1.229:9000/',
                            on_message=on_message,
                            on_open=on_open)

ws.run_forever()
