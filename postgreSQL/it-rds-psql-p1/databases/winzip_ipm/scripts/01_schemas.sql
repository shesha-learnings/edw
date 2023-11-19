--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset WINZIP_IPM_DB_SCHEMAS_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "winzip_ipm_db_schemas"

CREATE SCHEMA winzip_ipm;
ALTER SCHEMA winzip_ipm OWNER TO itadmin;
