CREATE TABLE cargo_schedule (
   schedule_id serial NOT NULL,
   departure_date date,
   ship_id int4 NOT NULL,
   owner_name int4,
   from_id int4,
   to_id int4,
   mat_one int4,
   mat_two int4,
   quantity_one float8,
   quantity_two float8, 
   pay_voucher_date date,
   advance_tk float8, 
   part_tk float8, 
   pay_location int4,
   total_tk float8, 
   balance_tk float8,
   account_id int4,
   PRIMARY KEY (schedule_id)
);



