--
-- PostgreSQL database dump
--

-- Dumped from database version 11.19
-- Dumped by pg_dump version 16.1


\connect winzip

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
-- Name: msghistoryandstats; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA msghistoryandstats;


ALTER SCHEMA msghistoryandstats OWNER TO itadmin;

--
-- Name: enum_messageSnapshots_messageType; Type: TYPE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_messageType" AS ENUM (
    'ipm',
    'iptn'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_messageType" OWNER TO wz_history_admin;

--
-- Name: enum_messageSnapshots_osTypeMode; Type: TYPE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_osTypeMode" AS ENUM (
    'include',
    'exclude'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_osTypeMode" OWNER TO wz_history_admin;

--
-- Name: enum_messageSnapshots_prodOriginIdsMode; Type: TYPE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodOriginIdsMode" AS ENUM (
    'include',
    'exclude'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodOriginIdsMode" OWNER TO wz_history_admin;

--
-- Name: enum_messageSnapshots_prodStatesMode; Type: TYPE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodStatesMode" AS ENUM (
    'include',
    'exclude'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodStatesMode" OWNER TO wz_history_admin;

--
-- Name: enum_messageSnapshots_prodVendorIdsMode; Type: TYPE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodVendorIdsMode" AS ENUM (
    'include',
    'exclude'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodVendorIdsMode" OWNER TO wz_history_admin;

--
-- Name: enum_userDataSnapshots_mmLicenseScope; Type: TYPE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseScope" AS ENUM (
    'PerUser',
    'PerMachine'
);


ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseScope" OWNER TO wz_history_admin;

--
-- Name: enum_userDataSnapshots_mmLicenseType; Type: TYPE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseType" AS ENUM (
    'Pro',
    'Enterprise',
    'Perpetual',
    'Subscription',
    'MSA Gold'
);


ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseType" OWNER TO wz_history_admin;

--
-- Name: enum_userDataSnapshots_mmMode; Type: TYPE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmMode" AS ENUM (
    'trial',
    'registered'
);


ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmMode" OWNER TO wz_history_admin;

--
-- Name: fill_average_audience_table(integer); Type: FUNCTION; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE FUNCTION msghistoryandstats.fill_average_audience_table(days_offset integer DEFAULT 0) RETURNS void
    LANGUAGE plpgsql STRICT
    AS $$
  DECLARE
  
  have_previous_day_data int;
  max_time_data_store CONSTANT int := 30;
  min_days_offset CONSTANT int := 0;
  max_days_offset CONSTANT int := 6; --it’s offset which using with default logic. By defualt we get stastics for 1 previous day. 1 day by default + 6 days of offset = 7 days
  
  BEGIN
  
  -- init validate variable 
  SELECT COUNT(*) 
  INTO have_previous_day_data
  FROM msghistoryandstats."averageAudience"
  WHERE date = timezone('UTC',date_trunc('day', timezone('UTC', now()))) - INTERVAL '1 day' - (days_offset || ' day')::INTERVAL
  LIMIT 1;
  
  -- validate useless select
  IF have_previous_day_data > 0 THEN
  RAISE EXCEPTION 'Data for previous % day(s) already stored', days_offset + 1 ;
  END IF;
  -- validate function input parameters
  IF days_offset < min_days_offset OR days_offset > max_days_offset THEN
    RAISE EXCEPTION 'Invalid days offset value. It should be in interval: [%, %]', min_days_offset, max_days_offset;
  END IF;
  -- remove obsolete data
  DELETE from msghistoryandstats."averageAudience"
  WHERE date < timezone('UTC',date_trunc('day', timezone('UTC', now()) - (max_time_data_store || ' day')::INTERVAL)) ;
   
  -- fill table with new data for specified time period
    INSERT INTO msghistoryandstats."averageAudience" ("date", "prodCode", "checkType", "count")
      
    SELECT
      
  timezone('UTC',date_trunc('day',timezone('UTC', now()) - INTERVAL '1 day' - (days_offset || ' day')::INTERVAL)) 
   ,pc
   ,check_type
   ,count(*)
  FROM (
    SELECT
      DISTINCT
        mh.json::json#>>'{request,application,prodCode}' as pc
      ,mh.json::json#>>'{request,application,uid}'
      ,mh.json::json#>>'{request,application,checkType}' as check_type
    FROM msghistoryandstats."messagesHistoryShortTerm" mh
    WHERE 
      (mh."ipmSnapshotId" IS NOT NULL or mh."iptnSnapshotId" IS NOT NULL) 
      AND mh."requestDate" BETWEEN timezone('UTC',date_trunc('day',timezone('UTC', now()) - INTERVAL '1 day' - (days_offset || ' day')::INTERVAL))  
      AND timezone('UTC',date_trunc('day',timezone('UTC', now()) - (days_offset || ' day')::INTERVAL)) - INTERVAL '1 second'
    ) AS fs
  GROUP BY 2,3;
  
  END;
  $$;


