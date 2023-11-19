--
-- PostgreSQL database dump
--

-- Dumped from database version 11.19
-- Dumped by pg_dump version 16.1


\connect ns_sf_sync

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: corel_import; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA corel_import;


ALTER SCHEMA corel_import OWNER TO itadmin;

--
-- Name: ns_sf_sync; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA ns_sf_sync;


ALTER SCHEMA ns_sf_sync OWNER TO itadmin;

--
-- Name: DATABASE ns_sf_sync; Type: ACL; Schema: -; Owner: itadmin
--

REVOKE CONNECT,TEMPORARY ON DATABASE ns_sf_sync FROM PUBLIC;
GRANT TEMPORARY ON DATABASE ns_sf_sync TO ns_sf_db_datawriter;
GRANT CONNECT ON DATABASE ns_sf_sync TO ns_sf_poweruser;
GRANT CONNECT ON DATABASE ns_sf_sync TO ns_sf_user;
GRANT CONNECT ON DATABASE ns_sf_sync TO dguard;
GRANT CONNECT ON DATABASE ns_sf_sync TO phdata_db_datareader;


--
-- Name: SCHEMA corel_import; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA corel_import TO ns_sf_corel_import_view_definition;
GRANT CREATE ON SCHEMA corel_import TO ns_sf_corel_import_db_dlladmin;
GRANT USAGE ON SCHEMA corel_import TO phdata_view_definition;


--
-- Name: SCHEMA ns_sf_sync; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA ns_sf_sync TO ns_sf_view_definition;
GRANT CREATE ON SCHEMA ns_sf_sync TO ns_sf_db_dlladmin;
GRANT USAGE ON SCHEMA ns_sf_sync TO phdata_view_definition;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: corel_import; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT SELECT,USAGE ON SEQUENCES TO ns_sf_corel_import_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT UPDATE ON SEQUENCES TO ns_sf_corel_import_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: corel_import; Owner: ns_sf_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT SELECT,USAGE ON SEQUENCES TO ns_sf_corel_import_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT UPDATE ON SEQUENCES TO ns_sf_corel_import_db_datawriter;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: corel_import; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT ALL ON FUNCTIONS TO ns_sf_corel_import_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: corel_import; Owner: ns_sf_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT ALL ON FUNCTIONS TO ns_sf_corel_import_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: corel_import; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT SELECT ON TABLES TO ns_sf_corel_import_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO ns_sf_corel_import_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT REFERENCES,TRIGGER ON TABLES TO ns_sf_corel_import_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_import GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: corel_import; Owner: ns_sf_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT SELECT ON TABLES TO ns_sf_corel_import_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO ns_sf_corel_import_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA corel_import GRANT REFERENCES,TRIGGER ON TABLES TO ns_sf_corel_import_db_dlladmin;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: ns_sf_sync; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT SELECT,USAGE ON SEQUENCES TO ns_sf_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT UPDATE ON SEQUENCES TO ns_sf_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: ns_sf_sync; Owner: ns_sf_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT SELECT,USAGE ON SEQUENCES TO ns_sf_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT UPDATE ON SEQUENCES TO ns_sf_db_datawriter;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: ns_sf_sync; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT ALL ON FUNCTIONS TO ns_sf_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: ns_sf_sync; Owner: ns_sf_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT ALL ON FUNCTIONS TO ns_sf_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: ns_sf_sync; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT SELECT ON TABLES TO ns_sf_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO ns_sf_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT REFERENCES,TRIGGER ON TABLES TO ns_sf_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA ns_sf_sync GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: ns_sf_sync; Owner: ns_sf_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT SELECT ON TABLES TO ns_sf_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO ns_sf_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE ns_sf_poweruser IN SCHEMA ns_sf_sync GRANT REFERENCES,TRIGGER ON TABLES TO ns_sf_db_dlladmin;


--
-- PostgreSQL database dump complete
--

