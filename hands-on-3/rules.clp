
;; Define a rule to start decision tree by choosing first sign of illness


(defrule start-diagnosis

	?start <- (start-diagnosis)
=>
	(printout t crlf 
		    "------------------------------------------------" 
		    crlf
	            "    ******** DIAGNOSE AN ILLNESS **********" 
		    crlf 
		    crlf
		    "  Answer the questions and recieve a diagnosis." 
		    crlf
		    "------------------------------------------------" 
		    crlf 
		    crlf)
	
	(printout t "What's the first sign of your illness?"
		     crlf
		    "A. Fever" crlf
		    "B. Headache" crlf
		    "C. Heavy-breathing" crlf
		    "D. Thirst" crlf
		    "E. Wheezing" crlf
		    "F. Short-sight" crlf
		     crlf
		    "Answer (A/B/C/D/E/F): ")

	(bind ?answer (read))             ; read input and bind it to ?answer
				          ; bind only works on RHS
	(bind ?answer (upcase ?answer))	  ; turn ?answer to uppercase
			
	(assert (sign-1 ?answer))         ; create fact for sign 1 based on read input

	(retract ?start)                  ; delete the starter fact
) 



;; Define a rule to decide when the first sign is fever


(defrule sign1-fever
	
	?sign1 <- (sign-1 A) ; save fact adress of fact to delete it later
=>
	(printout t crlf 
		    "Are you experiencing coughing? " crlf
		    "Answer (Y/N): ")

	(bind ?answer1 (read))  			
	(bind ?answer1 (upcase ?answer1))      

	(if (eq ?answer1 Y) ; check if ?answer1 == Y
	    then
                (assert (diagnose Pneumonia)) 
	    else
		(assert (sign1-symp2 fever cough-no))
	)
	
	(retract ?sign1) 
)



;; Define a rule to decide when the first sign is fever but symptom 2 isn't cough


(defrule sign1-symp2-fever

	" Sign 1 is fever but symptom 2 isn't cough " 

	?sign2 <- (sign1-symp2 fever cough-no)
=>
	(printout t crlf 
		    "Are you experiencing aches? " crlf
		    "Answer (Y/N): ")

	(bind ?answer2 (read))
	(bind ?answer2 (upcase ?answer2))
		
	(if (eq ?answer2 Y)
	    then 
		(assert (diagnose Influenza))
            else
	        (assert (diagnose Unknown))
	)

	(retract ?sign2)
)



;; Define a rule to decide when the first sign is headache


(defrule sign1-headache
	
	?sign1 <- (sign-1 B) 
=>
	(printout t crlf 
		    "Are you experiencing general pain? " crlf
		    "Answer (Y/N): ")

	(bind ?answer1 (read))  			
	(bind ?answer1 (upcase ?answer1))      

	(if (eq ?answer1 Y) ; check if ?answer1 == Y
	    then
                (assert (diagnose Migraine)) 
	    else
		(assert (sign1-sign2 headache pain-no))
	)
	
	(retract ?sign1) 
)



;; Define a rule to decide when the first sign is headache but sign 2 isn't pain 


(defrule sign1-sign2-headache

	?sign2 <- (sign1-sign2 headache pain-no)
=>
	(printout t crlf 
		    "Are you experiencing dizziness? " crlf
		    "Answer (Y/N): ")

	(bind ?answer2 (read))
	(bind ?answer2 (upcase ?answer2))
		
	(if (eq ?answer2 Y)
	    then 
		(assert (diagnose Hypertension))
            else
	        (assert (diagnose Unknown))
	)

	(retract ?sign2)
)



;; Define a rule to decide when the first sign is hard-breathing


(defrule sign1-hard-breathing
	
	?sign1 <- (sign-1 C) 
=>
	(printout t crlf 
		    "Are you experiencing fever? " crlf
		    "Answer (Y/N): ")

	(bind ?answer1 (read))  			
	(bind ?answer1 (upcase ?answer1))      

	(if (eq ?answer1 Y) ; check if ?answer1 == Y
	    then
                (assert (diagnose Pneumonia)) 
	    else
		(assert (sign1-symp1 breathing fever-no))
	)
	
	(retract ?sign1) 
)



;; Define a rule to decide when the first sign is hard-breathing but symptom 2 isn't fever


(defrule sign1-symp1-breathing

	?sign2 <- (sign1-symp1 breathing fever-no)
=>
	(printout t crlf 
		    "Are you experiencing tightness? " crlf
		    "Answer (Y/N): ")

	(bind ?answer2 (read))
	(bind ?answer2 (upcase ?answer2))
		
	(if (eq ?answer2 Y)
	    then 
		(assert (diagnose Asthma))
            else
	        (assert (diagnose Unknown))
	)

	(retract ?sign2)
)



;; Define a rule to decide when the first sign is thirst, wheezing or short sight


(defrule sign1-thirst-wheezing-sight
	
	?sign1 <- (sign-1 ?sign&D|E|F) ; Connective constraint allows any group of values to match
=>
	(printout t crlf 
		    "Are you experiencing weight loss? " crlf
		    "Answer (Y/N): ")

	(bind ?answer1 (read))  			
	(bind ?answer1 (upcase ?answer1))      

	(if (eq ?answer1 Y) ; check if ?answer1 == Y
	    then
                (assert (diagnose Diabetes)) 
	    else
		(assert (sign1-sign2 thirst weight-no))
	)
	
	(retract ?sign1) 
)



;; Define a rule to decide when the first sign is thirst, wheezing or short sight but symptom 2 isn't weight loss


(defrule sign1-sign2-thirst1

	?sign2 <- (sign1-sign2 thirst weight-no)
=>
	(printout t crlf 
		    "Are you experiencing breathlessness? " crlf
		    "Answer (Y/N): ")

	(bind ?answer2 (read))
	(bind ?answer2 (upcase ?answer2))
		
	(if (eq ?answer2 Y)
	    then 
		(assert (diagnose Asthma))
            else
	        (assert (sign1-sign2 thirst breath-no))
	)

	(retract ?sign2)
)



;; Define a rule to decide when the first sign is thirst, wheezing or short sight but symptom 2 isn't breathlessness


(defrule sign1-sign2-thirst2

	?sign2 <- (sign1-sign2 thirst breath-no)
=>
	(printout t crlf 
		    "Are you experiencing pain? " crlf
		    "Answer (Y/N): ")

	(bind ?answer3 (read))
	(bind ?answer3 (upcase ?answer3))
		
	(if (eq ?answer3 Y)
	    then 
		(assert (diagnose Migraine))
            else
	        (assert (diagnose Unknown))
	)

	(retract ?sign2)
)



;; Define a rule to print (formatted) the final diagnosis given the decisions


(defrule final-diagnosis

	" Return the final diagnosis "

	?diagnosis <- (diagnose ?illness)
=>
	(bind ?illness (upcase ?illness))

	(if (neq ?illness UNKNOWN)
	   then
               (printout t crlf
			   "------------------------------------------------" 
			   crlf
			   " You have been diagnosticated with " 
			    ?illness
			    crlf
			    "------------------------------------------------" 
			    crlf crlf)
	  else 
		(printout t crlf crlf
			    "-------------------------------------------------------------------------------------" 
		    	    crlf
		    	    " Your symptoms don't match with the illnesses in our database." 
			    crlf crlf
			    " Discarded illnesses: PNEUMONIA, INFLUENZA, MIGRAINE, HYPERTENSON, ASTHMA, DIABETES."
			    crlf
			    "-------------------------------------------------------------------------------------" 
			    crlf crlf)
	
	)
	
	
	(retract ?diagnosis)
)


