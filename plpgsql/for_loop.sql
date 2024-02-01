create table employees (id serial primary key, name varchar(255), age int);
insert into employees (name, age) values ('John', 25), ('Amber', 32), ('Matty', 20);

do $$
<<west_life>>
declare 
  x employees;
  query_string text := 'select * from employees';
  sort_type int := 2;
begin 
-- loop through numbers
   for i in 1 .. 3 loop
    raise notice 'i is %', i;
  end loop;

-- loop through dynamic queries
  if sort_type = 1 then
      query_string := query_string || ' order by name';
    elsif sort_type = 2 then
      query_string := query_string || ' order by age';
    elsif sort_type != 0 then
      raise 'invalid sort_type %', sort_type;
  end if;
  for x in execute query_string loop
    exit west_life when x.age > 30;
    raise notice 'x is %', x;
  end loop;

-- loop through query
  for x in select * from employees loop
    raise notice '% is % years old', x.name, x.age;
  end loop;
end $$;

DROP TABLE employees;
