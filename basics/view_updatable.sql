CREATE TABLE IF NOT EXISTS weather(
  city VARCHAR(80),
  temp_lo INT,
  temp_hi INT,
  prcp REAL,
  date date
);

insert into weather
VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');

insert into weather (city, temp_lo, temp_hi, prcp, DATE)
VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');

insert into weather (DATE, city, temp_hi, temp_lo)
VALUES ('1994-11-29', 'Hayward', 54, 37);

-- updatable
create view upview as
  select city, prcp, date from weather where date = '1994-11-29';

select * from weather;

-- insert into view, not into table
insert into upview (date, city) VALUES ('1994-11-29', 'Oregon');

select * from weather;

-- delete from view
delete from upview where city = 'Oregon';

select * from weather;

--
DROP VIEW IF EXISTS upview;
DROP TABLE IF EXISTS weather;