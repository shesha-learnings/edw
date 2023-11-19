--
-- PostgreSQL database dump
--

-- Dumped from database version 11.19
-- Dumped by pg_dump version 16.1


\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: itadmin
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: DATABASE postgres; Type: ACL; Schema: -; Owner: itadmin
--

REVOKE CONNECT,TEMPORARY ON DATABASE postgres FROM PUBLIC;
GRANT CONNECT ON DATABASE postgres TO phdata_db_datareader;


--
-- PostgreSQL database dump complete
--

