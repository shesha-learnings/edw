--
-- PostgreSQL database dump
--

-- Dumped from database version 11.19
-- Dumped by pg_dump version 16.1

\connect rvr_web_wzp_redirect

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
-- Name: rvr_web_wzp_redirect; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA rvr_web_wzp_redirect;


ALTER SCHEMA rvr_web_wzp_redirect OWNER TO itadmin;

--
-- Name: Purchase_Type; Type: TYPE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TYPE rvr_web_wzp_redirect."Purchase_Type" AS (
	autoactivation integer,
	width integer,
	height integer,
	pagetitle character varying
);


ALTER TYPE rvr_web_wzp_redirect."Purchase_Type" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Get_Purchase_Setting_And_Autoactivation(character varying, character varying, character varying); Type: FUNCTION; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE FUNCTION rvr_web_wzp_redirect."Get_Purchase_Setting_And_Autoactivation"(prodcode character varying, prodversion character varying, prodbuild character varying) RETURNS rvr_web_wzp_redirect."Purchase_Type"
    LANGUAGE plpgsql
    AS $$ 
DECLARE
	-- Defaults
	def_autoactivation_field_name VARCHAR := 'AutoactivationSessionTimeout';
	def_version VARCHAR := '0.0.0.0';
	def_build VARCHAR := '0';
	def_autoactivation INTEGER := 0;
	-- END Defaults
	query_result RECORD;
	query_build_result RECORD;
	response rvr_web_wzp_redirect."Purchase_Type";
BEGIN
	-- Get build by user product and user version and user build
	SELECT * INTO query_build_result FROM rvr_web_wzp_redirect."Build" AS b JOIN rvr_web_wzp_redirect."ProductVersion" AS pv ON (pv."Id" = b."ProductVersion_Id" AND pv."Version" = ProdVersion) JOIN rvr_web_wzp_redirect."Product" AS p ON (pv."Product_Id" = p."Id" AND p."Code" = ProdCode) WHERE (b."Number" = ProdBuild) LIMIT 1;
	IF NOT FOUND THEN
	   -- Get build by user product and default version and user build
	   SELECT * INTO query_build_result FROM rvr_web_wzp_redirect."Build" AS b JOIN rvr_web_wzp_redirect."ProductVersion" AS pv ON (pv."Id" = b."ProductVersion_Id" AND pv."Version" = def_version) JOIN rvr_web_wzp_redirect."Product" AS p ON (pv."Product_Id" = p."Id" AND p."Code" = ProdCode) WHERE (b."Number" = ProdBuild) LIMIT 1;
	   IF NOT FOUND THEN
	      -- Get build by user product and default version and default build
	      SELECT * INTO query_build_result FROM rvr_web_wzp_redirect."Build" AS b JOIN rvr_web_wzp_redirect."ProductVersion" AS pv ON (pv."Id" = b."ProductVersion_Id" AND pv."Version" = def_version) JOIN rvr_web_wzp_redirect."Product" AS p ON (pv."Product_Id" = p."Id" AND p."Code" = ProdCode) WHERE (b."Number" = def_build) LIMIT 1;
	   END IF;	
	END IF;	

	IF query_build_result."Autoactivation" THEN
	    SELECT "Value" INTO response.autoactivation FROM rvr_web_wzp_redirect."Setting" WHERE "Name" = def_autoactivation_field_name;
	ELSE
	    response.autoactivation = def_autoactivation;
	END IF;

	IF query_build_result."InProductPurchasing" THEN
	    -- Get purchase settings
	    SELECT * INTO query_result FROM rvr_web_wzp_redirect."PurchaseSetting" AS ps WHERE (ps."Id" = query_build_result."PurchaseSetting_Id");

	    -- Map result
	    response.Width := query_result."Width";
	    response.Height := query_result."Height";
	    response.PageTitle := query_result."PageTitle";
	END IF;

	RETURN response;
END; 
$$;


ALTER FUNCTION rvr_web_wzp_redirect."Get_Purchase_Setting_And_Autoactivation"(prodcode character varying, prodversion character varying, prodbuild character varying) OWNER TO rvr_web_wzp_poweruser;

SET default_tablespace = '';

--
-- Name: Build; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."Build" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Number" text,
    "IsDefault" boolean DEFAULT false NOT NULL,
    "Autoactivation" boolean DEFAULT false NOT NULL,
    "InProductPurchasing" boolean DEFAULT false NOT NULL,
    "ProductVersion_Id" bigint DEFAULT 0 NOT NULL,
    "PurchaseSetting_Id" bigint
);


