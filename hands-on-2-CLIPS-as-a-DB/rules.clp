
;; Define a rule to choose an option (search for illness, signs, symptoms or delete)


(defrule start-program

	?start <- (start-program)
=>
	(printout t crlf 
		    "------------------------------------------------" 
		    crlf
	            "    ******** SEARCH FOR AN ILLNESS **********" 
		    crlf 
		    crlf
		    "  Choose an option and find the results." 
		    crlf
		    "------------------------------------------------" 
		    crlf 
		    crlf)
	
	(printout t "What do you want to do?"
		     crlf
		    "A. Search for an illness's symptoms" crlf
		    "B. Search for an illness's signs" crlf
		    "C. Search for an illness's details" crlf
		    "D. Delete an illness" crlf
		     crlf
		    "Answer (A/B/C/D): ")

	(bind ?answer (read))             
				          
	(bind ?answer (upcase ?answer))	 
			
	(assert (option ?answer))         

	(retract ?start)                  
) 



;; Define a rule to initiate the option path and assert its corresponding rule


(defrule choose-option

	?option <- (option ?letter)
=>
	(if (eq ?letter A)
	    then 
		(assert (detail-symptoms))
            else
	        (if (eq ?letter B)
		    then
			(assert (detail-signs))
		    else
			(if (eq ?letter C)
			    then
				(assert (detail-illness))
		    	    else
				(if (eq ?letter D)
			           then
				      (assert (delete-illness))
		    	           else
			              (printout t crlf "Non valid option" crlf)
				)
			       
			)
	        )
	)

	(retract ?option)                  
) 



;; Define a rule to return an illness's symptoms given its name


(defrule find-symptoms
	
	?query <- (detail-symptoms)
=>
	(printout t crlf 
		    "What illness are you searching for? " crlf
		    "Answer: ")
	
	(bind ?illness (read))             
				            
	(bind ?illness (upcase ?illness))
	
	(if (eq ?illness INFLUENZA)
	    then 
		(assert (print-vals Influenza cough aches))
            else
	        (if (eq ?illness PNEUMONIA)
		    then
			(assert (print-vals Pneumonia fever cough))
		    else
			(if (eq ?illness DIABETES)
			    then
				(assert (print-vals Diabetes fatigue dizziness))
		    	    else
			        (if (eq ?illness ASTHMA)
				    then
				        (assert (print-vals Asthma tightness cough))
		    		     else
			    	    	(if (eq ?illness MIGRAINE)
					    then
				        	(assert (print-vals Migraine headache nausea))
		    		     	    else
			    	    		(if (eq ?illness HYPERTENSION)
					  	    then
				        		(assert (print-vals Hypertension fatigue "blurred vision"))
		    		     	   	    else
							(assert (print-vals Unknown nil nil))
			    	    		)
				
			    	    	)
			        )
				
			)
	        )
	)

	(retract ?query)
)



;; Define a rule to return an illness's signs given its name


(defrule find-signs
	
	?query <- (detail-signs)
=>
	(printout t crlf 
		    "What illness are you searching for? " crlf
		    "Answer: ")
	
	(bind ?illness (read))             
				            
	(bind ?illness (upcase ?illness))
	
	(if (eq ?illness INFLUENZA)
	    then 
		(assert (print-vals Influenza fever fatigue))
            else
	        (if (eq ?illness PNEUMONIA)
		    then
			(assert (print-vals Pneumonia breathing pain))
		    else
			(if (eq ?illness DIABETES)
			    then
				(assert (print-vals Diabetes thirst "weight loss"))
		    	    else
			        (if (eq ?illness ASTHMA)
				    then
				        (assert (print-vals Asthma wheezing breathless))
		    		     else
			    	    	(if (eq ?illness MIGRAINE)
					    then
				        	(assert (print-vals Migraine "short sight" pain))
		    		     	    else
			    	    		(if (eq ?illness HYPERTENSION)
					  	    then
				        		(assert (print-vals Hypertension headache dizziness))
		    		     	   	    else
							(assert (print-vals Unknown nil nil))
			    	    		)
				
			    	    	)
			        )
				
			)
	        )
	)

	(retract ?query)
)



;; Define a rule to print (formatted) an illness and its symptoms/signs


(defrule print-values 

	?query <- (print-vals ?name ?val1 ?val2)
=>
	(if (neq ?name Unknown)
	    then
		(printout t crlf
			    "------------------------------------------------" 
			    crlf
			    " " ?name 
			    " presents: " ?val1 
		    	    " and " ?val2 "." 
			    crlf
			    "------------------------------------------------" 
			    crlf crlf)
	    else
		(printout t crlf 
			    "------------------------------------------------" 
			    crlf
			    " Illness not found."
			    crlf
			    "------------------------------------------------" 
			    crlf crlf)
		
	)
	
	(retract ?query)
)



;; Define a rule to return an illness's full information given its name


(defrule find-illness
	
	?query <- (detail-illness)
=>
	(printout t crlf 
		    "What illness are you searching for? " crlf
		    "Answer: ")
	
	(bind ?illness (read))             
				            
	(bind ?illness (upcase ?illness))
	
	(if (eq ?illness INFLUENZA)
	    then 
		(assert (print-illness Influenza fever fatigue cough aches))
            else
	        (if (eq ?illness PNEUMONIA)
		    then
			(assert (print-illness Pneumonia breathing pain fever cough))
		    else
			(if (eq ?illness DIABETES)
			    then
				(assert (print-illness Diabetes thirst "weight loss" fatigue dizziness))
		    	    else
			        (if (eq ?illness ASTHMA)
				    then
				        (assert (print-illness Asthma wheezing breathless tightness cough))
		    		     else
			    	    	(if (eq ?illness MIGRAINE)
					    then
				        	(assert (print-illness Migraine "short sight" pain headache nausea))
		    		     	    else
			    	    		(if (eq ?illness HYPERTENSION)
					  	    then
				        		(assert (print-illness Hypertension headache dizziness fatigue "blurred vision"))
		    		     	   	    else
							(assert (print-illness Unknown nil nil nil nil))
			    	    		)
				
			    	    	)
			        )
				
			)
	        )
	)

	(retract ?query)
)



;; Define a rule to print (formatted) an illness's full information


(defrule print-illness 

	?query <- (print-illness ?name ?sign1 ?sign2 ?symp1 ?symp2)
=>
	(if (neq ?name Unknown)
	    then
		(printout t crlf
			    "------------------------------------------------" 
			    crlf
			    " " ?name crlf
			    " Signs: " ?sign1 
		    	    " and " ?sign2 "." 
			    crlf
			    " Symptoms: " ?symp1 
		    	    " and " ?symp2 "." 
			    crlf
			    "------------------------------------------------" 
			    crlf crlf)
	    else
		(printout t crlf 
			    "------------------------------------------------" 
			    crlf
			    " Illness not found."
			    crlf
			    "------------------------------------------------" 
			    crlf crlf)
		
	)
	
	(retract ?query)
)



;; Define a rule to delete a sickness


(defrule delete-sickness 

	?factId <- (delete-illness)
=>
	(printout t crlf 
		    "What is the illness id? " crlf
		    "Answer (1-6): ")
	
	(bind ?illnessId (read))             
				           
	(retract ?illnessId)

	(retract ?factId)

	(printout t crlf 
		    "------------------------------------------------" 
	            crlf
		    " Deleted illness with id: "
		    ?illnessId
	            crlf
	            "------------------------------------------------" 
	            crlf crlf)
)

