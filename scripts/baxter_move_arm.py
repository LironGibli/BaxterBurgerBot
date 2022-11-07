#!/usr/bin/env python 

import baxter_interface
import rospy
from baxter_interface import CHECK_VERSION


def pick(food, pos):
    os.system(f"rosrun baxter_examples joint_position_file_playback.py -l 1 -f pick_{food}_{pos}")

def put(food, pos):
    os.system(f"rosrun baxter_examples joint_position_file_playback.py -l 1 -f put_{food}_{pos}")

def flip(grill):
    os.system(f"rosrun baxter_examples joint_position_file_playback.py -l 1 -f flip_{grill}")

#def put_cheese(grill):
#    os.system(f"python joint_position_file_playback.py -l 1 -f put_cheese_{grill}.csv")


def main():
    rospy.init_node("baxter_move_arm")
    

if __name__ == '__main__':
    main()