ALTER FUNCTION msghistoryandstats.fill_average_audience_table(days_offset integer) OWNER TO wz_history_admin;

--
-- Name: fill_messages_volume_table(integer); Type: FUNCTION; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE FUNCTION msghistoryandstats.fill_messages_volume_table(hours_offset integer DEFAULT 0) RETURNS void
    LANGUAGE plpgsql STRICT
    AS $$
  DECLARE
  
  have_previous_hours_data int;
  max_time_data_store CONSTANT int := 30; 
  min_hours_offset CONSTANT int := 0;
  max_hours_offset CONSTANT int := 167; --it’s offset which using with default logic. By defualt we get stastics for 1 previous hour. 1 hour by default + 167 hours of offset = 168 hours = 7 days
  
  BEGIN
  
  -- init validate variable 
  SELECT COUNT(*) 
  INTO have_previous_hours_data
  FROM msghistoryandstats."messagesVolume"
  WHERE date = timezone('UTC',date_trunc('hour', timezone('UTC', now()) - (hours_offset || ' hour')::INTERVAL))
  LIMIT 1;
  
  -- validate useless select
  IF have_previous_hours_data > 0 THEN
  RAISE EXCEPTION 'Data (message volume) for previous % hour already stored', hours_offset;
  END IF;
  -- validate function input parameters
  IF hours_offset < min_hours_offset OR hours_offset > max_hours_offset THEN
  RAISE EXCEPTION 'Invalid hours offset value. It should be in interval: [%, %]', min_hours_offset, max_hours_offset;
  END IF;
  
  -- remove obsolete data
  DELETE from msghistoryandstats."messagesVolume"
  WHERE date < timezone('UTC',date_trunc('day', timezone('UTC', now()) - (max_time_data_store || ' day')::INTERVAL));
   
  -- fill table with new data for specified time period
    INSERT INTO msghistoryandstats."messagesVolume" ("date", "type", "count")
      
  SELECT  
    timezone('UTC',date_trunc('hour',timezone('UTC', now()) - (hours_offset || ' hour')::INTERVAL))
    ,'ipm' AS TEXT 
    ,Count(*)
  
  FROM msghistoryandstats."messagesHistoryShortTerm" mh
  WHERE 
    "ipmSnapshotId" IS NOT NULL
    AND mh."requestDate" BETWEEN timezone('UTC',date_trunc('hour',timezone('UTC', now()) - INTERVAL '1 hour' - (hours_offset || ' hour')::INTERVAL))  
    AND timezone('UTC',date_trunc('hour',timezone('UTC', now()) - (hours_offset || ' hour')::INTERVAL)) - INTERVAL '1 second'
  
  UNION 
   
  SELECT
    timezone('UTC',date_trunc('hour',timezone('UTC', now()) - (hours_offset || ' hour')::INTERVAL))
    ,'iptn' AS TEXT
    ,Count(*)
  
  FROM msghistoryandstats."messagesHistoryShortTerm" mh
  WHERE
    "iptnSnapshotId" IS NOT NULL
    AND mh."requestDate" BETWEEN timezone('UTC',date_trunc('hour',timezone('UTC', now()) - INTERVAL '1 hour' - (hours_offset || ' hour')::INTERVAL))  
    AND timezone('UTC',date_trunc('hour',timezone('UTC', now()) - (hours_offset || ' hour')::INTERVAL)) - INTERVAL '1 second';
  END;
  $$;


