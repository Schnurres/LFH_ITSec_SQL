-- Create users and roles
DECLARE
    i INT;
BEGIN
    FOR i IN 1 TO 28 DO
        EXECUTE IMMEDIATE 'CREATE ROLE student' || i || '_role;';
        EXECUTE IMMEDIATE 'CREATE USER student' || i || ' PASSWORD = ''YoshiTheCorgi0805'' DEFAULT_ROLE = student' || i || '_role MUST_CHANGE_PASSWORD=TRUE;';
        EXECUTE IMMEDIATE 'GRANT ROLE student' || i || '_role TO USER student' || i || ';';
    END FOR;
END;


-- Create the global students role
CREATE ROLE IF NOT EXISTS students;

-- Grant the students role to each student's role
DECLARE
    i INT;
BEGIN
    FOR i IN 1 TO 28 DO
        EXECUTE IMMEDIATE 'GRANT ROLE students TO ROLE student' || i || '_role;';
    END FOR;
END;

-- Create databases and grant ownership
DECLARE
    i INT;
BEGIN
    FOR i IN 1 TO 28 DO
        EXECUTE IMMEDIATE 'CREATE DATABASE IF NOT EXISTS db_student' || i || ';';
        EXECUTE IMMEDIATE 'GRANT OWNERSHIP ON DATABASE db_student' || i || ' TO ROLE student' || i || '_role COPY CURRENT GRANTS;';
        EXECUTE IMMEDIATE 'GRANT ALL PRIVILEGES ON DATABASE db_student' || i || ' TO ROLE student' || i || '_role;';
    END FOR;
END;

-- Create shared databases
CREATE DATABASE IF NOT EXISTS raw_dev;
CREATE DATABASE IF NOT EXISTS raw_prod;

-- Grant read access to the students role
GRANT USAGE ON DATABASE raw_dev TO ROLE students;
GRANT USAGE ON DATABASE raw_prod TO ROLE students;

-- Create schema for exercises
CREATE SCHEMA IF NOT EXISTS raw_dev.exercise1;
CREATE SCHEMA IF NOT EXISTS raw_prod.exercise1;

-- Grant read access to the students role
GRANT USAGE ON SCHEMA raw_dev.exercise1 TO ROLE students;
GRANT USAGE ON SCHEMA raw_prod.exercise1 TO ROLE students;

-- Grant read access on all current and future tables/views
GRANT SELECT ON ALL TABLES IN SCHEMA raw_dev.exercise1 TO ROLE students;
GRANT SELECT ON ALL TABLES IN SCHEMA raw_prod.exercise1 TO ROLE students;

-- Apply future grants to ensure access to future tables/views
GRANT SELECT ON FUTURE TABLES IN SCHEMA raw_dev.exercise1 TO ROLE students;
GRANT SELECT ON FUTURE TABLES IN SCHEMA raw_prod.exercise1 TO ROLE students;


-- Create three warehouses
CREATE WAREHOUSE IF NOT EXISTS warehouse1 WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 60 INITIALLY_SUSPENDED = TRUE;
CREATE WAREHOUSE IF NOT EXISTS warehouse2 WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 60 INITIALLY_SUSPENDED = TRUE;
CREATE WAREHOUSE IF NOT EXISTS warehouse3 WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 60 INITIALLY_SUSPENDED = TRUE;
-- Assign students 1 to 10 to warehouse1, grant operate and usage rights, and set as default warehouse
DECLARE
    i INT;
BEGIN
    FOR i IN 1 TO 10 DO
        EXECUTE IMMEDIATE 'GRANT USAGE ON WAREHOUSE warehouse1 TO ROLE student' || i || '_role';
        EXECUTE IMMEDIATE 'GRANT OPERATE ON WAREHOUSE warehouse1 TO ROLE student' || i || '_role';
        EXECUTE IMMEDIATE 'ALTER USER student' || i || ' SET DEFAULT_WAREHOUSE = warehouse1, DEFAULT_NAMESPACE = db_student' || i;
    END FOR;
END;

-- Assign students 11 to 20 to warehouse2, grant operate and usage rights, and set as default warehouse
DECLARE
    i INT;
BEGIN
    FOR i IN 11 TO 20 DO
        EXECUTE IMMEDIATE 'GRANT USAGE ON WAREHOUSE warehouse2 TO ROLE student' || i || '_role';
        EXECUTE IMMEDIATE 'GRANT OPERATE ON WAREHOUSE warehouse2 TO ROLE student' || i || '_role';
        EXECUTE IMMEDIATE 'ALTER USER student' || i || ' SET DEFAULT_WAREHOUSE = warehouse2, DEFAULT_NAMESPACE = db_student' || i;
    END FOR;
END;

-- Assign students 21 to 28 to warehouse3, grant operate and usage rights, and set as default warehouse
DECLARE
    i INT;
BEGIN
    FOR i IN 21 TO 28 DO
        EXECUTE IMMEDIATE 'GRANT USAGE ON WAREHOUSE warehouse3 TO ROLE student' || i || '_role';
        EXECUTE IMMEDIATE 'GRANT OPERATE ON WAREHOUSE warehouse3 TO ROLE student' || i || '_role';
        EXECUTE IMMEDIATE 'ALTER USER student' || i || ' SET DEFAULT_WAREHOUSE = warehouse3, DEFAULT_NAMESPACE = db_student' || i;
    END FOR;
END;