create table employees (id serial primary key, name varchar(255), age int);
insert into employees (name, age) values ('John', 25), ('Amber', 32), ('Matty', 20);

-- Two ways

-- 1. returns setof <table>
create function saybye() returns setof employees AS $$
declare x employees;
begin 
  return query select * from employees;
end;
$$ language plpgsql;

-- 2. returns table <column list>
create function sayhi() 
  returns table (id int, name varchar(255)) AS $$
declare x employees;
begin 
  -- process each row before returning
  for x in (select employees.id, employees.name from employees)
  loop
    id := x.id + 100;
    name := x.name || '-san';
    return next; -- add each row to return from the function
  end loop;
end;
$$ language plpgsql;

select * from sayhi();
-- select * from saybye();
--

drop function sayhi(), saybye();
drop table employees;