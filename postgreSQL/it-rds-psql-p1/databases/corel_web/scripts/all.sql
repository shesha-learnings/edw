--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE DATABASE corel_web WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';

ALTER DATABASE corel_web OWNER TO itadmin;

\connect corel_web

CREATE SCHEMA corel_web;

ALTER SCHEMA corel_web OWNER TO itadmin;

--
-- Name: psp_lic_contacts_id_seq; Type: SEQUENCE; Schema: corel_web; Owner: web_poweruser
--

CREATE SEQUENCE corel_web.psp_lic_contacts_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE corel_web.psp_lic_contacts_id_seq OWNER TO web_poweruser;

SET default_tablespace = '';

--
-- Name: PaintShopPro_liccontact; Type: TABLE; Schema: corel_web; Owner: web_poweruser
--

CREATE TABLE corel_web."PaintShopPro_liccontact" (
    id integer DEFAULT nextval('corel_web.psp_lic_contacts_id_seq'::regclass) NOT NULL,
    name character varying(255),
    email character varying(255),
    phone character varying(50),
    company character varying(255),
    blicensing boolean,
    elicensing boolean,
    glicensing boolean,
    orgsize integer,
    seats integer,
    optin boolean
);


ALTER TABLE corel_web."PaintShopPro_liccontact" OWNER TO web_poweruser;

--
-- Name: common_apistatus; Type: TABLE; Schema: corel_web; Owner: web_poweruser
--

CREATE TABLE corel_web.common_apistatus (
    id integer NOT NULL,
    api character varying(32) NOT NULL,
    retries smallint NOT NULL,
    processed boolean NOT NULL,
    results jsonb NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    form_id integer NOT NULL,
    CONSTRAINT common_apistatus_retries_check CHECK ((retries >= 0))
);


ALTER TABLE corel_web.common_apistatus OWNER TO web_poweruser;

--
-- Name: common_apistatus_id_seq; Type: SEQUENCE; Schema: corel_web; Owner: web_poweruser
--

CREATE SEQUENCE corel_web.common_apistatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE corel_web.common_apistatus_id_seq OWNER TO web_poweruser;

--
-- Name: common_apistatus_id_seq; Type: SEQUENCE OWNED BY; Schema: corel_web; Owner: web_poweruser
--

ALTER SEQUENCE corel_web.common_apistatus_id_seq OWNED BY corel_web.common_apistatus.id;


--
-- Name: common_emailform; Type: TABLE; Schema: corel_web; Owner: web_poweruser
--

