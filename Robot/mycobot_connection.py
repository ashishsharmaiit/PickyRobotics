# for mycobot
from pymycobot import MyCobot

# for mypalletizer
# from pymycobot import MyPalletizer

# for MechArm
# from pymycobot import MechArm

mc = MyCobot("/dev/ttyTHS1",1000000)
# mc = MyPalletizer("com10",115200)
# mc = MechArm("com10",115200)

print(mc.get_angles())
