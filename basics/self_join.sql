drop table if exists employees;

create table employees (
  emp_id int primary key,
  name text,
  supe_id int
);

insert into
  employees
values
  (1, 'Hung Lu', 2),
  (2, 'Anta Bathy', 7),
  (3, 'Holden McGroin', 7),
  (4, 'Seth Poole', 2),
  (5, 'John Smith', 2),
  (6, 'Karren Koe', 3),
  (7, 'Grace Baldwin', NULL);

select
  empl.name,
  supe.name as supe
from
  employees empl
  left join employees supe on empl.supe_id = supe.emp_id;