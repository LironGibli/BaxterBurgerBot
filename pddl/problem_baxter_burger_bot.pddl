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
    (on t3 lbun)
    (on t4 ubun)
    (is_clear grill)
    (is_clear tomato)
    (is_clear burger)
    (is_clear lbun)
    (is_clear ubun)
    )
    
  (:goal
    (and 
    (on t3 lbun)
    (on lbun burger)
    (is_flipped burger)
    (on burger tomato)
    (on tomato ubun)
    )
    )
)
