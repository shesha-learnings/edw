--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DB_SCHEMAS_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web_db_schemas"

CREATE SCHEMA corel_web;
ALTER SCHEMA corel_web OWNER TO itadmin;