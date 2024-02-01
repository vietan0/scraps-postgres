drop table if exists accounts;

create table accounts (
    id int generated by default as identity primary key,
    name varchar(100) not null,
    balance dec(15,2) not null
);

insert into accounts(name,balance) values('Bob',10000), ('Alice',10000);
select * from accounts;

-- syntax similar to function
create procedure transfer(
  sender int,
  receiver int,
  amount dec
) as $$
begin
  update accounts set balance = balance - amount where id = sender;
  update accounts set balance = balance + amount where id = receiver;
  commit;
  -- a procedure doesn't return anything
end; 
$$ language plpgsql;

-- CALL keyword to invoke
CALL transfer(1, 2, 1000);
select * from accounts;