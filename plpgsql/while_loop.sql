do $$
declare
  x int := 42;
begin
  while x < 50 loop
    raise notice 'while loop, x is %', x;
    x := x + 1;
  end loop;
end $$;