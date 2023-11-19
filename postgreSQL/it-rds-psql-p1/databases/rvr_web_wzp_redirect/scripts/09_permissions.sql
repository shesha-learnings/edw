--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

REVOKE CONNECT,TEMPORARY ON DATABASE rvr_web_wzp_redirect FROM PUBLIC;
GRANT TEMPORARY ON DATABASE rvr_web_wzp_redirect TO rvr_web_wzp_db_datawriter;
GRANT CONNECT ON DATABASE rvr_web_wzp_redirect TO rvr_web_wzp_poweruser;
GRANT CONNECT ON DATABASE rvr_web_wzp_redirect TO rvr_web_wzp_user;
GRANT CONNECT ON DATABASE rvr_web_wzp_redirect TO phdata_db_datareader;
GRANT USAGE ON SCHEMA rvr_web_wzp_redirect TO rvr_web_wzp_view_definition;
GRANT CREATE ON SCHEMA rvr_web_wzp_redirect TO rvr_web_wzp_db_dlladmin;
GRANT USAGE ON SCHEMA rvr_web_wzp_redirect TO phdata_view_definition;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."Build" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Build_Id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."Link" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."LinkParameter" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."LinkType" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."LinkType_Id_seq" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Link_Id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."NotificationEmail" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."NotificationEmail_Id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."ParameterName" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."ParameterName_Id_seq" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Parameter_Id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."Product" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."ProductVersion" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."ProductVersion_Id_seq" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Product_Id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."PurchaseSetting" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."PurchaseSetting_Id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."Setting" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Setting_Id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."UnknownProduct" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."UnknownProduct_Id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE rvr_web_wzp_redirect."__MigrationHistory" TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT SELECT,USAGE ON SEQUENCES TO rvr_web_wzp_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT UPDATE ON SEQUENCES TO rvr_web_wzp_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT ALL ON FUNCTIONS TO rvr_web_wzp_db_executor;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT SELECT ON TABLES TO rvr_web_wzp_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_web_wzp_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT REFERENCES,TRIGGER ON TABLES TO rvr_web_wzp_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT SELECT ON TABLES TO phdata_db_datareader;
