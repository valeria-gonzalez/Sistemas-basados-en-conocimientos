;; 1. Define a rule to offer 24 months without interests for buying an iphone 15 with banamex card


(defrule 1-months-iphone-banamex 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (credit-card-id 1))
=>
    (if (member$ 1 ?smartphone-ids) 
         then
	     (printout t "!!! 1. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying an iPhone 15 with a Banamex card you have: 24 months without interests." 
			 crlf crlf)))



;; 2. Define a rule to offer 12 months without interest for buying a samsung with liverpool card


(defrule 2-months-samsung-liverpool 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (credit-card-id 2))
=>
    (if (member$ 2 ?smartphone-ids) 
         then
	     (printout t "!!! 2. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Samsung Note 12 with a Liverpool VISA card you have: 12 months without interests." 
			 crlf crlf)))



;; 3. Define a rule to offer 100 pesos in vouchers for each 1000 pesos spent when buying a mackbook and iphone cash


(defrule 3-voucher-macbook-iphone 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (computer-ids $?computer-ids) (credit-card-id -1))
=>
    (if (and (member$ 2 ?smartphone-ids) (member$ 1 ?computer-ids))
         then
	     (printout t "!!! 3. VOUCHER: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Macbook Air and an iPhone 15 cash you have: $100 voucher for every $1000 spent." 
			 crlf crlf)))



;; 4. Define a rule to offer phone case and screen protector with discount


(defrule 4-discount-case-protector 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids))
=>
    (if (not (member$ nil ?smartphone-ids))
         then
	     (printout t "!!! 4. DISCOUNT: ORDER #"
			 ?id " !!!" crlf
			 "For buying a smartphone you have: 15% off on a screen protector + phone case." 
			 crlf crlf)))



;; 5. Define a rule to offer 18 months interest-free on the purchase of a “Google Pixel 6” with a Liverpool visa card.


(defrule 5-months-pixel-wellsfargo 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (credit-card-id 2))
=>
    (if (member$ 3 ?smartphone-ids) 
         then
	     (printout t "!!! 5. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Google Pixel 6 with a Wells Fargo American Express card you have: 18 months without interests." 
			 crlf crlf)))



;; 6. Define a rule to offer 24 months interest-free on the purchase of a “Dell XPS 13” with a Citibank Discover card.


(defrule 6-months-dell-citibank 
    (order (order-id ?id) (computer-ids $?computer-ids) (credit-card-id 4))
=>
    (if (member$ 2 ?computer-ids) 
         then
	     (printout t "!!! 6. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Dell XPS 13 with a Citibank Discover card you have: 24 months without interests." 
			 crlf crlf)))



;; 7. Define a rule to offer 12 months interest-free on the purchase of a “OnePlus 9” with a Banamex Visa card.


(defrule 7-months-oneplus-capitalone 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (credit-card-id 1))
=>
    (if (member$ 4 ?smartphone-ids) 
         then
	     (printout t "!!! 7. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying a One Plus 9 with a Banamex Visa card you have: 12 months without interests." 
			 crlf crlf)))



;; 8. Define a rule to offer 150 pesos in vouchers for every 1000 pesos spent on the purchase of a “HP Spectre x360” and a “Xiaomi Mi 11”.


(defrule 8-vouchers-hp-xiaomi 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (computer-ids $?computer-ids))
=>
    (if (and (member$ 5 ?smartphone-ids) (member$ 3 ?computer-ids)) 
         then
	     (printout t "!!! 8. VOUCHER: ORDER #"
			 ?id " !!!" crlf
			 "For buying a HP Spectre x360 and a Xiaomi Mi 11 you have: 150 pesos in vouchers for every 1000 pesos spent." 
			 crlf crlf)))



;; 9. Define a rule to offer 36 months interest-free on the purchase of a “Lenovo ThinkPad X1 Carbon” with a Banamex Visa card.


