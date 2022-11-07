(define (problem baxter-burger-bot-problem)
  (:domain baxter-burger-bot)
  (:objects 
    arm - arm
    t1 t2 t3 t4 - table
    grill - grill
    tomato - vegetable
    burger - burger
    lbun ubun - bun
    )
    
  (:init
    (arm_is_free arm)
    (on t1 burger)
    (on t2 tomato)
    (on t3 l_bun)
    (on t4 u_bun)
    (is_clear grill)
    (is_clear tomato)
    (is_clear burger)
    (is_clear l_bun)
    (is_clear u_bun)
    )
    
