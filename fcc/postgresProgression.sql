alter table properties
  rename column weight to atomic_mass;

alter table properties
  rename column melting_point to melting_point_celsius;

alter table properties
  rename column boiling_point to boiling_point_celsius;

alter table properties
alter column melting_point_celsius
set not null;

alter table properties
alter column boiling_point_celsius
set not null;

alter table elements
add unique(symbol);

alter table elements
add unique(name);

alter table elements
alter column symbol
set not null;

alter table elements
alter column name
set not null;

alter table properties
add foreign key(atomic_number) references elements(atomic_number);

create table types(
  type_id serial primary key,
  type varchar not null
);

insert into types(type) values('nonmetal'), ('metal'), ('metalloid');

alter table properties
add type_id int references types(type_id);

update properties
set type_id = 1
where type = 'nonmetal';

update properties
set type_id = 2
where type = 'metal';

update properties
set type_id = 3
where type = 'metalloid';

alter table properties
alter column type_id
set not null;

update elements
set symbol = initcap(symbol);

ALTER TABLE properties
ALTER COLUMN atomic_mass TYPE DECIMAL;

UPDATE properties
SET atomic_mass = trim(
    trailing '00'
    FROM atomic_mass::TEXT
  )::DECIMAL;

insert into elements
values(9, 'F', 'Fluorine'), (10, 'Ne', 'Neon');

insert into properties
values(9, 'nonmetal', 18.998, -220, -188.1, 1), 
      (10, 'nonmetal', 20.18, -248.6, -246.1, 1);

delete from properties
where atomic_number = 1000;

delete from elements
where atomic_number = 1000;

alter table properties drop column type;