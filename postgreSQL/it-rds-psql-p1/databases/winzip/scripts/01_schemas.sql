--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset WINZIP_DB_SCHEMAS_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "winzip_db_schemas"

CREATE SCHEMA msghistoryandstats;
ALTER SCHEMA msghistoryandstats OWNER TO itadmin;
