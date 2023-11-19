--
-- PostgreSQL database dump
--

-- Dumped from database version 11.19
-- Dumped by pg_dump version 16.1


\connect winzip_ipm

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
-- Name: winzip_ipm; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA winzip_ipm;


ALTER SCHEMA winzip_ipm OWNER TO itadmin;

SET default_tablespace = '';

--
-- Name: activation; Type: TABLE; Schema: winzip_ipm; Owner: itadmin
--

CREATE TABLE winzip_ipm.activation (
    activation_id bigint NOT NULL,
    regname character varying(255) NOT NULL,
    regcode character varying(50) NOT NULL,
    hwid character varying(100) NOT NULL,
    compname character varying(50) NOT NULL,
    inserttimestamp timestamp without time zone NOT NULL
);


ALTER TABLE winzip_ipm.activation OWNER TO itadmin;

--
-- Name: activation_activation_id_seq; Type: SEQUENCE; Schema: winzip_ipm; Owner: itadmin
--

CREATE SEQUENCE winzip_ipm.activation_activation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE winzip_ipm.activation_activation_id_seq OWNER TO itadmin;

--
-- Name: activation_activation_id_seq; Type: SEQUENCE OWNED BY; Schema: winzip_ipm; Owner: itadmin
--

ALTER SEQUENCE winzip_ipm.activation_activation_id_seq OWNED BY winzip_ipm.activation.activation_id;


--
-- Name: regcode; Type: TABLE; Schema: winzip_ipm; Owner: itadmin
--

CREATE TABLE winzip_ipm.regcode (
    regcode_id bigint NOT NULL,
    regname character varying(255) NOT NULL,
    regcode character varying(50) NOT NULL,
    tolerance integer NOT NULL,
    sku character varying(50) NOT NULL,
    product character varying(50) NOT NULL,
    inserttimestamp timestamp without time zone NOT NULL,
    pid character varying(10) DEFAULT 'WNZP'::character varying NOT NULL
);


ALTER TABLE winzip_ipm.regcode OWNER TO itadmin;

--
-- Name: regcode_regcode_id_seq; Type: SEQUENCE; Schema: winzip_ipm; Owner: itadmin
--

CREATE SEQUENCE winzip_ipm.regcode_regcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE winzip_ipm.regcode_regcode_id_seq OWNER TO itadmin;

--
-- Name: regcode_regcode_id_seq; Type: SEQUENCE OWNED BY; Schema: winzip_ipm; Owner: itadmin
--

ALTER SEQUENCE winzip_ipm.regcode_regcode_id_seq OWNED BY winzip_ipm.regcode.regcode_id;


--
-- Name: request; Type: TABLE; Schema: winzip_ipm; Owner: itadmin
--

CREATE TABLE winzip_ipm.request (
    request_id bigint NOT NULL,
    regname character varying(255) NOT NULL,
    regcode character varying(50) NOT NULL,
    ip character varying(50) NOT NULL,
    version character varying(20) NOT NULL,
    hwid character varying(100) NOT NULL,
    lang character varying(10) NOT NULL,
    response boolean NOT NULL,
    sku character varying(50) NOT NULL,
    product character varying(50) NOT NULL,
    inserttimestamp timestamp without time zone NOT NULL,
    responsereason character varying(10) NOT NULL
);


ALTER TABLE winzip_ipm.request OWNER TO itadmin;

--
-- Name: request_request_id_seq; Type: SEQUENCE; Schema: winzip_ipm; Owner: itadmin
--

CREATE SEQUENCE winzip_ipm.request_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE winzip_ipm.request_request_id_seq OWNER TO itadmin;

--
-- Name: request_request_id_seq; Type: SEQUENCE OWNED BY; Schema: winzip_ipm; Owner: itadmin
--

ALTER SEQUENCE winzip_ipm.request_request_id_seq OWNED BY winzip_ipm.request.request_id;


--
-- Name: activation activation_id; Type: DEFAULT; Schema: winzip_ipm; Owner: itadmin
--

ALTER TABLE ONLY winzip_ipm.activation ALTER COLUMN activation_id SET DEFAULT nextval('winzip_ipm.activation_activation_id_seq'::regclass);


--
-- Name: regcode regcode_id; Type: DEFAULT; Schema: winzip_ipm; Owner: itadmin
--

ALTER TABLE ONLY winzip_ipm.regcode ALTER COLUMN regcode_id SET DEFAULT nextval('winzip_ipm.regcode_regcode_id_seq'::regclass);


--
-- Name: request request_id; Type: DEFAULT; Schema: winzip_ipm; Owner: itadmin
--

ALTER TABLE ONLY winzip_ipm.request ALTER COLUMN request_id SET DEFAULT nextval('winzip_ipm.request_request_id_seq'::regclass);


--
-- Name: activation activation_pkey; Type: CONSTRAINT; Schema: winzip_ipm; Owner: itadmin
--

ALTER TABLE ONLY winzip_ipm.activation
    ADD CONSTRAINT activation_pkey PRIMARY KEY (activation_id);


--
-- Name: regcode regcode_pkey; Type: CONSTRAINT; Schema: winzip_ipm; Owner: itadmin
--

ALTER TABLE ONLY winzip_ipm.regcode
    ADD CONSTRAINT regcode_pkey PRIMARY KEY (regcode_id);


--
-- Name: request request_pkey; Type: CONSTRAINT; Schema: winzip_ipm; Owner: itadmin
--

ALTER TABLE ONLY winzip_ipm.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (request_id);


--
-- Name: regcode uc_regcode_regname; Type: CONSTRAINT; Schema: winzip_ipm; Owner: itadmin
--

