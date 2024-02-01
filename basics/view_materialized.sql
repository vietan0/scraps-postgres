create table if not exists weather(
  city varchar(80),
  temp_lo int,
  temp_hi int,
  prcp real,
  date date
);

insert into weather
values ('San Francisco', 46, 50, 0.25, '1994-11-27');

insert into weather (city, temp_lo, temp_hi, prcp, date)
values ('San Francisco', 43, 57, 0.0, '1994-11-29');

insert into weather (date, city, temp_hi, temp_lo)
values ('1994-11-29', 'Hayward', 54, 37);

-- materialized - not auto updated every call
create materialized view mat_view as 
  select city, prcp, date from weather where date = '1994-11-29' 
  with data;

select * from mat_view;

-- update table
insert into weather (date, city) values ('1994-11-29', 'Oregon');

-- view not auto updated
select * from mat_view;

-- needs this to use 'concurrently'
create unique index unique_city ON mat_view (city);
-- explicit refresh
refresh materialized view concurrently mat_view;

-- view is fresh
select * from mat_view;

--
drop table if exists weather cascade;