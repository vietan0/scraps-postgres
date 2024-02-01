create table employees (id serial primary key, name varchar(255), age int);
insert into employees (name, age) values ('John', 25), ('Amber', 32), ('Matty', 20);
--
create function sayhi(
  OUT alias employees.name%type,
  OUT oldness employees.age%type
) language plpgsql as $$
begin
  select name, age into alias, oldness from employees where age < 30;
  -- no return clause needed because 'OUT' took care of it
end $$;

select * from sayhi();

--
drop function sayhi();
drop table employees;