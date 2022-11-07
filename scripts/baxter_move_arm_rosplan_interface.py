#!/usr/bin/env python

import rospy
from std_msgs.msg import Empty
import rosplan_dispatch_msgs.msg  
import rosplan_knowledge_msgs.srv
from diagnostic_msgs.msg import KeyValue
import baxter_move_arm


rospy.init_node("baxter_rosplan_interface")

action_feedback_pub = rospy.Publisher('/kcl_rosplan/action_feedback', rosplan_dispatch_msgs.msg.ActionFeedback, queue_size=10)

rospy.wait_for_service('/kcl_rosplan/update_knowledge_base')
update_kb = rospy.ServiceProxy('/kcl_rosplan/update_knowledge_base', rosplan_knowledge_msgs.srv.KnowledgeUpdateService)


def callback(msg):
    fb = rosplan_dispatch_msgs.msg.ActionFeedback()
    fb.action_id = msg.action_id
    fb.status = "action enabled"
    action_feedback_pub.publish(fb)

    if msg.name == "pick":        
        for p in msg.parameters:
            if p.key == "p":
                pos = p.value
	    if p.key == "f":
	    	food = p.value
        baxter_move_arm.pick(food, pos)

 
    if msg.name == "put":
        for p in msg.parameters:
            if p.key == "p":
                pos = p.value
	    if p.key == "f":
	    	food = p.value
        baxter_move_arm.put(food, pos)


    if msg.name == "flip":
        for p in msg.parameters:
            if p.key == "g":
                grill = p.value
        baxter_move_arm.flip(grill)
    
    
#    if msg.name == "put_cheese":
#        for p in msg.parameters:
#            if p.key == "g":
#                grill = p.value
#        baxter_move_arm.put_cheese(grill)
    

    fb = rosplan_dispatch_msgs.msg.ActionFeedback()
    fb.action_id = msg.action_id
    fb.status = "action achieved"
    action_feedback_pub.publish(fb)


rospy.Subscriber("/kcl_rosplan/action_dispatch", rosplan_dispatch_msgs.msg.ActionDispatch, callback)
rospy.spin()
