--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

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

CREATE TABLE corel_web.common_emailform (
    formbase_ptr_id integer NOT NULL,
    email character varying(254) NOT NULL
);

ALTER TABLE corel_web.common_emailform OWNER TO web_poweruser;

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

CREATE TABLE corel_web.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);

ALTER TABLE corel_web.django_migrations OWNER TO web_poweruser;

CREATE TABLE corel_web.field_entry (
    field_name character varying(100) NOT NULL,
    field_value character varying(5000),
    id integer DEFAULT nextval('corel_web.field_entry_id_seq'::regclass) NOT NULL,
    form_entry_id integer
);

ALTER TABLE corel_web.field_entry OWNER TO web_poweruser;

CREATE TABLE corel_web.form_entry (
    id integer DEFAULT nextval('corel_web.form_entry_id_seq'::regclass) NOT NULL,
    form_name character varying(100) NOT NULL,
    source character varying(500),
    exported boolean NOT NULL,
    create_date timestamp with time zone NOT NULL
);

ALTER TABLE corel_web.form_entry OWNER TO web_poweruser;
ALTER TABLE ONLY corel_web.common_apistatus ALTER COLUMN id SET DEFAULT nextval('corel_web.common_apistatus_id_seq'::regclass);
ALTER TABLE ONLY corel_web.common_formbase ALTER COLUMN id SET DEFAULT nextval('corel_web.common_formbase_id_seq'::regclass);
ALTER TABLE ONLY corel_web.django_migrations ALTER COLUMN id SET DEFAULT nextval('corel_web.django_migrations_id_seq'::regclass);

ALTER TABLE ONLY corel_web.common_apistatus
    ADD CONSTRAINT common_apistatus_pkey PRIMARY KEY (id);

ALTER TABLE ONLY corel_web.common_emailform
    ADD CONSTRAINT common_emailform_pkey PRIMARY KEY (formbase_ptr_id);

ALTER TABLE ONLY corel_web.common_formbase
    ADD CONSTRAINT common_formbase_pkey PRIMARY KEY (id);

ALTER TABLE ONLY corel_web.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY corel_web.field_entry
    ADD CONSTRAINT field_entry_pkey PRIMARY KEY (id);

ALTER TABLE ONLY corel_web.form_entry
    ADD CONSTRAINT form_entry_pkey PRIMARY KEY (id);

ALTER TABLE ONLY corel_web."PaintShopPro_liccontact"
    ADD CONSTRAINT pid PRIMARY KEY (id);

CREATE INDEX common_apistatus_form_id_a41e2144 ON corel_web.common_apistatus USING btree (form_id);
CREATE INDEX idx_common_apistatus_processed ON corel_web.common_apistatus USING btree (processed, retries, api);

ALTER TABLE ONLY corel_web.common_apistatus
    ADD CONSTRAINT common_apistatus_form_id_a41e2144_fk_common_formbase_id FOREIGN KEY (form_id) REFERENCES corel_web.common_formbase(id) DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY corel_web.common_emailform
    ADD CONSTRAINT common_emailform_formbase_ptr_id_4dcc97d5_fk_common_formbase_id FOREIGN KEY (formbase_ptr_id) REFERENCES corel_web.common_formbase(id) DEFERRABLE INITIALLY DEFERRED;

