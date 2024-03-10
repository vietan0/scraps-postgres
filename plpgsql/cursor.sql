create table employees (id serial primary key, name text, age int);
insert into employees (name, age) values ('John', 25), ('Amber', 32), ('Matt', 20), ('Conan', 60);
--
create function sayhi() returns text AS $$
declare 
  curazy cursor for select name from employees;
  x employees.name%type;
  names text := '';
begin 
  open curazy;
    loop
      -- when first opened, no row is selected, has to fetch
      fetch curazy into x; -- cur at 1 (John)
      exit when not found; -- order of exit in the loop matters
      names := names || x || ' '; -- concat
    end loop;
  close curazy;
  return names;
end;
$$ language plpgsql;

select * from sayhi();

--
drop function sayhi();
drop table employees;