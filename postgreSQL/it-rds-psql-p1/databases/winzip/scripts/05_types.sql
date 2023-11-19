--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE TYPE msghistoryandstats."enum_messageSnapshots_messageType" AS ENUM (
    'ipm',
    'iptn'
);

ALTER TYPE msghistoryandstats."enum_messageSnapshots_messageType" OWNER TO wz_history_admin;

CREATE TYPE msghistoryandstats."enum_messageSnapshots_osTypeMode" AS ENUM (
    'include',
    'exclude'
);

ALTER TYPE msghistoryandstats."enum_messageSnapshots_osTypeMode" OWNER TO wz_history_admin;

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodOriginIdsMode" AS ENUM (
    'include',
    'exclude'
);

ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodOriginIdsMode" OWNER TO wz_history_admin;

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodStatesMode" AS ENUM (
    'include',
    'exclude'
);

ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodStatesMode" OWNER TO wz_history_admin;

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodVendorIdsMode" AS ENUM (
    'include',
    'exclude'
);

ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodVendorIdsMode" OWNER TO wz_history_admin;

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseScope" AS ENUM (
    'PerUser',
    'PerMachine'
);

ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseScope" OWNER TO wz_history_admin;

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseType" AS ENUM (
    'Pro',
    'Enterprise',
    'Perpetual',
    'Subscription',
    'MSA Gold'
);

ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseType" OWNER TO wz_history_admin;

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmMode" AS ENUM (
    'trial',
    'registered'
);

ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmMode" OWNER TO wz_history_admin;
