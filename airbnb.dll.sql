CREATE TABLE airbnb.f_apartments (
	id int4 NOT NULL,
	appartment_name varchar NULL,
	city varchar NULL,
	adress varchar NULL,
	description_long varchar NULL,
	description_short varchar NULL,
	price numeric NULL,
	owner_id int4 NOT NULL,
	amenities_parking bool NULL,
	amenities_wifi bool NULL,
	amenities_kitchen bool NULL,
	amenities_iron bool NULL,
	amenities_tv bool NULL,
	amenities_microwave bool NULL,
	amenities_refrigerator bool NULL,
	last_update date NULL,
	CONSTRAINT apartments_pk PRIMARY KEY (id)
);

ALTER TABLE airbnb.f_apartments OWNER TO postgres;
GRANT ALL ON TABLE airbnb.f_apartments TO postgres;

CREATE TABLE airbnb.f_customers (
	id int4 NOT NULL,
	"name" varchar NOT NULL,
	surname varchar NOT NULL,
	dob date NOT NULL,
	oib int4 NOT NULL,
	city varchar NOT NULL,
	address varchar NOT NULL,
	CONSTRAINT f_customers_pk PRIMARY KEY (id)
);

ALTER TABLE airbnb.f_customers OWNER TO postgres;
GRANT ALL ON TABLE airbnb.f_customers TO postgres;

CREATE TABLE airbnb.f_owners (
	id int8 NOT NULL,
	"name" varchar NULL,
	surname varchar NULL,
	dob date NULL,
	city varchar NULL,
	address varchar NULL,
	oib int4 NULL,
	CONSTRAINT owners_pk PRIMARY KEY (id)
);

ALTER TABLE airbnb.f_owners OWNER TO postgres;
GRANT ALL ON TABLE airbnb.f_owners TO postgres;

CREATE TABLE airbnb.f_receipts (
	id int4 NOT NULL,
	customer_id int4 NULL,
	payment_date date NULL,
	amount float8 NULL,
	days_booked int4 NULL,
	CONSTRAINT f_receipts_pk PRIMARY KEY (id)
);

ALTER TABLE airbnb.f_receipts OWNER TO postgres;
GRANT ALL ON TABLE airbnb.f_receipts TO postgres;

CREATE TABLE airbnb.d_time (
	id int4 NOT NULL,
	date_point date NOT NULL,
	check_in time NOT NULL,
	check_out time NOT NULL,
	CONSTRAINT d_time_pk PRIMARY KEY (id),
	CONSTRAINT d_time_un UNIQUE (date_point)
);

ALTER TABLE airbnb.d_time OWNER TO postgres;
GRANT ALL ON TABLE airbnb.d_time TO postgres;

CREATE TABLE airbnb.d_bookings (
	id serial NOT NULL,
	apartment_id int4 NOT NULL,
	owner_id int4 NOT NULL,
	customer_id int4 NOT NULL,
	receipt_id int4 NOT NULL,
	start_date date NOT NULL,
	end_date date NOT NULL,
	CONSTRAINT d_bookings_pk PRIMARY KEY (id),
	CONSTRAINT apartments_fk FOREIGN KEY (apartment_id) REFERENCES f_apartments(id),
	CONSTRAINT customers_fk FOREIGN KEY (customer_id) REFERENCES f_customers(id),
	CONSTRAINT end_date_fk FOREIGN KEY (end_date) REFERENCES d_time(date_point),
	CONSTRAINT owners_fk FOREIGN KEY (owner_id) REFERENCES f_owners(id),
	CONSTRAINT receipt_fk FOREIGN KEY (receipt_id) REFERENCES f_receipts(id),
	CONSTRAINT start_fk FOREIGN KEY (start_date) REFERENCES d_time(date_point)
);

ALTER TABLE airbnb.d_bookings OWNER TO postgres;
GRANT ALL ON TABLE airbnb.d_bookings TO postgres;