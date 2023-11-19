--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE TABLE msghistoryandstats."averageAudience" (
    id integer NOT NULL,
    date timestamp with time zone,
    "prodCode" character varying(255),
    "checkType" character varying(255),
    count integer
);

ALTER TABLE msghistoryandstats."averageAudience" OWNER TO wz_history_admin;

CREATE TABLE msghistoryandstats.links (
    id integer NOT NULL,
    url character varying(512) NOT NULL
);

ALTER TABLE msghistoryandstats.links OWNER TO wz_history_admin;

CREATE TABLE msghistoryandstats."messageSnapshots" (
    id integer NOT NULL,
    "messageId" integer NOT NULL,
    "messageType" msghistoryandstats."enum_messageSnapshots_messageType" NOT NULL,
    "messageUpdatedAt" timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    "targetProduct" character varying(40) NOT NULL,
    "userType" character varying(15) NOT NULL,
    "activeDateStart" timestamp with time zone,
    "activeDateEnd" timestamp with time zone,
    "includeBuildIDs" character varying(25)[],
    "excludeBuildIDs" character varying(25)[],
    "includeUIDs" character varying(40)[],
    "checkTypes" character varying(255)[],
    frequency character varying(15) NOT NULL,
    "minEngineVersion" character varying(20),
    "maxEngineVersion" character varying(20),
    "productOwnerships" json,
    "installedProducts" json,
    "daysInstallFrom" integer,
    "daysInstallTo" integer,
    "licenseExpiryFrom" integer,
    "licenseExpiryTo" integer,
    "countryCodes" character varying(3)[],
    "languageCodes" character varying(7)[],
    title character varying(255) NOT NULL,
    t character varying(255),
    "daysRemainingTo" integer,
    "daysRemainingFrom" integer,
    "osTypeMode" msghistoryandstats."enum_messageSnapshots_osTypeMode",
    "osTypeValue" character varying(30),
    "prodStatesMode" msghistoryandstats."enum_messageSnapshots_prodStatesMode",
    "prodStatesValue" character varying(10),
    "prodVendorIdsMode" msghistoryandstats."enum_messageSnapshots_prodVendorIdsMode",
    "prodVendorIdsValue" character varying(255),
    "prodOriginIdsMode" msghistoryandstats."enum_messageSnapshots_prodOriginIdsMode",
    "prodOriginIdsValue" character varying(255),
    "daysSinceActivationFrom" integer,
    "daysSinceActivationTo" integer,
    "pirateStatesValue" character varying(10)
);

ALTER TABLE msghistoryandstats."messageSnapshots" OWNER TO wz_history_admin;

CREATE TABLE msghistoryandstats."messagesHistory" (
    id integer NOT NULL,
    "requestDate" timestamp with time zone NOT NULL,
    json jsonb,
    "userDataSnapshotId" integer NOT NULL,
    "ipmSnapshotId" integer,
    "ipmResponseLinkId" integer,
    "iptnSnapshotId" integer,
    "iptnResponseLinkId" integer
);

ALTER TABLE msghistoryandstats."messagesHistory" OWNER TO wz_history_admin;

CREATE TABLE msghistoryandstats."messagesHistoryShortTerm" (
    id integer NOT NULL,
    "requestDate" timestamp with time zone NOT NULL,
    json jsonb,
    "userDataSnapshotId" integer NOT NULL,
    "ipmSnapshotId" integer,
    "ipmResponseLinkId" integer,
    "iptnSnapshotId" integer,
    "iptnResponseLinkId" integer
);

ALTER TABLE msghistoryandstats."messagesHistoryShortTerm" OWNER TO wz_history_admin;


CREATE TABLE msghistoryandstats."messagesSendingStats" (
    id integer NOT NULL,
    date date NOT NULL,
    "messageId" integer NOT NULL,
    "messageType" text NOT NULL,
    "uniqRecipientsNumber" integer NOT NULL,
    "totalSendsNumber" integer NOT NULL
);

ALTER TABLE msghistoryandstats."messagesSendingStats" OWNER TO wz_history_admin;

CREATE TABLE msghistoryandstats."messagesVolume" (
    id integer NOT NULL,
    date timestamp with time zone,
    type character varying(255),
    count integer
);

ALTER TABLE msghistoryandstats."messagesVolume" OWNER TO wz_history_admin;

CREATE TABLE msghistoryandstats."potentialUsersStatsSrc" (
    id integer NOT NULL,
    "requestDate" timestamp with time zone NOT NULL,
    "userUid" character varying(40) NOT NULL,
    "countryCode" character varying(3),
    "languageCode" character varying(12) NOT NULL,
    "installedProductCodes" jsonb,
    "userOwnership" jsonb,
    "productCode" character varying(15) NOT NULL,
    version character varying(15),
    "buildId" integer,
    "licStatus" character varying(10),
    "daysToLicExpire" integer,
    dsi integer NOT NULL,
    "checkType" character varying(255)
);

