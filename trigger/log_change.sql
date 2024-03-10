create table employees(
  id int generated always as identity,
  first_name varchar(40) not null,
  last_name varchar(40) not null,
  primary key(id)
);

create table employee_audits (
  id int generated always as identity,
  employee_id int not null,
  old_last_name varchar(40) not null,
  new_last_name varchar(40) not null,
  changed_on timestamp(6) not null default now()
);

create function log_last_name_changes()
  returns trigger
  language plpgsql
  as $$
begin
  if new.last_name != old.last_name then
    insert into employee_audits (employee_id, old_last_name, new_last_name) 
    values (new.id, old.last_name, new.last_name);
  end if;
  return NULL;
end; $$;

create trigger listener
  after update
  on employees
  for each row
  execute function log_last_name_changes();

insert into employees (first_name, last_name) VALUES ('John', 'Adams');
select * from employees;
select * from employee_audits;
update employees set last_name = 'Mayer' where id = 1;
select * from employees;
select * from employee_audits;

--
drop function log_last_name_changes() cascade;
drop table employees, employee_audits;