CREATE TABLE corel_web.common_emailform (
    formbase_ptr_id integer NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE corel_web.common_emailform OWNER TO web_poweruser;

--
-- Name: common_formbase; Type: TABLE; Schema: corel_web; Owner: web_poweruser
--

CREATE TABLE corel_web.common_formbase (
    id integer NOT NULL,
    marketing_program character varying(256) NOT NULL,
    gclid character varying(100),
    ga_clientid character varying(256),
    utm_medium text,
    utm_source text,
    utm_campaign text,
    utm_term text,
    utm_content text,
    utm_id text,
    language character varying(16),
    locale character varying(16)
);


ALTER TABLE corel_web.common_formbase OWNER TO web_poweruser;

--
-- Name: common_formbase_id_seq; Type: SEQUENCE; Schema: corel_web; Owner: web_poweruser
--

CREATE SEQUENCE corel_web.common_formbase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE corel_web.common_formbase_id_seq OWNER TO web_poweruser;

--
-- Name: common_formbase_id_seq; Type: SEQUENCE OWNED BY; Schema: corel_web; Owner: web_poweruser
--

ALTER SEQUENCE corel_web.common_formbase_id_seq OWNED BY corel_web.common_formbase.id;


--
-- Name: django_migrations; Type: TABLE; Schema: corel_web; Owner: web_poweruser
--

CREATE TABLE corel_web.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE corel_web.django_migrations OWNER TO web_poweruser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: corel_web; Owner: web_poweruser
--

CREATE SEQUENCE corel_web.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE corel_web.django_migrations_id_seq OWNER TO web_poweruser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: corel_web; Owner: web_poweruser
--

ALTER SEQUENCE corel_web.django_migrations_id_seq OWNED BY corel_web.django_migrations.id;


--
-- Name: field_entry_id_seq; Type: SEQUENCE; Schema: corel_web; Owner: web_poweruser
--

CREATE SEQUENCE corel_web.field_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE corel_web.field_entry_id_seq OWNER TO web_poweruser;

--
-- Name: field_entry; Type: TABLE; Schema: corel_web; Owner: web_poweruser
--

CREATE TABLE corel_web.field_entry (
    field_name character varying(100) NOT NULL,
    field_value character varying(5000),
    id integer DEFAULT nextval('corel_web.field_entry_id_seq'::regclass) NOT NULL,
    form_entry_id integer
);


ALTER TABLE corel_web.field_entry OWNER TO web_poweruser;

--
-- Name: form_entry_id_seq; Type: SEQUENCE; Schema: corel_web; Owner: web_poweruser
--

CREATE SEQUENCE corel_web.form_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE corel_web.form_entry_id_seq OWNER TO web_poweruser;

--
-- Name: form_entry; Type: TABLE; Schema: corel_web; Owner: web_poweruser
--

CREATE TABLE corel_web.form_entry (
    id integer DEFAULT nextval('corel_web.form_entry_id_seq'::regclass) NOT NULL,
    form_name character varying(100) NOT NULL,
    source character varying(500),
    exported boolean NOT NULL,
    create_date timestamp with time zone NOT NULL
);


ALTER TABLE corel_web.form_entry OWNER TO web_poweruser;

--
-- Name: common_apistatus id; Type: DEFAULT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.common_apistatus ALTER COLUMN id SET DEFAULT nextval('corel_web.common_apistatus_id_seq'::regclass);


--
-- Name: common_formbase id; Type: DEFAULT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.common_formbase ALTER COLUMN id SET DEFAULT nextval('corel_web.common_formbase_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.django_migrations ALTER COLUMN id SET DEFAULT nextval('corel_web.django_migrations_id_seq'::regclass);


--
-- Name: common_apistatus common_apistatus_pkey; Type: CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.common_apistatus
    ADD CONSTRAINT common_apistatus_pkey PRIMARY KEY (id);


--
-- Name: common_emailform common_emailform_pkey; Type: CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.common_emailform
    ADD CONSTRAINT common_emailform_pkey PRIMARY KEY (formbase_ptr_id);


--
-- Name: common_formbase common_formbase_pkey; Type: CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.common_formbase
    ADD CONSTRAINT common_formbase_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: field_entry field_entry_pkey; Type: CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.field_entry
    ADD CONSTRAINT field_entry_pkey PRIMARY KEY (id);


--
-- Name: form_entry form_entry_pkey; Type: CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.form_entry
    ADD CONSTRAINT form_entry_pkey PRIMARY KEY (id);


--
-- Name: PaintShopPro_liccontact pid; Type: CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web."PaintShopPro_liccontact"
    ADD CONSTRAINT pid PRIMARY KEY (id);


--
-- Name: common_apistatus_form_id_a41e2144; Type: INDEX; Schema: corel_web; Owner: web_poweruser
--

CREATE INDEX common_apistatus_form_id_a41e2144 ON corel_web.common_apistatus USING btree (form_id);


--
-- Name: idx_common_apistatus_processed; Type: INDEX; Schema: corel_web; Owner: web_poweruser
--

CREATE INDEX idx_common_apistatus_processed ON corel_web.common_apistatus USING btree (processed, retries, api);


--
-- Name: common_apistatus common_apistatus_form_id_a41e2144_fk_common_formbase_id; Type: FK CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.common_apistatus
    ADD CONSTRAINT common_apistatus_form_id_a41e2144_fk_common_formbase_id FOREIGN KEY (form_id) REFERENCES corel_web.common_formbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: common_emailform common_emailform_formbase_ptr_id_4dcc97d5_fk_common_formbase_id; Type: FK CONSTRAINT; Schema: corel_web; Owner: web_poweruser
--

ALTER TABLE ONLY corel_web.common_emailform
    ADD CONSTRAINT common_emailform_formbase_ptr_id_4dcc97d5_fk_common_formbase_id FOREIGN KEY (formbase_ptr_id) REFERENCES corel_web.common_formbase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: DATABASE corel_web; Type: ACL; Schema: -; Owner: itadmin
--

REVOKE CONNECT,TEMPORARY ON DATABASE corel_web FROM PUBLIC;
GRANT TEMPORARY ON DATABASE corel_web TO web_db_datawriter;
GRANT CONNECT ON DATABASE corel_web TO web_poweruser;
GRANT CONNECT ON DATABASE corel_web TO web_user;
GRANT CONNECT ON DATABASE corel_web TO web_dev_user;
GRANT CONNECT ON DATABASE corel_web TO phdata_db_datareader;


--
-- Name: SCHEMA corel_web; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA corel_web TO web_view_definition;
GRANT CREATE ON SCHEMA corel_web TO web_db_dlladmin;
GRANT USAGE ON SCHEMA corel_web TO phdata_view_definition;


--
-- Name: SEQUENCE psp_lic_contacts_id_seq; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE corel_web.psp_lic_contacts_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.psp_lic_contacts_id_seq TO web_db_datawriter;
GRANT SELECT,USAGE ON SEQUENCE corel_web.psp_lic_contacts_id_seq TO phdata_db_datareader;


--
-- Name: TABLE "PaintShopPro_liccontact"; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT ON TABLE corel_web."PaintShopPro_liccontact" TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web."PaintShopPro_liccontact" TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web."PaintShopPro_liccontact" TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web."PaintShopPro_liccontact" TO phdata_db_datareader;


--
-- Name: TABLE common_apistatus; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT ON TABLE corel_web.common_apistatus TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.common_apistatus TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.common_apistatus TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web.common_apistatus TO phdata_db_datareader;


--
-- Name: SEQUENCE common_apistatus_id_seq; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE corel_web.common_apistatus_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.common_apistatus_id_seq TO web_db_datawriter;
GRANT SELECT,USAGE ON SEQUENCE corel_web.common_apistatus_id_seq TO phdata_db_datareader;


--
-- Name: TABLE common_emailform; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT ON TABLE corel_web.common_emailform TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.common_emailform TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.common_emailform TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web.common_emailform TO phdata_db_datareader;


--
-- Name: TABLE common_formbase; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT ON TABLE corel_web.common_formbase TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.common_formbase TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.common_formbase TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web.common_formbase TO phdata_db_datareader;


--
-- Name: SEQUENCE common_formbase_id_seq; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE corel_web.common_formbase_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.common_formbase_id_seq TO web_db_datawriter;
GRANT SELECT,USAGE ON SEQUENCE corel_web.common_formbase_id_seq TO phdata_db_datareader;


--
-- Name: TABLE django_migrations; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT ON TABLE corel_web.django_migrations TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.django_migrations TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.django_migrations TO web_db_dlladmin;
GRANT SELECT ON TABLE corel_web.django_migrations TO phdata_db_datareader;


--
-- Name: SEQUENCE django_migrations_id_seq; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE corel_web.django_migrations_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.django_migrations_id_seq TO web_db_datawriter;
GRANT SELECT,USAGE ON SEQUENCE corel_web.django_migrations_id_seq TO phdata_db_datareader;


--
-- Name: SEQUENCE field_entry_id_seq; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE corel_web.field_entry_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.field_entry_id_seq TO web_db_datawriter;
GRANT ALL ON SEQUENCE corel_web.field_entry_id_seq TO web_user;
GRANT SELECT,USAGE ON SEQUENCE corel_web.field_entry_id_seq TO phdata_db_datareader;


--
-- Name: TABLE field_entry; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT ON TABLE corel_web.field_entry TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.field_entry TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.field_entry TO web_db_dlladmin;
GRANT ALL ON TABLE corel_web.field_entry TO web_user;
GRANT SELECT ON TABLE corel_web.field_entry TO phdata_db_datareader;


--
-- Name: SEQUENCE form_entry_id_seq; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE corel_web.form_entry_id_seq TO web_db_datareader;
GRANT UPDATE ON SEQUENCE corel_web.form_entry_id_seq TO web_db_datawriter;
GRANT ALL ON SEQUENCE corel_web.form_entry_id_seq TO web_user;
GRANT SELECT,USAGE ON SEQUENCE corel_web.form_entry_id_seq TO phdata_db_datareader;


--
-- Name: TABLE form_entry; Type: ACL; Schema: corel_web; Owner: web_poweruser
--

GRANT SELECT ON TABLE corel_web.form_entry TO web_db_datareader;
GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLE corel_web.form_entry TO web_db_datawriter;
GRANT REFERENCES,TRIGGER ON TABLE corel_web.form_entry TO web_db_dlladmin;
GRANT ALL ON TABLE corel_web.form_entry TO web_user;
GRANT SELECT ON TABLE corel_web.form_entry TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: corel_web; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT SELECT,USAGE ON SEQUENCES TO web_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT UPDATE ON SEQUENCES TO web_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: corel_web; Owner: web_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT SELECT,USAGE ON SEQUENCES TO web_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT UPDATE ON SEQUENCES TO web_db_datawriter;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: corel_web; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT ALL ON FUNCTIONS TO web_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: corel_web; Owner: web_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT ALL ON FUNCTIONS TO web_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: corel_web; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT SELECT ON TABLES TO web_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO web_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT REFERENCES,TRIGGER ON TABLES TO web_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA corel_web GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: corel_web; Owner: web_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT SELECT ON TABLES TO web_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO web_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE web_poweruser IN SCHEMA corel_web GRANT REFERENCES,TRIGGER ON TABLES TO web_db_dlladmin;


--
-- PostgreSQL database dump complete
--

