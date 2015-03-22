/* 
	doing this to make sure I'm starting with a new database
*/
DROP DATABASE IF EXISTS LSJournals;
/* 
	creating database
*/
CREATE DATABASE LSJournals;
/* 
	using database
*/
USE LSJournals;

/* 
	creating table for subscriber
*/
CREATE TABLE subscriber
(
	/* 
		making table attributes based on data dictionary
		subscriber superclass
	*/
	/* 
		subscriber id
		 - automatically increments everytime a new subscriber is added
		 - NO NEED TO MAKE A TEXT BOX BECAUSE IT AUTOMATICALLY GENERATES IT IN THE DATABASE
	*/
	subscriber_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	/* 
		subscriber name
		 - name of subscriber
		 - NEEDS A WAY TO CHECK IF USER ALREADY HAS A NAME TO PREVENT FURTHER REDUNDANCY 
		 EG. IF NATIONAL UNIVERSITY SUBSCRIBES, CHECK IF NATIONAL UNIVERSITY IS ALREADY PRESENT IN DATABASE
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL 
		 (THIS CANNOT BE NULL)
	*/
	subscriber_name VARCHAR(50) NOT NULL,
	/* 
		subscriber type
		 - type of subscriber whether they are LOCAL INDIVIDUAL, LOCAL INSTITUTION, GLOBAL INDIVIDUAL, or GLOBAL INSTITUTIONAL
		 - MAKE A WAY SO THAT THE ONLY CHOICES ARE LOCAL INDIVIDUAL, LOCAL INSTITUTIONAL, GLOBAL INDIVIDUAL, or GLOBAL INSTITUTIONAL
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL ELSE MAKE IT DEFAULT TO LOCAL INSTITUTIONAL ONCE LEFT NULL
	*/
	subscriber_type VARCHAR(20) NOT NULL DEFAULT 'LOCAL INSTITUTIONAL',
	/* 
		email
		 - email of subscriber
		 - PREVENT THE USER FROM LEAVING THIS NULL 
		 (THIS CANNOT BE NULL DUE TO IT BEING A CONTACT DETAIL)
		 - COULD BE POSSIBLE THAT THE SUBSCRIBER HAS MORE THAN JUST ONE EMAIL
		 MAKE A WAY TO FOR THE USER TO DYNAMICALLY ADD MORE FIELDS FOR THIS
	*/
	email VARCHAR(40),
	/* 
		phone number
		 - phone number of subscriber
		 - MIGHT NEED 2 FIELDS FOR LANDLINE AND CELLPHONE NUMBERS 
		 (FOR INSTITUTION, CELLPHONE NUMBER MIGHT BE FROM THE CONTACT PERSON)
		 - PREVENT THE USER FROM LEAVING THIS NULL 
		 (THIS CANNOT BE NULL DUE TO IT BEING A CONTACT DETAIL)
		 - COULD BE POSSIBLE THAT THE SUBSCRIBER HAS MORE THAN JUST ONE PHONE NUMBER
		 MAKE A WAY TO FOR THE USER TO DYNAMICALLY ADD MORE FIELDS FOR THIS
	*/
	phone_num VARCHAR(15) NOT NULL,
	/* 
		fax number
		 - fax number of subscriber
		 - PREVENT THE USER FROM LEAVING THIS NULL 
		 (THIS CANNOT BE NULL DUE TO IT BEING A CONTACT DETAIL)
		 - COULD BE POSSIBLE THAT THE SUBSCRIBER HAS MORE THAN JUST FAX NUMBER
		 MAKE A WAY TO FOR THE USER TO DYNAMICALLY ADD MORE FIELDS FOR THIS
	*/
	fax_num VARCHAR(15),
	/* 
		primary address
		 - primary physical address of subscriber
		 - PREVENT THE USER FROM LEAVING THIS NULL 
		 (THIS CANNOT BE NULL DUE TO IT BEING A CONTACT DETAIL)
	*/
	address1 VARCHAR(200) NOT NULL,
	/* 
		secondary address
		 - secondary physical address of subscriber
		 - COULD BE POSSIBLE THAT THE SUBSCRIBER HAS MORE THAN JUST A SECONDARY ADDRESS
		 MAKE A WAY TO FOR THE USER TO DYNAMICALLY ADD MORE FIELDS FOR THIS
	*/
	address2 VARCHAR(200),
	/* 
		zip code
		 - zip code of subscriber
	*/
	zip_code VARCHAR(4) NOT NULL,
	
	CONSTRAINT subscriber_pk PRIMARY KEY (subscriber_id)
);

