(deftemplate state
  	(slot hungry (default nil))
  	(slot happy (default nil))

  	(multislot monkeyIsOn (default nil))
  	(slot deskIsOn (default nil))
        (slot bananaIsOn (default nil))
	(slot chairIsOn (default nil))

  	(slot monkeyEats (default nil))

	;; six mine
	(multislot monkeyDoes (default nil)) 	;; climbing, sitting, standing, lifting, reaches
	(slot monkeyMoves (default nil)) 	;; left, right, forward, backward
	(slot monkeyFaces (default nil)) 	;; north, east, south, west
	(slot monkeyGrabs (default nil)) 	;; banana, chair

	(multislot chairIsAt (default nil)) 	;; (right, monkey)
	(slot isPeeled (default nil)) 		;; banana
	
	(slot step (default 0))
)



;; (list-deftemplates)