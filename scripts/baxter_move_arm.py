#!/usr/bin/env python 

import baxter_interface
import rospy
from baxter_interface import CHECK_VERSION


def pick(pos):
    os.system(f"python joint_trajectory_file_playback.py -l 1 -f pick_{pos}.csv")

def put(pos):
    os.system(f"python joint_trajectory_file_playback.py -l 1 -f put_{pos}.csv")

def flip(grill):
    os.system(f"python joint_trajectory_file_playback.py -l 1 -f flip_{grill}.csv")

def put_cheese(grill):
    os.system(f"python joint_trajectory_file_playback.py -l 1 -f put_cheese_{grill}.csv")


def main():
    rospy.init_node("baxter_move_arm")
    

if __name__ == '__main__':
    main()

