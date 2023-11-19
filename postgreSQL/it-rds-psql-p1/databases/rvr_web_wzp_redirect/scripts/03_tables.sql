--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

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

CREATE TABLE rvr_web_wzp_redirect."Link" (
    "Id" bigint NOT NULL,
    "Url" text,
    "Type_Id" bigint DEFAULT 0 NOT NULL,
    "Build_Id" bigint DEFAULT 0 NOT NULL,
    "Forced" boolean DEFAULT false NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."Link" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."LinkParameter" (
    "Link_Id" bigint DEFAULT 0 NOT NULL,
    "Parameter_Id" bigint DEFAULT 0 NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."LinkParameter" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."LinkType" (
    "Id" bigint NOT NULL,
    "Type" text,
    "IsDefault" boolean DEFAULT false NOT NULL,
    "Product_Id" bigint DEFAULT 0 NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."LinkType" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."NotificationEmail" (
    "Id" bigint NOT NULL,
    "Email" text
);

ALTER TABLE rvr_web_wzp_redirect."NotificationEmail" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."Parameter" (
    "Id" bigint NOT NULL,
    "Value" text,
    "Name_Id" bigint DEFAULT 0 NOT NULL,
    "Build_Id" bigint DEFAULT 0 NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."Parameter" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."ParameterName" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Product_Id" bigint DEFAULT 0 NOT NULL,
    "IsDefault" boolean DEFAULT false NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."ParameterName" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."Product" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Code" text,
    "IsDefault" boolean DEFAULT false NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."Product" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."ProductVersion" (
    "Id" bigint NOT NULL,
    "IsDefault" boolean DEFAULT false NOT NULL,
    "Version" text,
    "Product_Id" bigint DEFAULT 0 NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."ProductVersion" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."PurchaseSetting" (
    "Id" bigint NOT NULL,
    "PageTitle" text,
    "Height" integer DEFAULT 0 NOT NULL,
    "Width" integer DEFAULT 0 NOT NULL,
    "IsDefault" boolean DEFAULT false NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."PurchaseSetting" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."Setting" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Value" text
);

ALTER TABLE rvr_web_wzp_redirect."Setting" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."UnknownProduct" (
    "Id" bigint NOT NULL,
    "Code" text,
    "Url" text,
    "Date" timestamp without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."UnknownProduct" OWNER TO rvr_web_wzp_poweruser;

CREATE TABLE rvr_web_wzp_redirect."__MigrationHistory" (
    "MigrationId" character varying(150) DEFAULT ''::character varying NOT NULL,
    "ContextKey" character varying(300) DEFAULT ''::character varying NOT NULL,
    "Model" bytea DEFAULT '\x'::bytea NOT NULL,
    "ProductVersion" character varying(32) DEFAULT ''::character varying NOT NULL
);

ALTER TABLE rvr_web_wzp_redirect."__MigrationHistory" OWNER TO rvr_web_wzp_poweruser;
ALTER TABLE ONLY rvr_web_wzp_redirect."Build" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Build_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."Link" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Link_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."LinkType" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."LinkType_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."NotificationEmail" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."NotificationEmail_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."Parameter" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Parameter_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."ParameterName" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."ParameterName_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."Product" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Product_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."ProductVersion" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."ProductVersion_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."PurchaseSetting" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."PurchaseSetting_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."Setting" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."Setting_Id_seq"'::regclass);
ALTER TABLE ONLY rvr_web_wzp_redirect."UnknownProduct" ALTER COLUMN "Id" SET DEFAULT nextval('rvr_web_wzp_redirect."UnknownProduct_Id_seq"'::regclass);

ALTER TABLE ONLY rvr_web_wzp_redirect."Build"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Build" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."Link"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Link" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkParameter"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.LinkParameter" PRIMARY KEY ("Link_Id", "Parameter_Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkType"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.LinkType" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."NotificationEmail"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.NotificationEmail" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."Parameter"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Parameter" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."ParameterName"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.ParameterName" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."Product"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Product" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."ProductVersion"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.ProductVersion" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."PurchaseSetting"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.PurchaseSetting" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."Setting"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.Setting" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."UnknownProduct"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.UnknownProduct" PRIMARY KEY ("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."__MigrationHistory"
    ADD CONSTRAINT "PK_rvr_web_wzp_redirect.__MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey");

ALTER TABLE ONLY rvr_web_wzp_redirect."Build"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Build_rvr_web_wzp_redirect.ProductVersi" FOREIGN KEY ("ProductVersion_Id") REFERENCES rvr_web_wzp_redirect."ProductVersion"("Id") ON DELETE CASCADE;

ALTER TABLE ONLY rvr_web_wzp_redirect."Build"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Build_rvr_web_wzp_redirect.PurchaseSett" FOREIGN KEY ("PurchaseSetting_Id") REFERENCES rvr_web_wzp_redirect."PurchaseSetting"("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkParameter"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.LinkParameter_rvr_web_wzp_redirect.Link" FOREIGN KEY ("Link_Id") REFERENCES rvr_web_wzp_redirect."Link"("Id") ON DELETE CASCADE;

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkParameter"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.LinkParameter_rvr_web_wzp_redirect.Para" FOREIGN KEY ("Parameter_Id") REFERENCES rvr_web_wzp_redirect."Parameter"("Id") ON DELETE CASCADE;

ALTER TABLE ONLY rvr_web_wzp_redirect."LinkType"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.LinkType_rvr_web_wzp_redirect.Product_P" FOREIGN KEY ("Product_Id") REFERENCES rvr_web_wzp_redirect."Product"("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."Link"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Link_rvr_web_wzp_redirect.Build_Build_I" FOREIGN KEY ("Build_Id") REFERENCES rvr_web_wzp_redirect."Build"("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."Link"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Link_rvr_web_wzp_redirect.LinkType_Type" FOREIGN KEY ("Type_Id") REFERENCES rvr_web_wzp_redirect."LinkType"("Id") ON DELETE CASCADE;

ALTER TABLE ONLY rvr_web_wzp_redirect."ParameterName"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.ParameterName_rvr_web_wzp_redirect.Prod" FOREIGN KEY ("Product_Id") REFERENCES rvr_web_wzp_redirect."Product"("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."Parameter"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Parameter_rvr_web_wzp_redirect.Build_Bu" FOREIGN KEY ("Build_Id") REFERENCES rvr_web_wzp_redirect."Build"("Id");

ALTER TABLE ONLY rvr_web_wzp_redirect."Parameter"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.Parameter_rvr_web_wzp_redirect.Paramete" FOREIGN KEY ("Name_Id") REFERENCES rvr_web_wzp_redirect."ParameterName"("Id") ON DELETE CASCADE;

ALTER TABLE ONLY rvr_web_wzp_redirect."ProductVersion"
    ADD CONSTRAINT "FK_rvr_web_wzp_redirect.ProductVersion_rvr_web_wzp_redirect.Pro" FOREIGN KEY ("Product_Id") REFERENCES rvr_web_wzp_redirect."Product"("Id") ON DELETE CASCADE;
