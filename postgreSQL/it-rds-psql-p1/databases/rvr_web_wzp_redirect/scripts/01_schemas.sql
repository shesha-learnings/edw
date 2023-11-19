--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset RVR_WEB_WZP_REDIRECT_DB_SCHEMAS_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "rvr_web_wzp_redirect_db_schemas"

CREATE SCHEMA rvr_web_wzp_redirect;
ALTER SCHEMA rvr_web_wzp_redirect OWNER TO itadmin;
