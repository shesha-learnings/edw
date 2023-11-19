--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset RVR_WEB_WZP_REDIRECT_SEQUENCES_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "rvr_web_wzp_redirect_sequences"

CREATE SEQUENCE rvr_web_wzp_redirect."Build_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."Build_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."Build_Id_seq" OWNED BY rvr_web_wzp_redirect."Build"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."LinkType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."LinkType_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."LinkType_Id_seq" OWNED BY rvr_web_wzp_redirect."LinkType"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."Link_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."Link_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."Link_Id_seq" OWNED BY rvr_web_wzp_redirect."Link"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."NotificationEmail_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."NotificationEmail_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."NotificationEmail_Id_seq" OWNED BY rvr_web_wzp_redirect."NotificationEmail"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."ParameterName_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."ParameterName_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."ParameterName_Id_seq" OWNED BY rvr_web_wzp_redirect."ParameterName"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."Parameter_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."Parameter_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."Parameter_Id_seq" OWNED BY rvr_web_wzp_redirect."Parameter"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."ProductVersion_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."ProductVersion_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."ProductVersion_Id_seq" OWNED BY rvr_web_wzp_redirect."ProductVersion"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."Product_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."Product_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."Product_Id_seq" OWNED BY rvr_web_wzp_redirect."Product"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."PurchaseSetting_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."PurchaseSetting_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."PurchaseSetting_Id_seq" OWNED BY rvr_web_wzp_redirect."PurchaseSetting"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."Setting_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."Setting_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."Setting_Id_seq" OWNED BY rvr_web_wzp_redirect."Setting"."Id";

CREATE SEQUENCE rvr_web_wzp_redirect."UnknownProduct_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE rvr_web_wzp_redirect."UnknownProduct_Id_seq" OWNER TO rvr_web_wzp_poweruser;
ALTER SEQUENCE rvr_web_wzp_redirect."UnknownProduct_Id_seq" OWNED BY rvr_web_wzp_redirect."UnknownProduct"."Id";