ALTER FUNCTION msghistoryandstats.fill_messages_volume_table(hours_offset integer) OWNER TO wz_history_admin;

--
-- Name: fill_msg_sending_stats_table(integer); Type: FUNCTION; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE FUNCTION msghistoryandstats.fill_msg_sending_stats_table(days_number integer DEFAULT 1) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $$
  DECLARE
    min_days_number CONSTANT int := 1;
    max_days_number CONSTANT int := 365;
    tomorrow date := now() at time zone 'UTC' + INTERVAL '1 DAY';
    date_from date := tomorrow - days_number;
    date_to date := tomorrow - 1;
    result_rows_count int;
  BEGIN
    -- validate function input parameters
    IF days_number < min_days_number OR days_number > max_days_number THEN
      RAISE EXCEPTION 'Invalid days number value. It should be in interval: [%, %]', min_days_number, max_days_number;
    END IF;
    
    -- remove obsolete data
    DELETE FROM msghistoryandstats."messagesSendingStats"
    WHERE "date" >= date_from;
    
    -- fill table with new data for specified time period
    INSERT INTO msghistoryandstats."messagesSendingStats" (
      "date",
      "messageId",
      "messageType",
      "uniqRecipientsNumber",
      "totalSendsNumber"
    )
    -- table with IPMs sending statistics
    SELECT
      urn."date",
      urn."messageId",
      'ipm' "messageType",
      "uniqRecipientsNumber",
      "totalSendsNumber"
    FROM ( -- table with messages unique recipients number
      SELECT
        "date",
        "messageId",
        count(*) "uniqRecipientsNumber"
      FROM (
        SELECT DISTINCT
          date(h."requestDate"),
          h."json" #>> '{ request,application,uid }',
          s."messageId"
        FROM msghistoryandstats."messagesHistoryShortTerm" h
        JOIN msghistoryandstats."messageSnapshots" s ON h."ipmSnapshotId" = s.id
        WHERE date(h."requestDate") BETWEEN date_from AND date_to
      ) uniq -- triplets (date, userUid, messageId)
      GROUP BY "date", "messageId"
    ) urn
    JOIN ( -- table with messages total sends number
      SELECT
        date(h."requestDate"),
        s."messageId",
        count(*) "totalSendsNumber"
      FROM msghistoryandstats."messagesHistoryShortTerm" h
      JOIN msghistoryandstats."messageSnapshots" s ON h."ipmSnapshotId" = s.id
      WHERE date(h."requestDate") BETWEEN date_from AND date_to
      GROUP BY date(h."requestDate"), s."messageId"
    ) tsn
    ON
      urn."date" = tsn."date" AND
      urn."messageId" = tsn."messageId"

    UNION

    -- table with IPTNs sending statistics
    SELECT
      urn."date",
      urn."messageId",
      'iptn' "messageType",
      "uniqRecipientsNumber",
      "totalSendsNumber"
    FROM ( -- table with messages unique recipients number
      SELECT
        "date",
        "messageId",
        count(*) "uniqRecipientsNumber"
      FROM (
        SELECT DISTINCT
          date(h."requestDate"),
          h."json" #>> '{ request,application,uid }',
          s."messageId"
        FROM msghistoryandstats."messagesHistoryShortTerm" h
        JOIN msghistoryandstats."messageSnapshots" s ON h."iptnSnapshotId" = s.id
        WHERE date(h."requestDate") BETWEEN date_from AND date_to
      ) uniq -- triplets (date, userUid, messageId)
      GROUP BY "date", "messageId"
    ) urn
    JOIN ( -- table with messages total sends number
      SELECT
        date(h."requestDate"),
        s."messageId",
        count(*) "totalSendsNumber"
      FROM msghistoryandstats."messagesHistoryShortTerm" h
      JOIN msghistoryandstats."messageSnapshots" s ON h."iptnSnapshotId" = s.id
      WHERE date(h."requestDate") BETWEEN date_from AND date_to
      GROUP BY date(h."requestDate"), s."messageId"
    ) tsn
    ON
      urn."date" = tsn."date" AND
      urn."messageId" = tsn."messageId"

    ORDER BY "date", "messageType", "messageId";

    -- get inserted rows number
    GET DIAGNOSTICS result_rows_count := ROW_COUNT;
    RETURN result_rows_count;
  END;
  $$;


