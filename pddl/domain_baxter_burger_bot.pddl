(define (domain baxter-burger-bot)
  (:requirements :typing :adl)
  (:types grill table food - position 
          burger vegetable bun cheese - food 
          arm - object)
  
  (:predicates
  (arm_is_free ?a - arm)
  (on ?p - position ?f - food)
  (is_clear ?p - position)
  (arm_holds_food ?a - arm ?f - food)
  (is_flipped ?b - burger)
  )
  
  (:action pick
    :parameters (?a - arm ?f - food ?p - position)
    :precondition (and
           (arm_is_free ?a)
           (is_clear ?f)
		   (on ?p ?f)
		   )
    :effect (and 
        (not (arm_is_free ?a))
        (not (on ?p ?f))
        (arm_holds_food ?a ?f)
        )
    )
  
  (:action put
    :parameters (?a - arm ?f - food ?p - position)
    :precondition (and
          (arm_holds_food ?a ?f)
          (is_clear ?p)
          (not (arm_is_free ?a))
          )
    :effect (and 
        (not (arm_holds_food ?a ?f))
        (not (is_clear ?p))
        (arm_is_free ?a)
        (on ?p ?f)
        )
    )
    
  (:action flip
    :parameters (?a - arm ?b - burger ?g - grill)
    :precondition 
    (and 
    (arm_is_free ?a)
    (on ?g ?b)
    (not (is_flipped ?b))
    )
    :effect 
    (and
    (is_flipped ?b)
    )
    )
)
