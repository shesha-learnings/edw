--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE SEQUENCE corel_web.psp_lic_contacts_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE corel_web.psp_lic_contacts_id_seq OWNER TO web_poweruser;

CREATE SEQUENCE corel_web.common_apistatus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE corel_web.common_apistatus_id_seq OWNER TO web_poweruser;
ALTER SEQUENCE corel_web.common_apistatus_id_seq OWNED BY corel_web.common_apistatus.id;

CREATE SEQUENCE corel_web.common_formbase_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE corel_web.common_formbase_id_seq OWNER TO web_poweruser;
ALTER SEQUENCE corel_web.common_formbase_id_seq OWNED BY corel_web.common_formbase.id;

CREATE SEQUENCE corel_web.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE corel_web.django_migrations_id_seq OWNER TO web_poweruser;
ALTER SEQUENCE corel_web.django_migrations_id_seq OWNED BY corel_web.django_migrations.id;

CREATE SEQUENCE corel_web.field_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE corel_web.field_entry_id_seq OWNER TO web_poweruser;

CREATE SEQUENCE corel_web.form_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE corel_web.form_entry_id_seq OWNER TO web_poweruser;

