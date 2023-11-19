--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

REVOKE CONNECT,TEMPORARY ON DATABASE corel_web FROM PUBLIC;
GRANT TEMPORARY ON DATABASE corel_web TO web_db_datawriter;
GRANT CONNECT ON DATABASE corel_web TO web_poweruser;
GRANT CONNECT ON DATABASE corel_web TO web_user;
GRANT CONNECT ON DATABASE corel_web TO web_dev_user;
GRANT CONNECT ON DATABASE corel_web TO phdata_db_datareader;

GRANT USAGE ON SCHEMA corel_web TO web_view_definition;
GRANT CREATE ON SCHEMA corel_web TO web_db_dlladmin;
GRANT USAGE ON SCHEMA corel_web TO phdata_view_definition;

GRANT SELECT,USAGE ON SEQUENCE corel_web.psp_lic_contacts_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.psp_lic_contacts_id_seq TO web_db_datawriter;
GRANT SELECT,USAGE ON SEQUENCE corel_web.psp_lic_contacts_id_seq TO phdata_db_datareader;

GRANT SELECT ON TABLE corel_web."PaintShopPro_liccontact" TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web."PaintShopPro_liccontact" TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web."PaintShopPro_liccontact" TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web."PaintShopPro_liccontact" TO phdata_db_datareader;

GRANT SELECT ON TABLE corel_web.common_apistatus TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.common_apistatus TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.common_apistatus TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web.common_apistatus TO phdata_db_datareader;

GRANT SELECT,USAGE ON SEQUENCE corel_web.common_apistatus_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.common_apistatus_id_seq TO web_db_datawriter;
GRANT SELECT,USAGE ON SEQUENCE corel_web.common_apistatus_id_seq TO phdata_db_datareader;

GRANT SELECT ON TABLE corel_web.common_emailform TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.common_emailform TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.common_emailform TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web.common_emailform TO phdata_db_datareader;

GRANT SELECT ON TABLE corel_web.common_formbase TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.common_formbase TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.common_formbase TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web.common_formbase TO phdata_db_datareader;

GRANT SELECT,USAGE ON SEQUENCE corel_web.common_formbase_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.common_formbase_id_seq TO web_db_datawriter;
GRANT SELECT,USAGE ON SEQUENCE corel_web.common_formbase_id_seq TO phdata_db_datareader;

GRANT SELECT ON TABLE corel_web.django_migrations TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.django_migrations TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.django_migrations TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web.django_migrations TO phdata_db_datareader;

GRANT SELECT,USAGE ON SEQUENCE corel_web.django_migrations_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.django_migrations_id_seq TO web_db_datawriter;
GRANT SELECT,USAGE ON SEQUENCE corel_web.django_migrations_id_seq TO phdata_db_datareader;

GRANT SELECT,USAGE ON SEQUENCE corel_web.field_entry_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.field_entry_id_seq TO web_db_datawriter;
GRANT ALL ON SEQUENCE corel_web.field_entry_id_seq TO web_user;
GRANT SELECT,USAGE ON SEQUENCE corel_web.field_entry_id_seq TO phdata_db_datareader;

GRANT SELECT ON TABLE corel_web.field_entry TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.field_entry TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.field_entry TO web_db_dlladmin;
GRANT ALL ON TABLE corel_web.field_entry TO web_user;
GRANT SELECT ON TABLE corel_web.field_entry TO phdata_db_datareader;

GRANT SELECT,USAGE ON SEQUENCE corel_web.form_entry_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.form_entry_id_seq TO web_db_datawriter;
GRANT ALL ON SEQUENCE corel_web.form_entry_id_seq TO web_user;
GRANT SELECT,USAGE ON SEQUENCE corel_web.form_entry_id_seq TO phdata_db_datareader;

GRANT SELECT ON TABLE corel_web.form_entry TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.form_entry TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.form_entry TO web_db_dlladmin;
GRANT ALL ON TABLE corel_web.form_entry TO web_user;
GRANT SELECT ON TABLE corel_web.form_entry TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT SELECT,USAGE ON SEQUENCES TO web_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT UPDATE ON SEQUENCES TO web_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT SELECT,USAGE ON SEQUENCES TO web_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT UPDATE ON SEQUENCES TO web_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT ALL ON FUNCTIONS TO web_db_executor;
ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT ALL ON FUNCTIONS TO web_db_executor;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT SELECT ON TABLES TO web_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO web_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT REFERENCES,TRIGGER ON TABLES TO web_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT SELECT ON TABLES TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT SELECT ON TABLES TO web_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO web_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT REFERENCES,TRIGGER ON TABLES TO web_db_dlladmin;
