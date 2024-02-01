do $$
declare 
  counter int := 1;
begin
  loop
    raise notice 'counter is %', counter;
    counter = counter + 1;
    if counter > 3 then
      exit;
    end if;
  end loop;
end;
$$ language plpgsql;