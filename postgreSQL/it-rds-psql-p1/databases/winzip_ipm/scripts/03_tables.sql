--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE TABLE winzip_ipm.activation (
    activation_id bigint NOT NULL,
    regname character varying(255) NOT NULL,
    regcode character varying(50) NOT NULL,
    hwid character varying(100) NOT NULL,
    compname character varying(50) NOT NULL,
    inserttimestamp timestamp without time zone NOT NULL
);

ALTER TABLE winzip_ipm.activation OWNER TO itadmin;

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

ALTER TABLE ONLY winzip_ipm.activation ALTER COLUMN activation_id SET DEFAULT nextval('winzip_ipm.activation_activation_id_seq'::regclass);
ALTER TABLE ONLY winzip_ipm.regcode ALTER COLUMN regcode_id SET DEFAULT nextval('winzip_ipm.regcode_regcode_id_seq'::regclass);

ALTER TABLE ONLY winzip_ipm.request ALTER COLUMN request_id SET DEFAULT nextval('winzip_ipm.request_request_id_seq'::regclass);

ALTER TABLE ONLY winzip_ipm.activation
    ADD CONSTRAINT activation_pkey PRIMARY KEY (activation_id);

ALTER TABLE ONLY winzip_ipm.regcode
    ADD CONSTRAINT regcode_pkey PRIMARY KEY (regcode_id);

ALTER TABLE ONLY winzip_ipm.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (request_id);

ALTER TABLE ONLY winzip_ipm.regcode
    ADD CONSTRAINT uc_regcode_regname UNIQUE (regname, regcode);
