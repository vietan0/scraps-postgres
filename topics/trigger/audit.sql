CREATE TABLE emp(
    empname           text NOT NULL,
    salary            integer
);

CREATE TABLE emp_audit(
    operation         char(1)   NOT NULL,
    stamp             timestamp NOT NULL,
    userid            text      NOT NULL,
    empname           text      NOT NULL,
    salary integer
);

CREATE OR REPLACE FUNCTION process_emp_audit() RETURNS TRIGGER AS $$
    BEGIN
        -- Keep track of activities performed on emp,
        IF (TG_OP = 'DELETE') THEN
            RAISE NOTICE 'OLD :>> %', old;
            INSERT INTO emp_audit VALUES('D', now(), user, OLD.*);
        ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO emp_audit VALUES('U', now(), user, NEW.*);
        ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO emp_audit VALUES('I', now(), user, NEW.*);
        END IF;
        RETURN NULL; -- result is ignored since this is an AFTER trigger
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER emp_audit 
  AFTER INSERT OR UPDATE OR DELETE 
  ON emp
  FOR EACH ROW EXECUTE FUNCTION process_emp_audit();

INSERT INTO emp VALUES ('John', 100);
INSERT INTO emp VALUES ('Emily', 90);
DELETE FROM emp WHERE empname = 'John';

TABLE emp;
TABLE emp_audit;

DROP TRIGGER emp_audit ON emp;
DROP FUNCTION process_emp_audit();
DROP TABLE emp;
DROP TABLE emp_audit;