(defrule 9-months-lenovo-banamex 
    (order (order-id ?id) (computer-ids $?computer-ids) (credit-card-id 1))
=>
    (if (member$ 4 ?computer-ids) 
         then
	     (printout t "!!! 9. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Lenovo ThinkPad X1 Carbon with a Banamex Visa card you have: 36 months without interests." 
			 crlf crlf)))



;; 10. Define a rule to offer 200 pesos in vouchers for every 1000 pesos spent on the purchase of an “Asus ROG Zephyrus G14” and a “Samsung Note 12”.


(defrule 10-vouchers-asus-samsung 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (computer-ids $?computer-ids))
=>
    (if (and (member$ 2 ?smartphone-ids) (member$ 5 ?computer-ids)) 
         then
	     (printout t "!!! 10. VOUCHER: ORDER #"
			 ?id " !!!" crlf
			 "For buying an Asus ROG Zephyrus G14 and a Samsung Note 12 you have: 200 pesos in vouchers for every 1000 pesos spent." 
			 crlf crlf)))



;; 11. Define a rule to offer a keyboard and mouse at a 20% discount if the customer buys a “MacBook Air”.


(defrule 11-discount-keyboard-mouse-macbook 
    (order (order-id ?id) (computer-ids $?computer-ids))
=>
    (if (member$ 1 ?computer-ids) 
         then
	     (printout t "!!! 11. DISCOUNT: ORDER #"
			 ?id " !!!" crlf
			 "For buying a MacBook Air you have: 20% discount on a keyboard and mouse." 
			 crlf crlf)))



;; 12. Define a rule to offer 12 months interest-free on the purchase of an “iPhone 15” and a “Google Pixel 6” with a Liverpool Visa card.


(defrule 12-months-iphone-pixel-liverpool 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (credit-card-id 2))
=>
    (if (and (member$ 1 ?smartphone-ids) (member$ 3 ?smartphone-ids)) 
         then
	     (printout t "!!! 12. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying an iPhone 15 and a Google Pixel 6 with a Liverpool Visa card you have: 12 months without interests." 
			 crlf crlf)))


;; 13. Define a rule to offer 50 pesos in vouchers for every 1000 pesos spent on the purchase of a “Samsung Note 12” and a “OnePlus 9” in cash.

(defrule 13-vouchers-samsung-oneplus 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids))
=>
    (if (and (member$ 2 ?smartphone-ids) (member$ 4 ?smartphone-ids)) 
         then
	     (printout t "!!! 13. VOUCHERS: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Samsung Note 12 and a OnePlus 9 you have: 50 pesos in vouchers for every 1000 pesos spent." 
			 crlf crlf)))


;; 14. Define a rule to offer a computer sleeve at a 10% discount if the customer buys a computer.


(defrule 14-discount-sleeve-computer 
    (order (order-id ?id) (computer-ids $?computer-ids))
=>
    (if (not (member$ nil ?computer-ids))
         then
	     (printout t "!!! 14. DISCOUNT: ORDER #"
			 ?id " !!!" crlf
			 "For buying a computer you have: 10% discount on a computer sleeve." 
			 crlf crlf)))



;; 15. Define a rule to offer 12 months interest-free on the purchase of a “Xiaomi Mi 11” with a Wells Fargo American Express card.


(defrule 15-months-xiaomi-wellsfargo 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (credit-card-id 3))
=>
    (if (member$ 5 ?smartphone-ids) 
         then
	     (printout t "!!! 15. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Xiaomi Mi 11 with a Wells Fargo American Express card you have: 12 months without interests." 
			 crlf crlf)))



;; 16. Define a rule to offer 300 pesos in vouchers for every 1000 pesos spent on the purchase of a “Dell XPS 13” and an “HP Spectre x360”.


(defrule 16-vouchers-dell-hp 
    (order (order-id ?id) (computer-ids $?computer-ids))
=>
    (if (and (member$ 2 ?computer-ids) (member$ 3 ?computer-ids)) 
         then
	     (printout t "!!! 16. VOUCHER: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Dell XPS 13 and an HP Spectre x360 you have: 300 pesos in vouchers for every 1000 pesos spent." 
			 crlf crlf)))