ALTER TABLE ONLY winzip_ipm.regcode
    ADD CONSTRAINT uc_regcode_regname UNIQUE (regname, regcode);


--
-- Name: nu_regcode_pid; Type: INDEX; Schema: winzip_ipm; Owner: itadmin
--

CREATE INDEX nu_regcode_pid ON winzip_ipm.regcode USING btree (pid);


--
-- Name: nu_regcode_regcode; Type: INDEX; Schema: winzip_ipm; Owner: itadmin
--

CREATE INDEX nu_regcode_regcode ON winzip_ipm.regcode USING btree (regcode) INCLUDE (inserttimestamp);


--
-- Name: DATABASE winzip_ipm; Type: ACL; Schema: -; Owner: itadmin
--

REVOKE CONNECT,TEMPORARY ON DATABASE winzip_ipm FROM PUBLIC;
GRANT TEMPORARY ON DATABASE winzip_ipm TO wzp_ipm_db_datawriter;
GRANT CONNECT ON DATABASE winzip_ipm TO wzp_ipm_poweruser;
GRANT CONNECT ON DATABASE winzip_ipm TO wzp_ipm_user;
GRANT CONNECT ON DATABASE winzip_ipm TO wzp_ipm_request_user;
GRANT CONNECT ON DATABASE winzip_ipm TO wzp_ipm_regcode_user;
GRANT CONNECT ON DATABASE winzip_ipm TO winzip_ipm_utpm_user;
GRANT CONNECT ON DATABASE winzip_ipm TO smannan;
GRANT CONNECT ON DATABASE winzip_ipm TO phdata_db_datareader;


--
-- Name: SCHEMA winzip_ipm; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA winzip_ipm TO wzp_ipm_view_definition;
GRANT CREATE ON SCHEMA winzip_ipm TO wzp_ipm_db_dlladmin;
GRANT USAGE ON SCHEMA winzip_ipm TO phdata_view_definition;


--
-- Name: TABLE activation; Type: ACL; Schema: winzip_ipm; Owner: itadmin
--

GRANT SELECT ON TABLE winzip_ipm.activation TO wzp_ipm_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.activation TO wzp_ipm_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE winzip_ipm.activation TO wzp_ipm_db_dlladmin;
GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.activation TO wzp_ipm_request_user;
GRANT SELECT ON TABLE winzip_ipm.activation TO phdata_db_datareader;


--
-- Name: SEQUENCE activation_activation_id_seq; Type: ACL; Schema: winzip_ipm; Owner: itadmin
--

GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.activation_activation_id_seq TO wzp_ipm_db_datareader;
GRANT UPDATE ON SEQUENCE winzip_ipm.activation_activation_id_seq TO wzp_ipm_db_datawriter;
GRANT ALL ON SEQUENCE winzip_ipm.activation_activation_id_seq TO wzp_ipm_request_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.activation_activation_id_seq TO phdata_db_datareader;


--
-- Name: TABLE regcode; Type: ACL; Schema: winzip_ipm; Owner: itadmin
--

GRANT SELECT ON TABLE winzip_ipm.regcode TO wzp_ipm_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.regcode TO wzp_ipm_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE winzip_ipm.regcode TO wzp_ipm_db_dlladmin;
GRANT SELECT ON TABLE winzip_ipm.regcode TO wzp_ipm_request_user;
GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.regcode TO wzp_ipm_regcode_user;
GRANT SELECT ON TABLE winzip_ipm.regcode TO winzip_ipm_utpm_user;
GRANT SELECT ON TABLE winzip_ipm.regcode TO phdata_db_datareader;


--
-- Name: SEQUENCE regcode_regcode_id_seq; Type: ACL; Schema: winzip_ipm; Owner: itadmin
--

GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO wzp_ipm_db_datareader;
GRANT UPDATE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO wzp_ipm_db_datawriter;
GRANT ALL ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO wzp_ipm_regcode_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO wzp_ipm_request_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO winzip_ipm_utpm_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.regcode_regcode_id_seq TO phdata_db_datareader;


--
-- Name: TABLE request; Type: ACL; Schema: winzip_ipm; Owner: itadmin
--

GRANT SELECT ON TABLE winzip_ipm.request TO wzp_ipm_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.request TO wzp_ipm_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE winzip_ipm.request TO wzp_ipm_db_dlladmin;
GRANT SELECT,INSERT,DELETE,TRUNCATE,UPDATE ON TABLE winzip_ipm.request TO wzp_ipm_request_user;
GRANT SELECT ON TABLE winzip_ipm.request TO phdata_db_datareader;


--
-- Name: SEQUENCE request_request_id_seq; Type: ACL; Schema: winzip_ipm; Owner: itadmin
--

GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.request_request_id_seq TO wzp_ipm_db_datareader;
GRANT UPDATE ON SEQUENCE winzip_ipm.request_request_id_seq TO wzp_ipm_db_datawriter;
GRANT ALL ON SEQUENCE winzip_ipm.request_request_id_seq TO wzp_ipm_request_user;
GRANT SELECT,USAGE ON SEQUENCE winzip_ipm.request_request_id_seq TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: winzip_ipm; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT SELECT,USAGE ON SEQUENCES TO wzp_ipm_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT UPDATE ON SEQUENCES TO wzp_ipm_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: winzip_ipm; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT ALL ON FUNCTIONS TO wzp_ipm_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: winzip_ipm; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT SELECT ON TABLES TO wzp_ipm_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO wzp_ipm_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT REFERENCES,TRIGGER ON TABLES TO wzp_ipm_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA winzip_ipm GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- PostgreSQL database dump complete
--