ALTER FUNCTION msghistoryandstats.fill_msg_sending_stats_table(days_number integer) OWNER TO wz_history_admin;

--
-- Name: fill_p_usr_stats_src_table(integer, integer); Type: FUNCTION; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE FUNCTION msghistoryandstats.fill_p_usr_stats_src_table(days_number integer DEFAULT 1, offset_number integer DEFAULT 0) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  min_days_number CONSTANT int := 1;
  max_days_number CONSTANT int := 365;
  today date := now() at time zone 'UTC';
  result_rows_count int;
  insert_limit int := 100000; -- Change also "POTENTIAL_INSERT_BATCH_LIMIT" constant in analytics.js
BEGIN
  -- validate function input parameters
  IF days_number < min_days_number OR days_number > max_days_number THEN
    RAISE EXCEPTION 'Invalid days number value. It should be in interval: [%, %]', min_days_number, max_days_number;
  END IF;

  -- fill table with new data for specified time period
  INSERT INTO msghistoryandstats."potentialUsersStatsSrc" (
      "requestDate",
      "userUid",
      "countryCode",
      "languageCode",
      "installedProductCodes",
      "userOwnership",
      "productCode",
      "version",
      "buildId",
      "licStatus",
      "daysToLicExpire",
      "dsi",
      "checkType"
    )
    SELECT
      h."requestDate",
      h."json" #>> '{ request,application,uid }',
      h."json" #>> '{ parsedOptions,countryCode }',
      h."json" #>> '{ request,application,language }',
      h."json" #> '{ request,installed }',
      h."json" #> '{ parsedOptions,userOwnership }',
      h."json" #>> '{ request,application,prodCode }',
      h."json" #>> '{ request,application,version }',
      substring(h."json" #>> '{ request,application,buildId }' from '\d+')::int,
      CASE WHEN (h."json" #>> '{ parsedOptions,daysToLicExpire }')::int <= (today - h."requestDate"::date)
        THEN 'EXPIRED' 
        ELSE h."json" #>> '{ parsedOptions,licStatus }' 
      END,
      (h."json" #>> '{ parsedOptions,daysToLicExpire }')::int - (today - h."requestDate"::date),
      COALESCE((h."json" #>> '{ request,application,dsi }')::int, 0) + (today - h."requestDate"::date),
      h."json" #>> '{ request,application,checkType }'
    FROM msghistoryandstats."messagesHistoryShortTerm" AS h
    JOIN (
      SELECT
        MAX(h."requestDate") AS "lastRequestDate",
        h."json" #>> '{ request,application,uid }' AS "uid",
        h."json" #>> '{ request,application,prodCode }' as "productCode"
      FROM msghistoryandstats."messagesHistoryShortTerm" AS h
      WHERE h."requestDate" >= today - days_number
      GROUP BY h."json" #>> '{ request,application,uid }', h."json" #>> '{ request,application,prodCode }'
    ) AS core ON
    core."lastRequestDate" = h."requestDate" AND
    core."uid" = h."json" #>> '{ request,application,uid }' AND
    core."productCode" = h."json" #>> '{ request,application,prodCode }'
    limit insert_limit
    offset offset_number;

  -- get rows count of the filled table
  GET DIAGNOSTICS result_rows_count := ROW_COUNT;
  RETURN result_rows_count;
END;
$$;


ALTER FUNCTION msghistoryandstats.fill_p_usr_stats_src_table(days_number integer, offset_number integer) OWNER TO wz_history_admin;

--
-- Name: fill_top_msgs_table(); Type: FUNCTION; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE FUNCTION msghistoryandstats.fill_top_msgs_table() RETURNS void
    LANGUAGE plpgsql STRICT
    AS $$
  DECLARE
  
  have_previous_day_data int;
  max_time_data_store CONSTANT int := 30; 
  BEGIN
  
  -- init validate variable 
  SELECT count(*) 
  INTO have_previous_day_data
  FROM msghistoryandstats."topMsgs"
  WHERE date = timezone('UTC',date_trunc('day', timezone('UTC', now()))) - INTERVAL '1 day'
  LIMIT 1;
  
  
  -- validate useless select
  IF have_previous_day_data > 0 THEN
  RAISE EXCEPTION 'Data for previous day already stored';
  END IF;
  
  -- remove obsolete data
  DELETE from msghistoryandstats."topMsgs"
  WHERE date < timezone('UTC',date_trunc('day', timezone('UTC', now()) - (max_time_data_store || ' day')::INTERVAL)) ;
   
  -- fill table with new data for specified time period
    INSERT INTO msghistoryandstats."topMsgs" ("date", "messageId", "name", "count", "type")
      
  SELECT
    timezone('UTC', date_trunc('day',timezone('UTC', now()) - INTERVAL '1 day'))
    ,ms_ipm."messageId"
    ,ms_ipm.name
    ,count(*) AS "count"
    ,'ipm' AS text
  
  FROM msghistoryandstats."messagesHistoryShortTerm" mh
  JOIN msghistoryandstats."messageSnapshots" ms_ipm ON ms_ipm.id= mh."ipmSnapshotId"
  
  WHERE mh."requestDate" BETWEEN timezone('UTC',date_trunc('day',timezone('UTC', now()) - INTERVAL '1 day'))  
  AND timezone('UTC',date_trunc('day',timezone('UTC', now()))) - INTERVAL '1 second'
    AND mh."ipmSnapshotId" IS NOT NULL
   
  GROUP BY 2,3
  ORDER BY 4
  DESC
  LIMIT 10;
  
  -- fill table with new data for specified time period
    INSERT INTO msghistoryandstats."topMsgs" ("date", "messageId", "name", "count", "type")
  SELECT
        timezone('UTC', date_trunc('day',timezone('UTC', now()) - INTERVAL '1 day'))
        ,ms_ipm."messageId"
        ,ms_ipm.name
        ,count(*) AS "count"
        ,'iptn' AS text
        
  FROM msghistoryandstats."messagesHistoryShortTerm" mh
  JOIN msghistoryandstats."messageSnapshots" ms_ipm on ms_ipm.id= mh."iptnSnapshotId"
  
  WHERE mh."requestDate" BETWEEN timezone('UTC',date_trunc('day',timezone('UTC', now()) - INTERVAL '1 day'))  
  AND timezone('UTC',date_trunc('day',timezone('UTC', now()))) - INTERVAL '1 second'
  AND mh."iptnSnapshotId" IS NOT NULL
   
  GROUP BY 2,3
  ORDER BY 4
  DESC
  LIMIT 10;
  
  
  
  END;
  $$;


ALTER FUNCTION msghistoryandstats.fill_top_msgs_table() OWNER TO wz_history_admin;

SET default_tablespace = '';

--
-- Name: averageAudience; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TABLE msghistoryandstats."averageAudience" (
    id integer NOT NULL,
    date timestamp with time zone,
    "prodCode" character varying(255),
    "checkType" character varying(255),
    count integer
);


ALTER TABLE msghistoryandstats."averageAudience" OWNER TO wz_history_admin;

--
-- Name: averageAudience_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."averageAudience_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."averageAudience_id_seq" OWNER TO wz_history_admin;

--
-- Name: averageAudience_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."averageAudience_id_seq" OWNED BY msghistoryandstats."averageAudience".id;


--
-- Name: links; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TABLE msghistoryandstats.links (
    id integer NOT NULL,
    url character varying(512) NOT NULL
);


ALTER TABLE msghistoryandstats.links OWNER TO wz_history_admin;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats.links_id_seq OWNER TO wz_history_admin;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats.links_id_seq OWNED BY msghistoryandstats.links.id;


--
-- Name: messageSnapshots; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

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

--
-- Name: messageSnapshots_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."messageSnapshots_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messageSnapshots_id_seq" OWNER TO wz_history_admin;

--
-- Name: messageSnapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."messageSnapshots_id_seq" OWNED BY msghistoryandstats."messageSnapshots".id;


--
-- Name: messagesHistory; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

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

--
-- Name: messagesHistoryShortTerm; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

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

--
-- Name: messagesHistoryShortTerm_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" OWNER TO wz_history_admin;

--
-- Name: messagesHistoryShortTerm_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" OWNED BY msghistoryandstats."messagesHistoryShortTerm".id;


--
-- Name: messagesHistory_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."messagesHistory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messagesHistory_id_seq" OWNER TO wz_history_admin;

--
-- Name: messagesHistory_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."messagesHistory_id_seq" OWNED BY msghistoryandstats."messagesHistory".id;


--
-- Name: messagesSendingStats; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TABLE msghistoryandstats."messagesSendingStats" (
    id integer NOT NULL,
    date date NOT NULL,
    "messageId" integer NOT NULL,
    "messageType" text NOT NULL,
    "uniqRecipientsNumber" integer NOT NULL,
    "totalSendsNumber" integer NOT NULL
);


ALTER TABLE msghistoryandstats."messagesSendingStats" OWNER TO wz_history_admin;

--
-- Name: messagesSendingStats_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."messagesSendingStats_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" OWNER TO wz_history_admin;

--
-- Name: messagesSendingStats_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" OWNED BY msghistoryandstats."messagesSendingStats".id;


--
-- Name: messagesVolume; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TABLE msghistoryandstats."messagesVolume" (
    id integer NOT NULL,
    date timestamp with time zone,
    type character varying(255),
    count integer
);


ALTER TABLE msghistoryandstats."messagesVolume" OWNER TO wz_history_admin;

--
-- Name: messagesVolume_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."messagesVolume_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messagesVolume_id_seq" OWNER TO wz_history_admin;

--
-- Name: messagesVolume_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."messagesVolume_id_seq" OWNED BY msghistoryandstats."messagesVolume".id;


--
-- Name: potentialUsersStatsSrc; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

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

--
-- Name: potentialUsersStatsSrc_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" OWNER TO wz_history_admin;

--
-- Name: potentialUsersStatsSrc_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" OWNED BY msghistoryandstats."potentialUsersStatsSrc".id;


--
-- Name: topMsgs; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE TABLE msghistoryandstats."topMsgs" (
    id integer NOT NULL,
    date timestamp with time zone,
    "messageId" integer,
    name character varying(255),
    count integer,
    type character varying(255)
);


ALTER TABLE msghistoryandstats."topMsgs" OWNER TO wz_history_admin;

--
-- Name: topMsgs_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."topMsgs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."topMsgs_id_seq" OWNER TO wz_history_admin;

--
-- Name: topMsgs_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."topMsgs_id_seq" OWNED BY msghistoryandstats."topMsgs".id;


--
-- Name: userDataSnapshots; Type: TABLE; Schema: msghistoryandstats; Owner: wz_history_admin
--

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

--
-- Name: userDataSnapshots_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE SEQUENCE msghistoryandstats."userDataSnapshots_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" OWNER TO wz_history_admin;

--
-- Name: userDataSnapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" OWNED BY msghistoryandstats."userDataSnapshots".id;


--
-- Name: averageAudience id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."averageAudience" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."averageAudience_id_seq"'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats.links ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats.links_id_seq'::regclass);


--
-- Name: messageSnapshots id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messageSnapshots" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messageSnapshots_id_seq"'::regclass);


--
-- Name: messagesHistory id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesHistory_id_seq"'::regclass);


--
-- Name: messagesHistoryShortTerm id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesHistoryShortTerm_id_seq"'::regclass);


--
-- Name: messagesSendingStats id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesSendingStats" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesSendingStats_id_seq"'::regclass);


--
-- Name: messagesVolume id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesVolume" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesVolume_id_seq"'::regclass);


--
-- Name: potentialUsersStatsSrc id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."potentialUsersStatsSrc" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."potentialUsersStatsSrc_id_seq"'::regclass);


--
-- Name: topMsgs id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."topMsgs" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."topMsgs_id_seq"'::regclass);


--
-- Name: userDataSnapshots id; Type: DEFAULT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."userDataSnapshots" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."userDataSnapshots_id_seq"'::regclass);


--
-- Name: averageAudience averageAudience_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."averageAudience"
    ADD CONSTRAINT "averageAudience_pkey" PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: messageSnapshots messageSnapshots_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messageSnapshots"
    ADD CONSTRAINT "messageSnapshots_pkey" PRIMARY KEY (id);


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_pkey" PRIMARY KEY (id);


--
-- Name: messagesHistory messagesHistory_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_pkey" PRIMARY KEY (id);


--
-- Name: messagesSendingStats messagesSendingStats_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesSendingStats"
    ADD CONSTRAINT "messagesSendingStats_pkey" PRIMARY KEY (id);


--
-- Name: messagesVolume messagesVolume_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesVolume"
    ADD CONSTRAINT "messagesVolume_pkey" PRIMARY KEY (id);


--
-- Name: potentialUsersStatsSrc potentialUsersStatsSrc_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."potentialUsersStatsSrc"
    ADD CONSTRAINT "potentialUsersStatsSrc_pkey" PRIMARY KEY (id);


--
-- Name: topMsgs topMsgs_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."topMsgs"
    ADD CONSTRAINT "topMsgs_pkey" PRIMARY KEY (id);


--
-- Name: userDataSnapshots userDataSnapshots_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."userDataSnapshots"
    ADD CONSTRAINT "userDataSnapshots_pkey" PRIMARY KEY (id);


--
-- Name: messages_history_request_date; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX messages_history_request_date ON msghistoryandstats."messagesHistory" USING btree ("requestDate");


--
-- Name: messages_history_short_term_prodCode; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX "messages_history_short_term_prodCode" ON msghistoryandstats."messagesHistoryShortTerm" USING gin (((json #> '{request,application,prodCode}'::text[])));


--
-- Name: messages_history_short_term_request_date; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX messages_history_short_term_request_date ON msghistoryandstats."messagesHistoryShortTerm" USING btree ("requestDate");


--
-- Name: messages_history_short_term_uid; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX messages_history_short_term_uid ON msghistoryandstats."messagesHistoryShortTerm" USING gin (((json #> '{request,application,uid}'::text[])));


--
-- Name: messages_sending_stats_date; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX messages_sending_stats_date ON msghistoryandstats."messagesSendingStats" USING btree (date);


--
-- Name: messages_sending_stats_message_id; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX messages_sending_stats_message_id ON msghistoryandstats."messagesSendingStats" USING btree ("messageId");


--
-- Name: messages_sending_stats_message_type; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX messages_sending_stats_message_type ON msghistoryandstats."messagesSendingStats" USING btree ("messageType");


--
-- Name: potential_users_stats_src_build_id; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_build_id ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("buildId");


--
-- Name: potential_users_stats_src_check_type; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_check_type ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("checkType");


--
-- Name: potential_users_stats_src_country_code; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_country_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("countryCode");


--
-- Name: potential_users_stats_src_days_to_lic_expire; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_days_to_lic_expire ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("daysToLicExpire");


--
-- Name: potential_users_stats_src_dsi; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_dsi ON msghistoryandstats."potentialUsersStatsSrc" USING btree (dsi);


--
-- Name: potential_users_stats_src_installed_product_codes; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_installed_product_codes ON msghistoryandstats."potentialUsersStatsSrc" USING gin ("installedProductCodes");


--
-- Name: potential_users_stats_src_language_code; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_language_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("languageCode");


--
-- Name: potential_users_stats_src_lic_status; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_lic_status ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("licStatus");


--
-- Name: potential_users_stats_src_product_code; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_product_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("productCode");


--
-- Name: potential_users_stats_src_user_ownership; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_user_ownership ON msghistoryandstats."potentialUsersStatsSrc" USING gin ("userOwnership");


--
-- Name: potential_users_stats_src_user_uid; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_user_uid ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("userUid");


--
-- Name: potential_users_stats_src_version; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE INDEX potential_users_stats_src_version ON msghistoryandstats."potentialUsersStatsSrc" USING btree (version);


--
-- Name: user_data_snapshots_hash; Type: INDEX; Schema: msghistoryandstats; Owner: wz_history_admin
--

CREATE UNIQUE INDEX user_data_snapshots_hash ON msghistoryandstats."userDataSnapshots" USING btree (hash);


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_ipmResponseLinkId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_ipmResponseLinkId_fkey" FOREIGN KEY ("ipmResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_ipmSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_ipmSnapshotId_fkey" FOREIGN KEY ("ipmSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_iptnResponseLinkId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_iptnResponseLinkId_fkey" FOREIGN KEY ("iptnResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_iptnSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_iptnSnapshotId_fkey" FOREIGN KEY ("iptnSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_userDataSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_userDataSnapshotId_fkey" FOREIGN KEY ("userDataSnapshotId") REFERENCES msghistoryandstats."userDataSnapshots"(id) ON UPDATE CASCADE;


--
-- Name: messagesHistory messagesHistory_ipmResponseLinkId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_ipmResponseLinkId_fkey" FOREIGN KEY ("ipmResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistory messagesHistory_ipmSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_ipmSnapshotId_fkey" FOREIGN KEY ("ipmSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistory messagesHistory_iptnResponseLinkId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_iptnResponseLinkId_fkey" FOREIGN KEY ("iptnResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistory messagesHistory_iptnSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_iptnSnapshotId_fkey" FOREIGN KEY ("iptnSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistory messagesHistory_userDataSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: wz_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_userDataSnapshotId_fkey" FOREIGN KEY ("userDataSnapshotId") REFERENCES msghistoryandstats."userDataSnapshots"(id) ON UPDATE CASCADE;


--
-- Name: DATABASE winzip; Type: ACL; Schema: -; Owner: itadmin
--

REVOKE CONNECT,TEMPORARY ON DATABASE winzip FROM PUBLIC;
GRANT TEMPORARY ON DATABASE winzip TO wz_hist_db_datawriter;
GRANT CONNECT ON DATABASE winzip TO wz_history_admin;
GRANT CONNECT ON DATABASE winzip TO wz_history_reader;
GRANT CONNECT ON DATABASE winzip TO phdata_db_datareader;


--
-- Name: SCHEMA msghistoryandstats; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA msghistoryandstats TO wz_hist_view_definition;
GRANT CREATE ON SCHEMA msghistoryandstats TO wz_hist_db_dlladmin;
GRANT USAGE ON SCHEMA msghistoryandstats TO phdata_view_definition;


--
-- Name: TABLE "averageAudience"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."averageAudience" TO phdata_db_datareader;


--
-- Name: SEQUENCE "averageAudience_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."averageAudience_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE links; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats.links TO phdata_db_datareader;


--
-- Name: SEQUENCE links_id_seq; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats.links_id_seq TO phdata_db_datareader;


--
-- Name: TABLE "messageSnapshots"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messageSnapshots" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messageSnapshots_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messageSnapshots_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "messagesHistory"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messagesHistory" TO phdata_db_datareader;


--
-- Name: TABLE "messagesHistoryShortTerm"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messagesHistoryShortTerm" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messagesHistoryShortTerm_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messagesHistory_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesHistory_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "messagesSendingStats"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messagesSendingStats" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messagesSendingStats_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "messagesVolume"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messagesVolume" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messagesVolume_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesVolume_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "potentialUsersStatsSrc"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."potentialUsersStatsSrc" TO phdata_db_datareader;


--
-- Name: SEQUENCE "potentialUsersStatsSrc_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "topMsgs"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."topMsgs" TO phdata_db_datareader;


--
-- Name: SEQUENCE "topMsgs_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."topMsgs_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "userDataSnapshots"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."userDataSnapshots" TO phdata_db_datareader;


--
-- Name: SEQUENCE "userDataSnapshots_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: wz_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: msghistoryandstats; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT,USAGE ON SEQUENCES TO wz_hist_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT UPDATE ON SEQUENCES TO wz_hist_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: msghistoryandstats; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT ALL ON FUNCTIONS TO wz_hist_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: msghistoryandstats; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT ON TABLES TO wz_hist_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO wz_hist_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT REFERENCES,TRIGGER ON TABLES TO wz_hist_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- PostgreSQL database dump complete
--

