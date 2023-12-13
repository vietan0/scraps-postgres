--  iterate over a result set
do $$
declare 
  r RECORD;
begin
  -- r has to be declared beforehand
  for r in select * from lists 
  loop
    raise notice 'r is %', r.name;
  end loop;
end;
$$ language plpgsql;

-- iterate over the result set of a dynamic query