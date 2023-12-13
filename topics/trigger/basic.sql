CREATE TABLE emp (
    empname text,
    salary integer,
    last_date time,
    last_user text
);

CREATE OR REPLACE FUNCTION emp_stamp() RETURNS trigger AS $$
    BEGIN
        RAISE NOTICE 'tg_name :>> %', tg_name;
        RAISE NOTICE 'tg_when :>> %', tg_when;
        RAISE NOTICE 'tg_level :>> %', tg_level;
        RAISE NOTICE 'tg_op :>> %', tg_op;
        RAISE NOTICE 'tg_relname :>> %', tg_relname;
        RAISE NOTICE 'tg_table_name :>> %', tg_table_name;
        RAISE NOTICE 'tg_table_schema :>> %', tg_table_schema;
        RAISE NOTICE 'tg_nargs :>> %', tg_nargs;
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER emp_stamp BEFORE INSERT OR UPDATE ON emp
    FOR EACH ROW EXECUTE FUNCTION emp_stamp();

INSERT INTO emp (empname, salary) VALUES ('John', 1);

DROP TRIGGER emp_stamp ON emp;
DROP FUNCTION emp_stamp();
DROP TABLE emp;