/* 
	creating table for institution subscriber
	extension of subscriber table meant for institutions
*/
CREATE TABLE institution_subscriber
(
	/* 
		making table attributes based on data dictionary
		institution subscriber subclass
	*/
	/* 
		subscriber id
		 - references the subscriber id from parent table subscriber
	*/
	subscriber_id INT UNSIGNED NOT NULL,
	/* 
		contact person
		 - contact person for the institution
		 - COULD BE POSSIBLE THAT THE SUBSCRIBER HAS MORE THAN JUST ONE CONTACT PERSON
		 MAKE A WAY TO FOR THE USER TO DYNAMICALLY ADD MORE FIELDS FOR THIS
		 - PREVENT THE USER FROM LEAVING THIS NULL 
		 (THIS CANNOT BE NULL DUE TO IT BEING A CONTACT DETAIL)
	*/
	contact_person VARCHAR(30) NOT NULL,
	/* 
		ip address
		 - ip address of whole institution web server
	*/
	ip_address VARCHAR(13),
	
	CONSTRAINT institution_subscriber_fk FOREIGN KEY (subscriber_id) REFERENCES subscriber(subscriber_id)
);

/* 
	creating table for journals
*/
CREATE TABLE journal
(
	/* 
		making table attributes based on data dictionary
		journal class
	*/
	/* 
		journal id
		 - automatically increments everytime a new journal is added
		 - NO NEED TO MAKE A TEXT BOX BECAUSE IT AUTOMATICALLY GENERATES IT IN THE DATABASE
	*/
	journal_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	/* 
		journal title
		 - name of journal
		 - NEEDS A WAY TO CHECK IF USER ALREADY HAS A NAME TO PREVENT FURTHER REDUNDANCY 
		 EG. IF NATIONAL UNIVERSITY DAILY IS ADDED, CHECK IF NATIONAL UNIVERSITY DAILY IS ALREADY PRESENT IN DATABASE
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL 
		 (THIS CANNOT BE NULL)
	*/
	journal_title VARCHAR(50) NOT NULL,
	/* 
		number of issues
		 - number of issues of a journal per year
		 - number of issues in one volume
		 - PREVENT THE USER FROM LEAVING THIS NULL ELSE MAKE IT DEFAULT TO 1 ONCE LEFT NULL
	*/
	num_of_issues INT(2) UNSIGNED NOT NULL DEFAULT 1,
	/* 
		global institutional price
		 - price for the journals used for global institution subscribers
		 - MAKE A WAY SO THAT THE PRICES ARE DEPENDENT ON THE CURRENCY TYPE FIELD
		 EG. IF THE CURRENCY TYPE IS 'USD' THE PRICES DISPLAYED SHOULD ONLY BE IN 'USD'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL
		 (THIS CANNOT BE NULL)
	*/
	global_institutional_price DECIMAL(6,2) NOT NULL DEFAULT 0.00,
	/* 
		global individual price
		 - price for the journals used for global individual subscribers
		 - MAKE A WAY SO THAT THE PRICES ARE DEPENDENT ON THE CURRENCY TYPE FIELD
		 EG. IF THE CURRENCY TYPE IS 'USD' THE PRICES DISPLAYED SHOULD ONLY BE IN 'USD'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL
		 (THIS CANNOT BE NULL)
	*/
	global_individual_price DECIMAL(6,2) NOT NULL DEFAULT 0.00,
	/* 
		local institution price
		 - price for the journals used for local institution subscribers
		 - MAKE A WAY SO THAT THE PRICES ARE DEPENDENT ON THE CURRENCY TYPE FIELD
		 EG. IF THE CURRENCY TYPE IS 'USD' THE PRICES DISPLAYED SHOULD ONLY BE IN 'USD'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL
		 (THIS CANNOT BE NULL)
	*/
	local_institutional_price DECIMAL(6,2) NOT NULL DEFAULT 0.00,
	/* 
		local individual price
		 - price for the journals used for local individual subscribers
		 - MAKE A WAY SO THAT THE PRICES ARE DEPENDENT ON THE CURRENCY TYPE FIELD
		 EG. IF THE CURRENCY TYPE IS 'USD' THE PRICES DISPLAYED SHOULD ONLY BE IN 'USD'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL
		 (THIS CANNOT BE NULL)
	*/
	local_individual_price DECIMAL(6,2) NOT NULL DEFAULT 0.00,
	/* 
		global price per issue
		 - global price of the journals per issue
		 - MAKE A WAY SO THAT THE PRICES ARE DEPENDENT ON THE CURRENCY TYPE FIELD
		 EG. IF THE CURRENCY TYPE IS 'USD' THE PRICES DISPLAYED SHOULD ONLY BE IN 'USD'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL
		 (THIS CANNOT BE NULL)
	*/
	global_per_issue_price DECIMAL(6,2) NOT NULL DEFAULT 0.00,
	/* 
		local price per issue
		 - local price of the journals per issue
		 - MAKE A WAY SO THAT THE PRICES ARE DEPENDENT ON THE CURRENCY TYPE FIELD
		 EG. IF THE CURRENCY TYPE IS 'USD' THE PRICES DISPLAYED SHOULD ONLY BE IN 'USD'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL
		 (THIS CANNOT BE NULL)
	*/
	local_per_issue_price DECIMAL(6,2) NOT NULL DEFAULT 0.00,
	
	CONSTRAINT journal_pk PRIMARY KEY (journal_id)
);

