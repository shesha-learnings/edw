--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

REVOKE CONNECT,TEMPORARY ON DATABASE winzip FROM PUBLIC;
GRANT TEMPORARY ON DATABASE winzip TO wz_hist_db_datawriter;
GRANT CONNECT ON DATABASE winzip TO wz_history_admin;
GRANT CONNECT ON DATABASE winzip TO wz_history_reader;
GRANT CONNECT ON DATABASE winzip TO phdata_db_datareader;
GRANT USAGE ON SCHEMA msghistoryandstats TO wz_hist_view_definition;
GRANT CREATE ON SCHEMA msghistoryandstats TO wz_hist_db_dlladmin;
GRANT USAGE ON SCHEMA msghistoryandstats TO phdata_view_definition;
GRANT SELECT ON TABLE msghistoryandstats."averageAudience" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."averageAudience_id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats.links TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats.links_id_seq TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats."messageSnapshots" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messageSnapshots_id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats."messagesHistory" TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats."messagesHistoryShortTerm" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesHistory_id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats."messagesSendingStats" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats."messagesVolume" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesVolume_id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats."potentialUsersStatsSrc" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats."topMsgs" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."topMsgs_id_seq" TO phdata_db_datareader;
GRANT SELECT ON TABLE msghistoryandstats."userDataSnapshots" TO phdata_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" TO phdata_db_datareader;

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT,USAGE ON SEQUENCES TO wz_hist_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT UPDATE ON SEQUENCES TO wz_hist_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT ALL ON FUNCTIONS TO wz_hist_db_executor;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT ON TABLES TO wz_hist_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO wz_hist_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT REFERENCES,TRIGGER ON TABLES TO wz_hist_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT ON TABLES TO phdata_db_datareader;
