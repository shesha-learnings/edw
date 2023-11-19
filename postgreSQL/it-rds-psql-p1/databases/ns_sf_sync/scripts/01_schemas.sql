--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset NS_SF_SYNC_DB_SCHEMAS_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "ns_sf_sync_db_schemas"

CREATE SCHEMA corel_import;
ALTER SCHEMA corel_import OWNER TO itadmin;

CREATE SCHEMA ns_sf_sync;
ALTER SCHEMA ns_sf_sync OWNER TO itadmin;
