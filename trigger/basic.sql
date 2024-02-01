create table employees (name text, salary integer, last_date time, last_user text);

create function trig_func() returns trigger as $$
begin
  -- useful local variables
  raise notice 'tg_name :>> %', tg_name;
  raise notice 'tg_when :>> %', tg_when;
  raise notice 'tg_level :>> %', tg_level;
  raise notice 'tg_op :>> %', tg_op;
  raise notice 'tg_relname :>> %', tg_relname;
  raise notice 'tg_table_name :>> %', tg_table_name;
  raise notice 'tg_table_schema :>> %', tg_table_schema;
  raise notice 'tg_nargs :>> %', tg_nargs;
  raise notice 'old :>> %', old;
  raise notice 'new :>> %', new;
  return new;
end;
$$ language plpgsql;

create trigger trig 
  before insert or update -- when 
  on employees -- where
  for each row -- row/statement level 
  execute function trig_func(); -- do what

insert into employees (name, salary, last_date) values ('John', 12000, '04:05 AM');

--
drop function trig_func() cascade;
drop table employees;