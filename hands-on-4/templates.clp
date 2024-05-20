(deftemplate smartphone
  	(slot smartphone-id)
  	(slot name)
  	(slot brand)
  	(slot model)
  	(slot price)
  	(slot color)
)

(deftemplate computer
  	(slot computer-id)
  	(slot name)
  	(slot brand)
  	(slot model)
  	(slot price)
  	(slot storage)
  	(slot color)
)

(deftemplate accessory
  	(slot accessory-id)
  	(slot name)
  	(slot brand)
  	(slot model)
  	(slot price)
  	(slot purpose)
  	(slot color)
)

(deftemplate client
  	(slot client-id)
  	(slot name)
  	(slot email)
  	(slot phone-number)
  	(slot address)
  	(slot sex)
  	(slot age)
)

(deftemplate credit-card
  	(slot credit-card-id)
  	(slot bank)
  	(slot group)
 	(slot number)
  	(slot cvv)
  	(slot date)
)

(deftemplate voucher
  	(slot voucher-id)
  	(slot cantidad)
	(slot client-id (default nil))
)

(deftemplate order
  	(slot order-id)
  	(slot client-id)
	(multislot accessory-ids (default nil))
  	(multislot accessory-quantities (default 0))
   	(multislot smartphone-ids (default nil))
   	(multislot smartphone-quantities (default 0))
   	(multislot computer-ids (default nil))
   	(multislot computer-quantities (default 0))
  	(slot credit-card-id (default -1))
)

;; (list-deftemplates)