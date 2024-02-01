do $$
declare
  counter int = 0;
begin
  loop
    counter = counter + 1;
    -- exit the loop if counter > 10
    exit when counter > 10;
    -- continue means skip: 
    -- skip the current iteration if counter is an even number
    continue when mod(counter,2) = 0;
    raise notice '%', counter;
  end loop;
end; $$