ALTER TABLE msghistoryandstats."potentialUsersStatsSrc" OWNER TO wz_history_admin;

CREATE TABLE msghistoryandstats."topMsgs" (
    id integer NOT NULL,
    date timestamp with time zone,
    "messageId" integer,
    name character varying(255),
    count integer,
    type character varying(255)
);

ALTER TABLE msghistoryandstats."topMsgs" OWNER TO wz_history_admin;

CREATE TABLE msghistoryandstats."userDataSnapshots" (
    id integer NOT NULL,
    hash character varying(255) NOT NULL,
    "userUid" character varying(40) NOT NULL,
    "prevUserUid" character varying(40),
    "countryCode" character varying(3),
    "languageCode" character varying(12) NOT NULL,
    "installedProductCodes" character varying(20)[],
    "userOwnership" character varying(30)[],
    "productCode" character varying(13) NOT NULL,
    version character varying(20) NOT NULL,
    "buildId" character varying(25) NOT NULL,
    "licenseCode" character varying(45) NOT NULL,
    "checkType" character varying(255),
    r character varying(255),
    os character varying(10),
    "wziProductState" integer,
    "wziProductVendorID" character varying(100),
    "wziProductOriginID" character varying(10),
    "wziLicenseHolder" character varying(120),
    "wziLicenseKey" character varying(40),
    "wziLicenseState" character varying(1),
    "mmclientId" character varying(40),
    "mmMode" msghistoryandstats."enum_userDataSnapshots_mmMode",
    "mmLicenseType" msghistoryandstats."enum_userDataSnapshots_mmLicenseType",
    "mmLicenseScope" msghistoryandstats."enum_userDataSnapshots_mmLicenseScope"
);

ALTER TABLE msghistoryandstats."userDataSnapshots" OWNER TO wz_history_admin;

ALTER TABLE ONLY msghistoryandstats."averageAudience" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."averageAudience_id_seq"'::regclass);
ALTER TABLE ONLY msghistoryandstats.links ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats.links_id_seq'::regclass);
ALTER TABLE ONLY msghistoryandstats."messageSnapshots" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messageSnapshots_id_seq"'::regclass);
ALTER TABLE ONLY msghistoryandstats."messagesHistory" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesHistory_id_seq"'::regclass);
ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesHistoryShortTerm_id_seq"'::regclass);
ALTER TABLE ONLY msghistoryandstats."messagesSendingStats" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesSendingStats_id_seq"'::regclass);
ALTER TABLE ONLY msghistoryandstats."messagesVolume" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesVolume_id_seq"'::regclass);
ALTER TABLE ONLY msghistoryandstats."potentialUsersStatsSrc" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."potentialUsersStatsSrc_id_seq"'::regclass);
ALTER TABLE ONLY msghistoryandstats."topMsgs" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."topMsgs_id_seq"'::regclass);
ALTER TABLE ONLY msghistoryandstats."userDataSnapshots" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."userDataSnapshots_id_seq"'::regclass);

ALTER TABLE ONLY msghistoryandstats."averageAudience"
    ADD CONSTRAINT "averageAudience_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."messageSnapshots"
    ADD CONSTRAINT "messageSnapshots_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."messagesSendingStats"
    ADD CONSTRAINT "messagesSendingStats_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."messagesVolume"
    ADD CONSTRAINT "messagesVolume_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."potentialUsersStatsSrc"
    ADD CONSTRAINT "potentialUsersStatsSrc_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."topMsgs"
    ADD CONSTRAINT "topMsgs_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."userDataSnapshots"
    ADD CONSTRAINT "userDataSnapshots_pkey" PRIMARY KEY (id);

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_ipmResponseLinkId_fkey" FOREIGN KEY ("ipmResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_ipmSnapshotId_fkey" FOREIGN KEY ("ipmSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_iptnResponseLinkId_fkey" FOREIGN KEY ("iptnResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_iptnSnapshotId_fkey" FOREIGN KEY ("iptnSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_userDataSnapshotId_fkey" FOREIGN KEY ("userDataSnapshotId") REFERENCES msghistoryandstats."userDataSnapshots"(id) ON UPDATE CASCADE;

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_ipmResponseLinkId_fkey" FOREIGN KEY ("ipmResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_ipmSnapshotId_fkey" FOREIGN KEY ("ipmSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_iptnResponseLinkId_fkey" FOREIGN KEY ("iptnResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_iptnSnapshotId_fkey" FOREIGN KEY ("iptnSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_userDataSnapshotId_fkey" FOREIGN KEY ("userDataSnapshotId") REFERENCES msghistoryandstats."userDataSnapshots"(id) ON UPDATE CASCADE;


