--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

REVOKE CONNECT,TEMPORARY ON DATABASE winzip_ipm FROM PUBLIC;
GRANT TEMPORARY ON DATABASE winzip_ipm TO wzp_ipm_db_datawriter;
GRANT CONNECT ON DATABASE winzip_ipm TO wzp_ipm_poweruser;
GRANT CONNECT ON DATABASE winzip_ipm TO wzp_ipm_user;
GRANT CONNECT ON DATABASE winzip_ipm TO wzp_ipm_request_user;
GRANT CONNECT ON DATABASE winzip_ipm TO wzp_ipm_regcode_user;
GRANT CONNECT ON DATABASE winzip_ipm TO winzip_ipm_utpm_user;
GRANT CONNECT ON DATABASE winzip_ipm TO smannan;
GRANT CONNECT ON DATABASE winzip_ipm TO phdata_db_datareader;
GRANT USAGE ON SCHEMA winzip_ipm TO wzp_ipm_view_definition;
GRANT CREATE ON SCHEMA winzip_ipm TO wzp_ipm_db_dlladmin;
GRANT USAGE ON SCHEMA winzip_ipm TO phdata_view_definition;
GRANT SELECT ON TABLE winzip_ipm.activation TO wzp_ipm_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.activation TO wzp_ipm_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE winzip_ipm.activation TO wzp_ipm_db_dlladmin;
GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.activation TO wzp_ipm_request_user;
GRANT SELECT ON TABLE winzip_ipm.activation TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.activation_activation_id_seq TO wzp_ipm_db_datareader;
GRANT UPDATE ON SEQUENCE winzip_ipm.activation_activation_id_seq TO wzp_ipm_db_datawriter;
GRANT ALL ON SEQUENCE winzip_ipm.activation_activation_id_seq TO wzp_ipm_request_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.activation_activation_id_seq TO phdata_db_datareader;
GRANT SELECT ON TABLE winzip_ipm.regcode TO wzp_ipm_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.regcode TO wzp_ipm_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE winzip_ipm.regcode TO wzp_ipm_db_dlladmin;
GRANT SELECT ON TABLE winzip_ipm.regcode TO wzp_ipm_request_user;
GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.regcode TO wzp_ipm_regcode_user;
GRANT SELECT ON TABLE winzip_ipm.regcode TO winzip_ipm_utpm_user;
GRANT SELECT ON TABLE winzip_ipm.regcode TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO wzp_ipm_db_datareader;
GRANT UPDATE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO wzp_ipm_db_datawriter;
GRANT ALL ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO wzp_ipm_regcode_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO wzp_ipm_request_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO winzip_ipm_utpm_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO phdata_db_datareader;
GRANT SELECT ON TABLE winzip_ipm.request TO wzp_ipm_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.request TO wzp_ipm_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE winzip_ipm.request TO wzp_ipm_db_dlladmin;
GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.request TO wzp_ipm_request_user;
GRANT SELECT ON TABLE winzip_ipm.request TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.request_request_id_seq TO wzp_ipm_db_datareader;
GRANT UPDATE ON SEQUENCE winzip_ipm.request_request_id_seq TO wzp_ipm_db_datawriter;
GRANT ALL ON SEQUENCE winzip_ipm.request_request_id_seq TO wzp_ipm_request_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.request_request_id_seq TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT SELECT,USAGE ON SEQUENCES TO wzp_ipm_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT UPDATE ON SEQUENCES TO wzp_ipm_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT ALL ON FUNCTIONS TO wzp_ipm_db_executor;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT SELECT ON TABLES TO wzp_ipm_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO wzp_ipm_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT REFERENCES,TRIGGER ON TABLES TO wzp_ipm_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT SELECT ON TABLES TO phdata_db_datareader;