CREATE TABLE journal_issue
(
	/* 
		making table attributes based on data dictionary
		journal issue dependent class
		dependent on journal class
	*/
	/* 
		journal id
		 - references journal id in journal
	*/
	journal_id INT UNSIGNED NOT NULL,
	/* 
		issue number
		 - current/latest issue under a journal
		 - CONSTANTLY CHANGES BUT ONLY INCREMENTS FROM 1-HIGHEST POSSIBLY FOR ONE YEAR
		 THEN RETURNS TO 0 ONCE A NEW YEAR ARRIVES. NEED A WAY FOR THE AUTOMATIC INCREMENTATION TO BE POSSIBLE
		 SO THAT THIS INCREMENTS AS NEW ISSUES ARE ADDED BUT CHECKS IF THE NEW YEAR (CALENDAR OR FISCAL YEAR?)
		 ARRIVES AND MAKE THE VALUE 0
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL ELSE MAKE IT DEFAULT TO 0 ONCE LEFT NULL
	*/
	issue_num INT(2) UNSIGNED NOT NULL DEFAULT 1,
	/* 
		volume number
		 - number of volumes currently under a journal
		 - CONSTANTLY CHANGES BUT ONLY INCREMENTS PER YEAR. MAKE IT SO THAT ONCE A NEW YEAR (NEW FISCAL OR NEW CALENDAR YEAR?)
		 PASSES, IT INCREMENTS AUTOMATICALLY
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL ELSE MAKE IT DEFAULT TO 0 ONCE LEFT NULL
	*/
	volume_num INT(3) UNSIGNED NOT NULL DEFAULT 1,
	/*
		publication date
		 - date the current issue was published
		 - SHOULD ONLY DISPLAY MONTH AND YEAR
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL
		 (THIS CANNOT BE NULL)
	*/
	publication_date DATE NOT NULL,
	
	CONSTRAINT journal_issue_pk PRIMARY KEY (issue_num),
	
	CONSTRAINT journal_issue_fk FOREIGN KEY (journal_id) REFERENCES journal(journal_id)
);

/* 
	creating table for subscription
*/
CREATE TABLE subscription
(
	/* 
		making table attributes based on data dictionary
		subscription associative class
	*/
	/* 
		subscriber id
		 - references the subscriber id from parent table subscriber
	*/
	subscriber_id INT UNSIGNED NOT NULL,
	/* 
		journal id
		 - references journal id in journal
	*/
	journal_id INT UNSIGNED NOT NULL,
	/*
		subscription date
		 - date the subscriber subscribed to a journal
		 - SHOULD ONLY DISPLAY MONTH AND YEAR
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL
		 (THIS CANNOT BE NULL)
	*/
	subscription_date DATE NOT NULL,
	/* 
		years of subscription
		 - number of years the subscriber is subscribed to a journal
		 - CANNOT BE LESS THAT 1 YEAR
	*/
	years_of_subscription INT(1) UNSIGNED NOT NULL,
	/* 
		subscription status
		 - subscription status of the subscriber's subscription
		 - DEPENDENT ON SUBSCRIPTION DATE TO SHOW THAT A SUBSCRIBER SUBSCRIBED TO A JOURNAL
		 ON THAT DATE BUT THEN DID NOT SUBSCRIBE TO SAID JOURNAL AFTERWARDS
		 - STATUS 'UNSUBSCRIBED' JUST SHOWS PREVIOUS SUBSCRIPTION OF A USER TO A CERTAIN JOURNAL YET DID NOT
		 SUBSCRIBE TO AFTERWARDS
		 - MAKE A WAY SO THAT THE ONLY CHOICES ARE 'SUBSCRIBED' OR 'UNSUBSCRIBED'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL ELSE MAKE IT DEFAULT TO 'UNSUBSCRIBED' ONCE LEFT NULL
	*/
	subscription_status VARCHAR(12) NOT NULL DEFAULT 'UNSUBSCRIBED',
	/* 
		payment status
		 - payment status of the subscriber's subscription
		 - MAKE A WAY SO THAT THE ONLY CHOICES ARE 'NOT YET PAID' OR 'PAID'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL ELSE MAKE IT DEFAULT TO 'NOT YET PAID' ONCE LEFT NULL
	*/
	payment_status VARCHAR(12) NOT NULL DEFAULT 'NOT YET PAID',
	/* 
		delivery status
		 - delivery status of the subscriber's subscription
		 - MAKE A WAY SO THAT THE ONLY CHOICES ARE 'NOT YET DELIVERED' OR 'DELIVERED'
		 - ALSO PREVENT THE USER FROM LEAVING THIS NULL ELSE MAKE IT DEFAULT TO 'NOT YET DELIVERED' ONCE LEFT NULL
	*/
	delivery_status VARCHAR(17) NOT NULL DEFAULT 'NOT YET DELIVERED',
	
	CONSTRAINT subscription_fk1 FOREIGN KEY (subscriber_id) REFERENCES subscriber(subscriber_id),
	CONSTRAINT subscription_fk2 FOREIGN KEY (journal_id) REFERENCES journal(journal_id)
);