ALTER TABLE rvr_web_wzp_redirect."Build" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Build_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."Build_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."Build_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Build_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."Build_Id_seq" OWNED BY rvr_web_wzp_redirect."Build"."Id";


--
-- Name: Link; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."Link" (
    "Id" bigint NOT NULL,
    "Url" text,
    "Type_Id" bigint DEFAULT 0 NOT NULL,
    "Build_Id" bigint DEFAULT 0 NOT NULL,
    "Forced" boolean DEFAULT false NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."Link" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: LinkParameter; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."LinkParameter" (
    "Link_Id" bigint DEFAULT 0 NOT NULL,
    "Parameter_Id" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."LinkParameter" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: LinkType; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."LinkType" (
    "Id" bigint NOT NULL,
    "Type" text,
    "IsDefault" boolean DEFAULT false NOT NULL,
    "Product_Id" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."LinkType" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: LinkType_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."LinkType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."LinkType_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: LinkType_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."LinkType_Id_seq" OWNED BY rvr_web_wzp_redirect."LinkType"."Id";


--
-- Name: Link_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."Link_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."Link_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Link_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."Link_Id_seq" OWNED BY rvr_web_wzp_redirect."Link"."Id";


--
-- Name: NotificationEmail; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."NotificationEmail" (
    "Id" bigint NOT NULL,
    "Email" text
);


ALTER TABLE rvr_web_wzp_redirect."NotificationEmail" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: NotificationEmail_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."NotificationEmail_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."NotificationEmail_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: NotificationEmail_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."NotificationEmail_Id_seq" OWNED BY rvr_web_wzp_redirect."NotificationEmail"."Id";


--
-- Name: Parameter; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."Parameter" (
    "Id" bigint NOT NULL,
    "Value" text,
    "Name_Id" bigint DEFAULT 0 NOT NULL,
    "Build_Id" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."Parameter" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: ParameterName; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."ParameterName" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Product_Id" bigint DEFAULT 0 NOT NULL,
    "IsDefault" boolean DEFAULT false NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."ParameterName" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: ParameterName_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."ParameterName_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."ParameterName_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: ParameterName_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."ParameterName_Id_seq" OWNED BY rvr_web_wzp_redirect."ParameterName"."Id";


--
-- Name: Parameter_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."Parameter_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."Parameter_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Parameter_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."Parameter_Id_seq" OWNED BY rvr_web_wzp_redirect."Parameter"."Id";


--
-- Name: Product; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."Product" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Code" text,
    "IsDefault" boolean DEFAULT false NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."Product" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: ProductVersion; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."ProductVersion" (
    "Id" bigint NOT NULL,
    "IsDefault" boolean DEFAULT false NOT NULL,
    "Version" text,
    "Product_Id" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."ProductVersion" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: ProductVersion_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."ProductVersion_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."ProductVersion_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: ProductVersion_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."ProductVersion_Id_seq" OWNED BY rvr_web_wzp_redirect."ProductVersion"."Id";


--
-- Name: Product_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."Product_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."Product_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Product_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."Product_Id_seq" OWNED BY rvr_web_wzp_redirect."Product"."Id";


--
-- Name: PurchaseSetting; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."PurchaseSetting" (
    "Id" bigint NOT NULL,
    "PageTitle" text,
    "Height" integer DEFAULT 0 NOT NULL,
    "Width" integer DEFAULT 0 NOT NULL,
    "IsDefault" boolean DEFAULT false NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."PurchaseSetting" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: PurchaseSetting_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."PurchaseSetting_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."PurchaseSetting_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: PurchaseSetting_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."PurchaseSetting_Id_seq" OWNED BY rvr_web_wzp_redirect."PurchaseSetting"."Id";


--
-- Name: Setting; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."Setting" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Value" text
);


ALTER TABLE rvr_web_wzp_redirect."Setting" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Setting_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."Setting_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."Setting_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Setting_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."Setting_Id_seq" OWNED BY rvr_web_wzp_redirect."Setting"."Id";


--
-- Name: UnknownProduct; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."UnknownProduct" (
    "Id" bigint NOT NULL,
    "Code" text,
    "Url" text,
    "Date" timestamp without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."UnknownProduct" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: UnknownProduct_Id_seq; Type: SEQUENCE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE SEQUENCE rvr_web_wzp_redirect."UnknownProduct_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE rvr_web_wzp_redirect."UnknownProduct_Id_seq" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: UnknownProduct_Id_seq; Type: SEQUENCE OWNED BY; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER SEQUENCE rvr_web_wzp_redirect."UnknownProduct_Id_seq" OWNED BY rvr_web_wzp_redirect."UnknownProduct"."Id";


--
-- Name: __MigrationHistory; Type: TABLE; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE TABLE rvr_web_wzp_redirect."__MigrationHistory" (
    "MigrationId" character varying(150) DEFAULT ''::character varying NOT NULL,
    "ContextKey" character varying(300) DEFAULT ''::character varying NOT NULL,
    "Model" bytea DEFAULT '\x'::bytea NOT NULL,
    "ProductVersion" character varying(32) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE rvr_web_wzp_redirect."__MigrationHistory" OWNER TO rvr_web_wzp_poweruser;

--
-- Name: Build Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Build" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Build_Id_seq"'::regclass);


--
-- Name: Link Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Link" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Link_Id_seq"'::regclass);


--
-- Name: LinkType Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkType" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."LinkType_Id_seq"'::regclass);


--
-- Name: NotificationEmail Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."NotificationEmail" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."NotificationEmail_Id_seq"'::regclass);


--
-- Name: Parameter Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Parameter" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Parameter_Id_seq"'::regclass);


--
-- Name: ParameterName Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."ParameterName" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."ParameterName_Id_seq"'::regclass);


--
-- Name: Product Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Product" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Product_Id_seq"'::regclass);


--
-- Name: ProductVersion Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."ProductVersion" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."ProductVersion_Id_seq"'::regclass);


--
-- Name: PurchaseSetting Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."PurchaseSetting" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."PurchaseSetting_Id_seq"'::regclass);


--
-- Name: Setting Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Setting" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Setting_Id_seq"'::regclass);


--
-- Name: UnknownProduct Id; Type: DEFAULT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."UnknownProduct" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."UnknownProduct_Id_seq"'::regclass);


--
-- Name: Build PK_rvr_web_wzp_redirect.Build; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Build"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Build" PRIMARY KEY ("Id");


--
-- Name: Link PK_rvr_web_wzp_redirect.Link; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Link"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Link" PRIMARY KEY ("Id");


--
-- Name: LinkParameter PK_rvr_web_wzp_redirect.LinkParameter; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkParameter"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.LinkParameter" PRIMARY KEY ("Link_Id", "Parameter_Id");


--
-- Name: LinkType PK_rvr_web_wzp_redirect.LinkType; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkType"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.LinkType" PRIMARY KEY ("Id");


--
-- Name: NotificationEmail PK_rvr_web_wzp_redirect.NotificationEmail; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."NotificationEmail"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.NotificationEmail" PRIMARY KEY ("Id");


--
-- Name: Parameter PK_rvr_web_wzp_redirect.Parameter; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Parameter"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Parameter" PRIMARY KEY ("Id");


--
-- Name: ParameterName PK_rvr_web_wzp_redirect.ParameterName; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."ParameterName"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.ParameterName" PRIMARY KEY ("Id");


--
-- Name: Product PK_rvr_web_wzp_redirect.Product; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Product"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Product" PRIMARY KEY ("Id");


--
-- Name: ProductVersion PK_rvr_web_wzp_redirect.ProductVersion; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."ProductVersion"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.ProductVersion" PRIMARY KEY ("Id");


--
-- Name: PurchaseSetting PK_rvr_web_wzp_redirect.PurchaseSetting; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."PurchaseSetting"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.PurchaseSetting" PRIMARY KEY ("Id");


--
-- Name: Setting PK_rvr_web_wzp_redirect.Setting; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Setting"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Setting" PRIMARY KEY ("Id");


--
-- Name: UnknownProduct PK_rvr_web_wzp_redirect.UnknownProduct; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."UnknownProduct"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.UnknownProduct" PRIMARY KEY ("Id");


--
-- Name: __MigrationHistory PK_rvr_web_wzp_redirect.__MigrationHistory; Type: CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."__MigrationHistory"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.__MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey");


--
-- Name: Build_IX_ProductVersion_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "Build_IX_ProductVersion_Id" ON rvr_web_wzp_redirect."Build" USING btree ("ProductVersion_Id");


--
-- Name: Build_IX_PurchaseSetting_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "Build_IX_PurchaseSetting_Id" ON rvr_web_wzp_redirect."Build" USING btree ("PurchaseSetting_Id");


--
-- Name: LinkParameter_IX_Link_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "LinkParameter_IX_Link_Id" ON rvr_web_wzp_redirect."LinkParameter" USING btree ("Link_Id");


--
-- Name: LinkParameter_IX_Parameter_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "LinkParameter_IX_Parameter_Id" ON rvr_web_wzp_redirect."LinkParameter" USING btree ("Parameter_Id");


--
-- Name: LinkType_IX_Product_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "LinkType_IX_Product_Id" ON rvr_web_wzp_redirect."LinkType" USING btree ("Product_Id");


--
-- Name: Link_IX_Build_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "Link_IX_Build_Id" ON rvr_web_wzp_redirect."Link" USING btree ("Build_Id");


--
-- Name: Link_IX_Type_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "Link_IX_Type_Id" ON rvr_web_wzp_redirect."Link" USING btree ("Type_Id");


--
-- Name: ParameterName_IX_Product_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "ParameterName_IX_Product_Id" ON rvr_web_wzp_redirect."ParameterName" USING btree ("Product_Id");


--
-- Name: Parameter_IX_Build_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "Parameter_IX_Build_Id" ON rvr_web_wzp_redirect."Parameter" USING btree ("Build_Id");


--
-- Name: Parameter_IX_Name_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "Parameter_IX_Name_Id" ON rvr_web_wzp_redirect."Parameter" USING btree ("Name_Id");


--
-- Name: ProductVersion_IX_Product_Id; Type: INDEX; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

CREATE INDEX "ProductVersion_IX_Product_Id" ON rvr_web_wzp_redirect."ProductVersion" USING btree ("Product_Id");


--
-- Name: Build FK_rvr_web_wzp_redirect.Build_rvr_web_wzp_redirect.ProductVersi; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Build"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Build_rvr_web_wzp_redirect.ProductVersi" FOREIGN KEY ("ProductVersion_Id") REFERENCES rvr_web_wzp_redirect."ProductVersion"("Id") ON DELETE CASCADE;


--
-- Name: Build FK_rvr_web_wzp_redirect.Build_rvr_web_wzp_redirect.PurchaseSett; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Build"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Build_rvr_web_wzp_redirect.PurchaseSett" FOREIGN KEY ("PurchaseSetting_Id") REFERENCES rvr_web_wzp_redirect."PurchaseSetting"("Id");


--
-- Name: LinkParameter FK_rvr_web_wzp_redirect.LinkParameter_rvr_web_wzp_redirect.Link; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkParameter"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.LinkParameter_rvr_web_wzp_redirect.Link" FOREIGN KEY ("Link_Id") REFERENCES rvr_web_wzp_redirect."Link"("Id") ON DELETE CASCADE;


--
-- Name: LinkParameter FK_rvr_web_wzp_redirect.LinkParameter_rvr_web_wzp_redirect.Para; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkParameter"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.LinkParameter_rvr_web_wzp_redirect.Para" FOREIGN KEY ("Parameter_Id") REFERENCES rvr_web_wzp_redirect."Parameter"("Id") ON DELETE CASCADE;


--
-- Name: LinkType FK_rvr_web_wzp_redirect.LinkType_rvr_web_wzp_redirect.Product_P; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkType"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.LinkType_rvr_web_wzp_redirect.Product_P" FOREIGN KEY ("Product_Id") REFERENCES rvr_web_wzp_redirect."Product"("Id");


--
-- Name: Link FK_rvr_web_wzp_redirect.Link_rvr_web_wzp_redirect.Build_Build_I; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Link"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Link_rvr_web_wzp_redirect.Build_Build_I" FOREIGN KEY ("Build_Id") REFERENCES rvr_web_wzp_redirect."Build"("Id");


--
-- Name: Link FK_rvr_web_wzp_redirect.Link_rvr_web_wzp_redirect.LinkType_Type; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Link"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Link_rvr_web_wzp_redirect.LinkType_Type" FOREIGN KEY ("Type_Id") REFERENCES rvr_web_wzp_redirect."LinkType"("Id") ON DELETE CASCADE;


--
-- Name: ParameterName FK_rvr_web_wzp_redirect.ParameterName_rvr_web_wzp_redirect.Prod; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."ParameterName"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.ParameterName_rvr_web_wzp_redirect.Prod" FOREIGN KEY ("Product_Id") REFERENCES rvr_web_wzp_redirect."Product"("Id");


--
-- Name: Parameter FK_rvr_web_wzp_redirect.Parameter_rvr_web_wzp_redirect.Build_Bu; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Parameter"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Parameter_rvr_web_wzp_redirect.Build_Bu" FOREIGN KEY ("Build_Id") REFERENCES rvr_web_wzp_redirect."Build"("Id");


--
-- Name: Parameter FK_rvr_web_wzp_redirect.Parameter_rvr_web_wzp_redirect.Paramete; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."Parameter"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Parameter_rvr_web_wzp_redirect.Paramete" FOREIGN KEY ("Name_Id") REFERENCES rvr_web_wzp_redirect."ParameterName"("Id") ON DELETE CASCADE;


--
-- Name: ProductVersion FK_rvr_web_wzp_redirect.ProductVersion_rvr_web_wzp_redirect.Pro; Type: FK CONSTRAINT; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

ALTER TABLE ONLY rvr_web_wzp_redirect."ProductVersion"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.ProductVersion_rvr_web_wzp_redirect.Pro" FOREIGN KEY ("Product_Id") REFERENCES rvr_web_wzp_redirect."Product"("Id") ON DELETE CASCADE;


--
-- Name: DATABASE rvr_web_wzp_redirect; Type: ACL; Schema: -; Owner: itadmin
--

REVOKE CONNECT,TEMPORARY ON DATABASE rvr_web_wzp_redirect FROM PUBLIC;
GRANT TEMPORARY ON DATABASE rvr_web_wzp_redirect TO rvr_web_wzp_db_datawriter;
GRANT CONNECT ON DATABASE rvr_web_wzp_redirect TO rvr_web_wzp_poweruser;
GRANT CONNECT ON DATABASE rvr_web_wzp_redirect TO rvr_web_wzp_user;
GRANT CONNECT ON DATABASE rvr_web_wzp_redirect TO phdata_db_datareader;


--
-- Name: SCHEMA rvr_web_wzp_redirect; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA rvr_web_wzp_redirect TO rvr_web_wzp_view_definition;
GRANT CREATE ON SCHEMA rvr_web_wzp_redirect TO rvr_web_wzp_db_dlladmin;
GRANT USAGE ON SCHEMA rvr_web_wzp_redirect TO phdata_view_definition;


--
-- Name: TABLE "Build"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."Build" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Build_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Build_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Link"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."Link" TO phdata_db_datareader;


--
-- Name: TABLE "LinkParameter"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."LinkParameter" TO phdata_db_datareader;


--
-- Name: TABLE "LinkType"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."LinkType" TO phdata_db_datareader;


--
-- Name: SEQUENCE "LinkType_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."LinkType_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Link_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Link_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "NotificationEmail"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."NotificationEmail" TO phdata_db_datareader;


--
-- Name: SEQUENCE "NotificationEmail_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."NotificationEmail_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Parameter"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."Parameter" TO phdata_db_datareader;


--
-- Name: TABLE "ParameterName"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."ParameterName" TO phdata_db_datareader;


--
-- Name: SEQUENCE "ParameterName_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."ParameterName_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Parameter_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Parameter_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Product"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."Product" TO phdata_db_datareader;


--
-- Name: TABLE "ProductVersion"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."ProductVersion" TO phdata_db_datareader;


--
-- Name: SEQUENCE "ProductVersion_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."ProductVersion_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Product_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Product_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "PurchaseSetting"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."PurchaseSetting" TO phdata_db_datareader;


--
-- Name: SEQUENCE "PurchaseSetting_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."PurchaseSetting_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Setting"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."Setting" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Setting_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."Setting_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "UnknownProduct"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."UnknownProduct" TO phdata_db_datareader;


--
-- Name: SEQUENCE "UnknownProduct_Id_seq"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE rvr_web_wzp_redirect."UnknownProduct_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "__MigrationHistory"; Type: ACL; Schema: rvr_web_wzp_redirect; Owner: rvr_web_wzp_poweruser
--

GRANT SELECT ON TABLE rvr_web_wzp_redirect."__MigrationHistory" TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: rvr_web_wzp_redirect; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT SELECT,USAGE ON SEQUENCES TO rvr_web_wzp_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT UPDATE ON SEQUENCES TO rvr_web_wzp_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: rvr_web_wzp_redirect; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT ALL ON FUNCTIONS TO rvr_web_wzp_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: rvr_web_wzp_redirect; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT SELECT ON TABLES TO rvr_web_wzp_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_web_wzp_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT REFERENCES,TRIGGER ON TABLES TO rvr_web_wzp_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA rvr_web_wzp_redirect GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- PostgreSQL database dump complete
--

