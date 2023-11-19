--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset NS_SF_SYNC_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "ns_sf_sync_permissions"

REVOKE CONNECT,TEMPORARY ON DATABASE ns_sf_sync FROM PUBLIC;
GRANT TEMPORARY ON DATABASE ns_sf_sync TO ns_sf_db_datawriter;
GRANT CONNECT ON DATABASE ns_sf_sync TO ns_sf_poweruser;
GRANT CONNECT ON DATABASE ns_sf_sync TO ns_sf_user;
GRANT CONNECT ON DATABASE ns_sf_sync TO dguard;
GRANT CONNECT ON DATABASE ns_sf_sync TO phdata_db_datareader;

GRANT USAGE ON SCHEMA corel_import TO ns_sf_corel_import_view_definition;
GRANT CREATE ON SCHEMA corel_import TO ns_sf_corel_import_db_dlladmin;
GRANT USAGE ON SCHEMA corel_import TO phdata_view_definition;

GRANT USAGE ON SCHEMA ns_sf_sync TO ns_sf_view_definition;
GRANT CREATE ON SCHEMA ns_sf_sync TO ns_sf_db_dlladmin;
GRANT USAGE ON SCHEMA ns_sf_sync TO phdata_view_definition;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT SELECT,USAGE ON SEQUENCES TO ns_sf_corel_import_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT UPDATE ON SEQUENCES TO ns_sf_corel_import_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT SELECT,USAGE ON SEQUENCES TO ns_sf_corel_import_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT UPDATE ON SEQUENCES TO ns_sf_corel_import_db_datawriter;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT ALL ON FUNCTIONS TO ns_sf_corel_import_db_executor;

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT ALL ON FUNCTIONS TO ns_sf_corel_import_db_executor;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT SELECT ON TABLES TO ns_sf_corel_import_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO ns_sf_corel_import_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT REFERENCES,TRIGGER ON TABLES TO ns_sf_corel_import_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT SELECT ON TABLES TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT SELECT ON TABLES TO ns_sf_corel_import_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO ns_sf_corel_import_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT REFERENCES,TRIGGER ON TABLES TO ns_sf_corel_import_db_dlladmin;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT SELECT,USAGE ON SEQUENCES TO ns_sf_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT UPDATE ON SEQUENCES TO ns_sf_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT SELECT,USAGE ON SEQUENCES TO ns_sf_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT UPDATE ON SEQUENCES TO ns_sf_db_datawriter;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT ALL ON FUNCTIONS TO ns_sf_db_executor;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT ALL ON FUNCTIONS TO ns_sf_db_executor;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT SELECT ON TABLES TO ns_sf_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO ns_sf_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT REFERENCES,TRIGGER ON TABLES TO ns_sf_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT SELECT ON TABLES TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT SELECT ON TABLES TO ns_sf_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO ns_sf_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT REFERENCES,TRIGGER ON TABLES TO ns_sf_db_dlladmin;
