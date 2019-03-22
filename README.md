Airbnb Data Model - Star Schema
===================================================

This is an illustration of star schema data model on an imaginary data warehouse for Airbnb - prominent online marketplace for renting properties such as entire homes and apartments, private rooms, castles, boats, manors, tree houses, tipis, igloos, private islands and other properties. There is no data in the tables. Provided DLL script can be used to recreate this schema. ER diagram is created with DBeaver. Two lines between d_time and d_bookings are for start_date and end_date columns; the assumption is that d_time table holds a denormalised list of values for check in and check out date, for each date (eg. 10:00 AM and 17:00 PM for every day in certain range).


### Created With

* [PostgreSQL 10.6](https://www.postgresql.org/docs/10/release-10-6.html)  
* [DBeaver 5.2](https://dbeaver.io/2018/09/09/dbeaver-5-2/)  


### Results

![Airbnb Star Schema - Matko Sorić](https://raw.githubusercontent.com/matkosoric/Airbnb-Data-Model/master/airbnb_star_schema.png?raw=true "Airbnb Star Schema - Matko Soric")