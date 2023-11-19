--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE SEQUENCE winzip_ipm.activation_activation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE winzip_ipm.activation_activation_id_seq OWNER TO itadmin;
ALTER SEQUENCE winzip_ipm.activation_activation_id_seq OWNED BY winzip_ipm.activation.activation_id;

CREATE SEQUENCE winzip_ipm.regcode_regcode_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE winzip_ipm.regcode_regcode_id_seq OWNER TO itadmin;
ALTER SEQUENCE winzip_ipm.regcode_regcode_id_seq OWNED BY winzip_ipm.regcode.regcode_id;

CREATE SEQUENCE winzip_ipm.request_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE winzip_ipm.request_request_id_seq OWNER TO itadmin;
ALTER SEQUENCE winzip_ipm.request_request_id_seq OWNED BY winzip_ipm.request.request_id;