;; 17. Define a rule to offer a 5% discount on the next purchase if the customer buys more than 1 accessory.


(defrule 17-discount-next-accessory 
    (order (order-id ?id) (accessory-ids $?accessory-ids))
    =>
    (if (and (not (member$ nil ?accessory-ids))
	      (> (length$ ?accessory-ids) 1))
         then
	     (printout t "!!! 17. DISCOUNT: ORDER #"
			 ?id " !!!" crlf
			 "For buying more than 1 accessory you have: 5% discount on the next purchase."  
			 crlf crlf)))

    
;; 18. Define a rule to offer a 10% discount on the next purchase if the customer buys more than 2 computers.


(defrule 18-discount-next-computer 
    (order (order-id ?id) (computer-ids $?computer-ids))
    =>
    (if (and (not (member$ nil ?computer-ids))
	      (> (length$ ?computer-ids) 2))
         then
	     (printout t "!!! 18. DISCOUNT: ORDER #"
			 ?id " !!!" crlf
			 "For buying more than 2 computers you have: 10% discount on the next purchase."  
			 crlf crlf)))



;; 19. Define a rule to offer a 15% discount on the next purchase if the customer buys more than 2 smartphones.


(defrule 19-discount-next-smartphone 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids))
    =>
    (if (and (not (member$ nil ?smartphone-ids))
	      (> (length$ ?smartphone-ids) 2))
         then
	     (printout t "!!! 19. DISCOUNT: ORDER #"
			 ?id " !!!" crlf
			 "For buying more than 2 smartphone you have: 15% discount on the next purchase."  
			 crlf crlf)))


;; 20. Define a rule to offer a 50% discount on the next purchase if the customer buys at least 1 smartphone and 1 computer.


(defrule 20-discount-next-smartphone 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids)(computer-ids $?computer-ids))
    =>
    (if (and (not (member$ nil ?smartphone-ids))
	      (> (length$ ?smartphone-ids) 0)
              (not (member$ nil ?computer-ids))
              (> (length$ ?computer-ids) 0))
         then
	     (printout t "!!! 20. DISCOUNT: ORDER #"
			 ?id " !!!" crlf
			 "For buying at least one smartphone and one computer you have: 50% discount on the next purchase."  
			 crlf crlf)))


;; 21. Define a rule to offer 75 pesos in vouchers for every 1000 pesos spent on the purchase of a “Lenovo ThinkPad X1 Carbon” and a “Google Pixel 6”.


(defrule 21-vouchers-lenovo-pixel 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids) (computer-ids $?computer-ids))
=>
    (if (and (member$ 3 ?smartphone-ids) (member$ 4 ?computer-ids)) 
         then
	     (printout t "!!! 21. VOUCHER: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Lenovo ThinkPad X1 Carbon and a Google Pixel 6 you have: 75 pesos in vouchers for every 1000 pesos spent." 
			 crlf crlf)))



;; 22. Define a rule to offer 18 months interest-free on the purchase of an “HP Spectre x360” with a Citibank card.


(defrule 22-months-hp-capitalone 
    (order (order-id ?id) (computer-ids $?computer-ids) (credit-card-id 4))
=>
    (if (member$ 3 ?computer-ids) 
         then
	     (printout t "!!! 22. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying an HP Spectre x360 with a Citibank card you have: 18 months without interests." 
			 crlf crlf)))



;; 23. Define a rule to offer a 10% discount on a smartphone case if the customer buys an “iPhone 15”.


(defrule 23-discount-case-iphone 
    (order (order-id ?id) (smartphone-ids $?smartphone-ids))
=>
    (if (member$ 1 ?smartphone-ids) 
         then
	     (printout t "!!! 23. DISCOUNT: ORDER #"
			 ?id " !!!" crlf
			 "For buying an iPhone 15 you have: 10% discount on a smartphone case." 
			 crlf crlf)))



;; 24. Define a rule to offer 24 months interest-free on the purchase of a “Dell XPS 13” and a “MacBook Air” with a Banamex Visa card.


