--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset POSTGRES_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "posgres_permissions"

REVOKE CONNECT,TEMPORARY ON DATABASE postgres FROM PUBLIC;
GRANT CONNECT ON DATABASE postgres TO phdata_db_datareader;
