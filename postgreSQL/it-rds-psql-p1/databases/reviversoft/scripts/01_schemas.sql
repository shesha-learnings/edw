--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset REVIVERSOFT_DB_SCHEMAS_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "reviversoft_db_schemas"

CREATE SCHEMA driverreviver;
ALTER SCHEMA driverreviver OWNER TO itadmin;

CREATE SCHEMA driverreviver_all_drivers;
ALTER SCHEMA driverreviver_all_drivers OWNER TO itadmin;

CREATE SCHEMA driverreviver_test;
ALTER SCHEMA driverreviver_test OWNER TO itadmin;

CREATE SCHEMA driverreviver_v2;
ALTER SCHEMA driverreviver_v2 OWNER TO itadmin;

CREATE SCHEMA feedbacks;
ALTER SCHEMA feedbacks OWNER TO itadmin;

CREATE SCHEMA installsafe;
ALTER SCHEMA installsafe OWNER TO itadmin;

CREATE SCHEMA msghistoryandstats;
ALTER SCHEMA msghistoryandstats OWNER TO itadmin;

CREATE SCHEMA redirect;
ALTER SCHEMA redirect OWNER TO itadmin;
