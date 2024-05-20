;; 1. Define a rule to start from initial state and make the monkey stand


(defrule rule-1
	?state <- (state (monkeyIsOn floor) 
			 (monkeyDoes sitting)
			 (step 1))
=>
	(printout t "1. If isOn(Monkey, Floor) & isDoing(Monkey, Sitting)" crlf
		    "   Then isDoing(Monkey, Sitting) -> isDoing(Monkey, Standing)" crlf crlf)
	
	(modify ?state (monkeyDoes standing) (step 2)))



;; 2. Define a rule to make the monkey face the chair


(defrule rule-2
	?state <- (state (monkeyFaces south) 
			 (chairIsAt right monkey)
			 (step 2))
=>
	(printout t "2. If isFacing(Monkey, South) & isAt(Chair, Right, Monkey)" crlf
		    "   Then isFacing(Monkey, South) -> isFacing(Monkey, East)" crlf crlf)
	
	(modify ?state (monkeyFaces east) (chairIsAt front monkey) (step 3)))



;; 5. Define a rule to make the monkey lift the chair


(defrule rule-5
	?state <- (state (monkeyGrabs chair) 
			 (deskIsOn floor)
			 (step 5))
=>
	(printout t "5. If isGrabing(Monkey, Chair) & isOn(Desk, Floor)" crlf
		    "	Then isDoing(Monkey, Standing) -> isDoing(Monkey, Lifting)" crlf crlf)
	
	(modify ?state (monkeyDoes lifting) (step 6)))



;; 6. Define a rule to make the monkey place the chair on the desk


(defrule rule-6
	?state <- (state (monkeyDoes lifting) 
			 (deskIsOn floor)
			 (step 6))
=>
	(printout t "6. If isDoing(Monkey, Lifting) & isOn(Desk, Floor)" crlf
		    "	Then isOn(Chair, Floor) -> isOn(Chair, Desk)" crlf crlf)
	
	(modify ?state (chairIsOn desk) (step 7)))



;; 3. Define a rule to make the monkey walk to the chair


(defrule rule-3
	?state <- (state (monkeyFaces east) 
			 (chairIsOn floor)
			 (step 3))
=>
	(printout t "3. If isFacing(Monkey, East) & isOn(Chair, Floor)" crlf
		    "   Then isMoving(Monkey, Nowhere) -> isMoving(Monkey, Forward)" crlf crlf)
	
	(modify ?state (monkeyMoves forward) (step 4)))


;; 4. Define a rule to make the monkey grab the chair


(defrule rule-4
	?state <- (state (monkeyMoves forward) 
			 (chairIsOn floor)
			 (step 4))
=>
	(printout t "4. If isMoving(Monkey, Forward) & isOn(Chair, Floor)" crlf
		    "   Then isGrabing(Monkey, Nothing) -> isGrabing(Monkey, Chair)" crlf crlf)
	
	(modify ?state (monkeyMoves nil) (monkeyGrabs chair) (step 5)))



;; 7. Define a rule to make the monkey climb the desk


(defrule rule-7
	?state <- (state (chairIsOn desk) 
			 (deskIsOn floor)
			 (step 7))
=>
	(printout t "7. If isOn(Chair, Desk) & isOn(Desk, Floor)" crlf
		    "	Then isDoing(Monkey, Lifting) -> isDoing(Monkey, Climbing)" crlf crlf)
	
	(modify ?state (monkeyDoes climbing) (step 8)))



;; 13. Define a rule to make the monkey eat the banana


(defrule rule-13
	?state <- (state (isPeeled banana) 
			 (step 13))
=>
	(printout t "13. If isPeeled(Banana)" crlf
		    "	 Then Eat(Monkey, Banana)" crlf crlf)
	
	(modify ?state (monkeyEats banana) (step 14)))



;; 14. Define a rule to make the monkey happy and not hungry


(defrule rule-14
	?state <- (state (monkeyEats banana) 
			 (step 14))
=>
	(printout t "14. If Eat(Monkey, Banana)" crlf
		    "	 Then Hungry(Monkey) -> Happy(Monkey)" crlf crlf)
	
	(modify ?state (hungry nil) (happy monkey) (step 15)))



;; 8. Define a rule to make the monkey get on the desk


(defrule rule-8
	?state <- (state (monkeyDoes climbing) 
			 (chairIsOn desk)
			 (step 8))
=>
	(printout t "8. If isDoing(Monkey, Climbing) & isOn(Chair, Desk)" crlf
		    "	Then isOn(Monkey, Floor) -> isOn(Monkey, Desk)" crlf crlf)
	
	(modify ?state (monkeyIsOn desk) (step 9)))



;; 9. Define a rule to make the monkey climb on the chair


(defrule rule-9
	?state <- (state (monkeyDoes climbing) 
			 (chairIsOn desk)
			 (step 9))
=>
	(printout t "9. If isDoing(Monkey, Climbing) & isOn(Chair, Desk)" crlf
		    "	Then isOn(Monkey, Desk) -> isOn(Monkey, Chair)" crlf crlf)
	
	(modify ?state (monkeyIsOn chair) (step 10)))



;; 10. Define a rule to make the monkey reach for the banana


(defrule rule-10
	?state <- (state (monkeyIsOn chair) 
			 (bananaIsOn ceiling)
			 (step 10))
=>
	(printout t "10. If isOn(Monkey, Chair) & isOn(Banana, Ceiling)" crlf
		    "	 Then isDoing(Monkey, Climbing) -> isDoing(Monkey, Reaching)" crlf crlf)
	
	(modify ?state (monkeyDoes reaching) (step 11)))



;; 11. Define a rule to make the monkey grab the banana


(defrule rule-11
	?state <- (state (monkeyDoes reaching) 
			 (bananaIsOn ceiling)
			 (step 11))
=>
	(printout t "11. If isDoing(Monkey, Reaching) & isOn(Banana, Ceiling)" crlf
		    "	 Then isDoing(Monkey, Reaching) -> isGrabing(Monkey, Banana)" crlf crlf)
	
	(modify ?state (monkeyDoes nil) (monkeyGrabs banana) (step 12)))



;; 12. Define a rule to make the monkey peel the banana


(defrule rule-12
	?state <- (state (monkeyGrabs banana) 
			 (bananaIsOn ceiling)
			 (step 12))
=>
	(printout t "12. If isGrabing(Monkey, Banana) & isOn(Banana, Ceiling)" crlf
		    "	 Then isOn(Banana, Ceiling) -> isPeeled(Banana)" crlf crlf)
	
	(modify ?state (bananaIsOn nil) (isPeeled banana) (step 13)))


