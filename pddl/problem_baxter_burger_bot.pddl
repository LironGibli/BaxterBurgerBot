(define (problem baxter-burger-bot-problem)
  (:domain baxter-burger-bot)
  (:objects 
    arm1 - arm
    t1 t2 t3 t4 t5 - table
    grill1 grill2 - grill
    tomato1 tomato2 - vegetable
    burger1 burger2 - burger
    l_bun1 u_bun1 l_bun2 u_bun2 - bun
    cheese1 - cheese
    )
    
  (:init
    (arm_is_free arm1)
    (on t1 tomato1)
    (on t2 burger1)
    (on t3 l_bun1)
    (on t4 u_bun1)
    (on t1 tomato2)
    (on t2 burger2)
    (on t3 l_bun2)
    (on t4 u_bun2)
    (on t5 cheese1)
    (is_clear cheese1)
    (is_clear grill1)
    (is_clear tomato1)
    (is_clear burger1)
    (is_clear l_bun1)
    (is_clear u_bun1)
    (is_clear grill2)
    (is_clear tomato2)
    (is_clear burger2)
    (is_clear l_bun2)
    (is_clear u_bun2)
    )
    
  (:goal
    (and 
    (on t3 l_bun1)
    (on l_bun1 burger1)
    (is_flipped burger1)
    (on burger1 cheese1)
    (on burger1 tomato1)
    (on tomato1 u_bun1)
    (on t3 l_bun2)
    (on l_bun2 burger2)
    (is_flipped burger2)
    (on burger2 tomato2)
    (on tomato2 u_bun2)
    )
    )
)