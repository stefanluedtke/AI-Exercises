(define (domain abc)
  (:constants door printer paper-stack coffee-machine water-tap coffee-jar outside - location
	      water paper ground-coffee coffee - item)
  (:predicates 
       (at ?l ?a)
       (has ?i ?l)
       (hands-free ?a)
       (holds ?i ?a)
       (resource-of ?i ?l)
       (provides ?i ?l)
       (printed ?j)
  )

  (:action print
	   :parameters (?j - job ?a - agent)
	   :precondition (and (not (printed ?j))
			      (has paper printer)
			      (at printer ?a))
	   :effect (printed ?j))


  (:action get-coffee
	   :parameters (?a - agent)
	   :precondition (and (at coffee-machine ?a)
			      (has water coffee-machine)
			      (has ground-coffee coffee-machine)
			      (hands-free ?a))
	   :effect (and (holds coffee ?a)
			(not (hands-free ?a))))

  (:action fetch
	   :parameters (?a - agent ?i - item ?l - location)
	   :precondition (and (hands-free ?a)
			      (provides ?i ?l)
			      (at ?l ?a))
	   :effect (and (not (hands-free ?a))
			(holds ?i ?a)))

  (:action replenish
	   :parameters (?a - agent ?i - item ?l - location)
	   :precondition (and (holds ?i ?a)
			      (at ?l ?a)
			      (resource-of ?i ?l)
			      (not (has ?i ?l)))
	   :effect (and (has ?i ?l)
			(not (holds ?i ?a))
			(hands-free ?a)))
 
  (:action goto
	   :parameters (?a - agent ?x ?y - location)
	   :precondition (and (not (= ?x ?y))
			      (at ?x ?a))
	   :effect (and (not (at ?x ?a))
			(at ?y ?a)))


)


	   

