create table employees (id serial primary key, name varchar(255), age int);
insert into employees (name, age) values ('John', 25), ('Amber', 32), ('Matty', 20);
--
create function sayhi() returns employees as $$
declare x employees;
begin 
  select * into x from employees where age > 30; --- if query return 0 or 1 row, INTO x assigns result to x
  return x;
end;
$$ language plpgsql;

select * from sayhi();

--
drop function sayhi();
drop table employees;