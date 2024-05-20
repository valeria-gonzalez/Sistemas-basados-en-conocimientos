(deffacts smartphones
	(smartphone (smartphone-id 1) (name "iPhone 15") (brand iPhone) (model 15) (price 33000) (color purple))
	(smartphone (smartphone-id 2) (name "Samsung Note 12") (brand Samsung) (model "Note 21") (price 50000) (color black))
	(smartphone (smartphone-id 3) (name "Google Pixel 6") (brand Google) (model 6) (price 45000) (color white))
	(smartphone (smartphone-id 4) (name "OnePlus 9") (brand OnePlus) (model 9) (price 42000) (color blue))
	(smartphone (smartphone-id 5) (name "Xiaomi Mi 11") (brand Xiaomi) (model "Mi 11") (price 38000) (color silver))
)

(deffacts computers
  	(computer (computer-id 1) (name "MacBook Air") (brand Apple) (model "Air") (price 95000) (storage "256GB SSD") (color silver))
	(computer (computer-id 2) (name "Dell XPS 13") (brand Dell) (model "XPS 13 9310") (price 120000) (storage "512GB SSD") (color black))
	(computer (computer-id 3) (name "HP Spectre x360") (brand HP) (model "Spectre x360 14") (price 110000) (storage "1TB SSD") (color blue))
	(computer (computer-id 4) (name "Lenovo ThinkPad X1 Carbon") (brand Lenovo) (model "X1 Carbon Gen 9") (price 140000) (storage "512GB SSD") (color gray))
	(computer (computer-id 5) (name "Asus ROG Zephyrus G14") (brand Asus) (model "Zephyrus G14") (price 150000) (storage "1TB SSD") (color white))
)

(deffacts accessories
  	(accessory (accessory-id 1) (name "Phone Case") (brand Apple) (model "A1657") (price 400) (purpose Smartphone) (color white))
	(accessory (accessory-id 2) (name "Logitech MX Master 3") (brand Logitech) (model "MX Master 3") (price 9000) (purpose Computer) (color black))
	(accessory (accessory-id 3) (name "Screen Protector") (brand Samsung) (model "MU-PA500B") (price 150) (purpose Smartphone) (color transparent))
	(accessory (accessory-id 4) (name "Bose QuietComfort 35 II") (brand Bose) (model "QC35 II") (price 25000) (purpose Smartphone) (color silver))
	(accessory (accessory-id 5) (name "Corsair K95 RGB Platinum") (brand Corsair) (model "K95 RGB") (price 20000) (purpose Computer) (color black))
)

(deffacts clients
  	(client (client-id 1) (name "John Doe") (email "john@example.com") (phone-number "123-456-7890") (address "123 Elm Street, Springfield, IL") (sex "male") (age 30))
	(client (client-id 2) (name "Jane Smith") (email "jane@example.com") (phone-number "987-654-3210") (address "456 Oak Avenue, Chicago, IL") (sex "female") (age 25))
	(client (client-id 3) (name "Carlos Martinez") (email "carlos@example.com") (phone-number "555-123-4567") (address "789 Maple Lane, Chicago, IL") (sex "male") (age 40))
	(client (client-id 4) (name "Maria Lopez") (email "maria@example.com") (phone-number "444-555-6666") (address "321 Pine Street, Miami, FL") (sex "female") (age 35))
	(client (client-id 5) (name "Akira Yamamoto") (email "akira@example.com") (phone-number "333-222-1111") (address "654 Birch Road, Chicago, IL") (sex "male") (age 28))
)

(deffacts credit-card
  	(credit-card (credit-card-id 1) (bank "Banamex") (group "Visa") (number "4111111111111111") (cvv "123") (date "12/25"))
	(credit-card (credit-card-id 2) (bank "Liverpool") (group "Visa") (number "5500000000000004") (cvv "456") (date "08/23"))
	(credit-card (credit-card-id 3) (bank "Wells Fargo") (group "American Express") (number "371449635398431") (cvv "789") (date "01/26"))
	(credit-card (credit-card-id 4) (bank "Citibank") (group "Discover") (number "6011000990139424") (cvv "101") (date "11/24"))
	(credit-card (credit-card-id 5) (bank "Capital One") (group "Visa") (number "4000056655665556") (cvv "321") (date "07/22"))
)

(deffacts voucher
  	(voucher (voucher-id 1) (cantidad 100))
	(voucher (voucher-id 2) (cantidad 200))
	(voucher (voucher-id 3) (cantidad 150))
	(voucher (voucher-id 4) (cantidad 300))
	(voucher (voucher-id 5) (cantidad 250))
)

(deffacts order
	(order (order-id 1) (client-id 1) (accessory-ids 1 2) (accessory-quantities 10 1) (smartphone-ids 1 4) (smartphone-quantities 1 1) (computer-ids 1 4 2) (computer-quantities 1 1 1) (credit-card-id 1))
	(order (order-id 2) (client-id 2) (accessory-ids 3) (accessory-quantities 1) (smartphone-ids 1 2 3) (smartphone-quantities 1 50 25) (credit-card-id 2))
	(order (order-id 3) (client-id 3) (smartphone-ids 4 5) (smartphone-quantities 10 10) (computer-ids 3) (computer-quantities 10) (credit-card-id 3))
	(order (order-id 4) (client-id 4) (accessory-ids 2 5) (accessory-quantities 3 2) (computer-ids 4 2 3) (computer-quantities 1 1 1) (credit-card-id 4))
	(order (order-id 5) (client-id 5) (computer-ids 1 3 4 5) (computer-quantities 1 1 2 1) (smartphone-ids 2 5 3) (smartphone-quantities 1 1 1))
)