(defrule 24-months-dell-macbook-banamex 
    (order (order-id ?id) (computer-ids $?computer-ids) (credit-card-id 1))
=>
    (if (and (member$ 2 ?computer-ids) (member$ 1 ?computer-ids)) 
         then
	     (printout t "!!! 24. NO INTERESTS: ORDER #"
			 ?id " !!!" crlf
			 "For buying a Dell XPS 13 and a MacBook Air with a Banamex Visa card you have: 24 months without interests." 
			 crlf crlf)))



;; 25. Define a rule to segment clients by smartphone consumers


(defrule 25-type-of-product-smartphone
    (order (order-id ?orderId) (smartphone-ids $?smartphone-ids) (client-id ?clientId))
    (client (client-id ?clientId) (name ?name))
=>
    (if (not (member$ nil ?smartphone-ids))
         then
             (printout t "--- 25. SMARTPHONE CONSUMER: CUSTOMER #"
		    ?clientId " ---" crlf
		    "Client " ?name
		    " has bought a smartphone before in order #"
                    ?orderId "."
		    crlf crlf )))



;; 26. Define a rule to segment clients by computer consumers


(defrule 26-type-of-product-computer
    (order (order-id ?orderId) (computer-ids $?computer-ids) (client-id ?clientId))
    (client (client-id ?clientId) (name ?name))
=>
    (if (not (member$ nil ?computer-ids))
         then
             (printout t "--- 26. COMPUTER CONSUMER: CUSTOMER #"
		    ?clientId " ---" crlf
		    "Client " ?name
		    " has bought a computer before in order #"
                    ?orderId "."
		    crlf crlf )))



;; 27. Define a rule to segment clients by accessory consumers


(defrule 27-type-of-product-accessory
    (order (order-id ?orderId) (accessory-ids $?accessory-ids) (client-id ?clientId))
    (client (client-id ?clientId) (name ?name))
=>
    (if (not (member$ nil ?accessory-ids))
         then
             (printout t "--- 27. ACCESSORY CONSUMER: CUSTOMER #"
		    ?clientId " ---" crlf
		    "Client " ?name
		    " has bought a accessory before in order #"
                    ?orderId "."
		    crlf crlf )))



;; 28. Define a rule to segment clients by wholesaler (> 9 products)


(defrule 28-segment-wholesaler
    (order (order-id ?orderId) 
	   (accessory-quantities $?accessory-quantities)
           (computer-quantities $?computer-quantities)
           (smartphone-quantities $?smartphone-quantities) 
           (client-id ?clientId))
    (client (client-id ?clientId) (name ?name))
=>
    (if (or (> (max (expand$ ?accessory-quantities)) 9) 
	    (> (max (expand$ ?computer-quantities)) 9) 
	    (> (max (expand$ ?smartphone-quantities)) 9))
         then
             (printout t "%%% 28. WHOLESALE CONSUMER: CUSTOMER #"
		    ?clientId " %%%" crlf
		    "Client " ?name
		    " has bought by wholesale before in order #"
                    ?orderId "."
		    crlf crlf )))



;; 29. Define a rule to segment clients by retailer (> 0 and < 10 products)


(defrule 29-segment-retailer
    (order (order-id ?orderId) 
	   (accessory-quantities $?accessory-quantities)
           (computer-quantities $?computer-quantities)
           (smartphone-quantities $?smartphone-quantities) 
           (client-id ?clientId))
    (client (client-id ?clientId) (name ?name))
=>
    (if (or (and (> (min (expand$ ?accessory-quantities)) 0) (< (min (expand$ ?accessory-quantities)) 10)) 
            (and (> (min (expand$ ?computer-quantities)) 0) (< (min (expand$ ?computer-quantities)) 10)) 
            (and (> (min (expand$ ?smartphone-quantities)) 0) (< (min (expand$ ?smartphone-quantities)) 10)))
         then
             (printout t "*** 29. RETAIL CONSUMER: CUSTOMER #"
		    ?clientId " ***" crlf
		    "Client " ?name
		    " has bought by retail before in order #"
                    ?orderId "."
		    crlf crlf )))



