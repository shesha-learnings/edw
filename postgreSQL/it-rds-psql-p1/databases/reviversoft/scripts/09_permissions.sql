--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE SCHEMA driverreviver;


ALTER SCHEMA driverreviver OWNER TO itadmin;

--
-- Name: driverreviver_all_drivers; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA driverreviver_all_drivers;


ALTER SCHEMA driverreviver_all_drivers OWNER TO itadmin;

--
-- Name: driverreviver_test; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA driverreviver_test;


ALTER SCHEMA driverreviver_test OWNER TO itadmin;

--
-- Name: driverreviver_v2; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA driverreviver_v2;


ALTER SCHEMA driverreviver_v2 OWNER TO itadmin;

--
-- Name: feedbacks; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA feedbacks;


ALTER SCHEMA feedbacks OWNER TO itadmin;

--
-- Name: installsafe; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA installsafe;


ALTER SCHEMA installsafe OWNER TO itadmin;

--
-- Name: msghistoryandstats; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA msghistoryandstats;


ALTER SCHEMA msghistoryandstats OWNER TO itadmin;

--
-- Name: redirect; Type: SCHEMA; Schema: -; Owner: itadmin
--

CREATE SCHEMA redirect;


ALTER SCHEMA redirect OWNER TO itadmin;

--
-- Name: Driver_Search_Type; Type: TYPE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TYPE driverreviver_v2."Driver_Search_Type" AS (
	driverid character varying,
	hardwareid character varying(200),
	ssfs integer,
	index integer,
	iscompatible smallint,
	manufacturer character varying(100),
	version character varying(100),
	releasedate timestamp without time zone,
	domain character varying(200),
	provider character varying(50),
	class character varying(50),
	isbanned bit(1)
);


ALTER TYPE driverreviver_v2."Driver_Search_Type" OWNER TO rvr_poweruser;

--
-- Name: Driver_Type; Type: TYPE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TYPE driverreviver_v2."Driver_Type" AS (
	driverid uuid,
	hardwareid character varying(200),
	os integer,
	manufacturer character varying(100),
	modifieddate timestamp without time zone,
	name character varying(200),
	isbanned boolean
);


ALTER TYPE driverreviver_v2."Driver_Type" OWNER TO rvr_poweruser;

--
-- Name: enum_messageSnapshots_messageType; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_messageType" AS ENUM (
    'ipm',
    'iptn'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_messageType" OWNER TO rvr_history_admin;

--
-- Name: enum_messageSnapshots_mmMessageType; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_mmMessageType" AS ENUM (
    'product',
    'promotional'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_mmMessageType" OWNER TO rvr_history_admin;

--
-- Name: enum_messageSnapshots_osTypeMode; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_osTypeMode" AS ENUM (
    'include',
    'exclude'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_osTypeMode" OWNER TO rvr_history_admin;

--
-- Name: enum_messageSnapshots_prodOriginIdsMode; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodOriginIdsMode" AS ENUM (
    'include',
    'exclude'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodOriginIdsMode" OWNER TO rvr_history_admin;

--
-- Name: enum_messageSnapshots_prodStatesMode; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodStatesMode" AS ENUM (
    'include',
    'exclude'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodStatesMode" OWNER TO rvr_history_admin;

--
-- Name: enum_messageSnapshots_prodVendorIdsMode; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_messageSnapshots_prodVendorIdsMode" AS ENUM (
    'include',
    'exclude'
);


ALTER TYPE msghistoryandstats."enum_messageSnapshots_prodVendorIdsMode" OWNER TO rvr_history_admin;

--
-- Name: enum_userDataSnapshots_mmCustomerType; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmCustomerType" AS ENUM (
    'Customer',
    'Enterprise',
    'Standard'
);


ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmCustomerType" OWNER TO rvr_history_admin;

--
-- Name: enum_userDataSnapshots_mmLicenseScope; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseScope" AS ENUM (
    'PerUser',
    'PerMachine'
);


ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseScope" OWNER TO rvr_history_admin;

--
-- Name: enum_userDataSnapshots_mmLicenseType; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseType" AS ENUM (
    'Pro',
    'Enterprise',
    'Subscription',
    'Perpetual',
    'MSA Gold'
);


ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmLicenseType" OWNER TO rvr_history_admin;

--
-- Name: enum_userDataSnapshots_mmMode; Type: TYPE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TYPE msghistoryandstats."enum_userDataSnapshots_mmMode" AS ENUM (
    'TRIAL',
    'REGISTERED',
    'PAID'
);


ALTER TYPE msghistoryandstats."enum_userDataSnapshots_mmMode" OWNER TO rvr_history_admin;

--
-- Name: Purchase_Type; Type: TYPE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TYPE redirect."Purchase_Type" AS (
	autoactivation integer,
	width integer,
	height integer,
	pagetitle character varying
);


ALTER TYPE redirect."Purchase_Type" OWNER TO rvr_poweruser;

--
-- Name: Driver_search(character, integer, integer); Type: FUNCTION; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE FUNCTION driverreviver_v2."Driver_search"(hardwareid character, os integer, ssfs integer) RETURNS SETOF driverreviver_v2."Driver_Search_Type"
    LANGUAGE plpgsql
    AS $$
DECLARE
	IsCompatible SMALLINT;
	sql_text VARCHAR :='';
	HardwareId_temp VARCHAR :='';
BEGIN
	HardwareId_temp := REPLACE(HardwareId,'Comma','''');
	sql_text :=
		'SELECT
			"DriverId","HardwareId","SSFS","Index","IsCompatible",
			"Manufacturer","Version","ReleaseDate","Domain","Provider",
   			"Class","IsBanned"
			FROM driverreviver_v2."Drivers" WHERE "OS" = ' || CAST(OS AS VARCHAR) || ' AND "SSFS"<= '
				|| CAST(SSFS AS VARCHAR) || ' AND "HardwareId" IN (''' || HardwareId_temp || ''')';
	sql_text := 'SELECT * FROM (' || sql_text || ') as foo WHERE "SSFS" = (SELECT MIN("SSFS") FROM  driverreviver_v2."Drivers") ';

	EXECUTE 'SELECT MIN("IsCompatible") FROM (' || sql_text || ') as foo1' INTO IsCompatible;

	IF IsCompatible = 0 THEN
		sql_text := sql_text || ' AND "IsCompatible" = 0';
	END IF;

	RETURN QUERY EXECUTE sql_text;
END; $$;


ALTER FUNCTION driverreviver_v2."Driver_search"(hardwareid character, os integer, ssfs integer) OWNER TO rvr_poweruser;

--
-- Name: Get_Count_For_Driver(character, character, character, timestamp without time zone, timestamp without time zone, character, character); Type: FUNCTION; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE FUNCTION driverreviver_v2."Get_Count_For_Driver"(manufacturer character, drivername character, driverid character, date_begin timestamp without time zone, date_end timestamp without time zone, os_list character, hardwareid character) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
	sql_text VARCHAR(4000) :='';
	count_value integer := 0;
BEGIN
	IF Manufacturer IS NOT NULL OR DriverName IS NOT NULL OR DriverId IS NOT NULL OR Date_Begin IS NOT NULL OR Date_End  IS NOT NULL OR OS_List IS NOT NULL OR HardwareId IS NOT NULL THEN
		sql_text :=
			 CASE WHEN Manufacturer IS NULL THEN '' ELSE ' AND "Manufacturer" LIKE ''' || Manufacturer || '%''' END  ||
			 CASE WHEN DriverName IS NULL THEN '' ELSE ' AND "Name" LIKE ''%' || DriverName || '%''' END  ||
			 CASE WHEN DriverId IS NULL THEN '' ELSE ' AND "DriverId" LIKE ''%' || DriverId || '%''' END  ||
			 CASE WHEN Date_Begin IS NULL THEN '' ELSE ' AND "ModifiedDate">= ''' || CAST (Date_Begin as varchar) || '''' END  ||
			 CASE WHEN Date_End IS NULL THEN '' ELSE ' AND "ModifiedDate"<= ''' || CAST (Date_End as varchar) || '''' END  ||
			 CASE WHEN OS_List IS NULL THEN '' ELSE ' AND  "OS" IN (' || OS_List || ')' END  ||
			 CASE WHEN HardwareId IS NULL THEN '' ELSE ' AND "HardwareId" LIKE ''' || HardwareId || '%''' END ;
		sql_text := ' WHERE ' || RIGHT (sql_text, length(sql_text)- 4);
	END IF;
	EXECUTE 'SELECT COUNT("DriverId") FROM driverreviver_v2."Drivers" ' || sql_text INTO count_value;
	RETURN count_value;
END; $$;


ALTER FUNCTION driverreviver_v2."Get_Count_For_Driver"(manufacturer character, drivername character, driverid character, date_begin timestamp without time zone, date_end timestamp without time zone, os_list character, hardwareid character) OWNER TO rvr_poweruser;

--
-- Name: Get_Driver_Alt(character, character, character, timestamp without time zone, timestamp without time zone, character, integer, integer, character, character); Type: FUNCTION; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE FUNCTION driverreviver_v2."Get_Driver_Alt"(manufacturer character, drivername character, driverid character, date_begin timestamp without time zone, date_end timestamp without time zone, os_list character, row_from integer, row_to integer, hardwareid character, orderby character) RETURNS SETOF driverreviver_v2."Driver_Type"
    LANGUAGE plpgsql
    AS $$
DECLARE
	sql_text VARCHAR(4000) :='';
	sql_text_temp VARCHAR(4000) :='';
BEGIN
	IF Manufacturer IS NOT NULL OR DriverName IS NOT NULL OR DriverId IS NOT NULL OR Date_Begin IS NOT NULL OR Date_End  IS NOT NULL OR OS_List IS NOT NULL OR HardwareId IS NOT NULL THEN
		sql_text_temp :=
			 CASE WHEN Manufacturer IS NULL THEN '' ELSE ' AND "Manufacturer" LIKE ''' || Manufacturer || '%''' END  ||
			 CASE WHEN DriverName IS NULL THEN '' ELSE ' AND "Name" LIKE ''%' || DriverName || '%''' END  ||
			 CASE WHEN DriverId IS NULL THEN '' ELSE ' AND "DriverId" LIKE ''%' || DriverId || '%''' END  ||
			 CASE WHEN Date_Begin IS NULL THEN '' ELSE ' AND "ModifiedDate">= ''' || CAST (Date_Begin as varchar) || '''' END  ||
			 CASE WHEN Date_End IS NULL THEN '' ELSE ' AND "ModifiedDate"<= ''' || CAST (Date_End as varchar) || '''' END  ||
			 CASE WHEN OS_List IS NULL THEN '' ELSE ' AND  "OS" IN (' || OS_List || ')' END  ||
			 CASE WHEN HardwareId IS NULL THEN '' ELSE ' AND "HardwareId" LIKE ''' || HardwareId || '%''' END ;
		sql_text_temp := ' WHERE ' || RIGHT (sql_text_temp, length(sql_text_temp)- 4);
	END IF;
	IF OrderBy IS NULL THEN
	    OrderBy := '"Name" ASC';
	END IF;

	sql_text :='WITH Members as (
		SELECT
			"DriverId", "HardwareId", "OS", "Manufacturer", "ModifiedDate", "Name", "IsBanned",
				ROW_NUMBER() OVER (ORDER BY ' || OrderBy || ' ) AS RowNumber
			FROM driverreviver_v2."Drivers"' || sql_text_temp || ')
		SELECT
			"DriverId", "HardwareId", "OS", "Manufacturer", "ModifiedDate", "Name", "IsBanned"
			FROM	Members
			WHERE
				RowNumber BETWEEN ' || CAST(Row_From AS VARCHAR) || ' AND ' || CAST(Row_To AS VARCHAR) || ' ORDER BY RowNumber';
	RETURN QUERY EXECUTE sql_text;
END; $$;


ALTER FUNCTION driverreviver_v2."Get_Driver_Alt"(manufacturer character, drivername character, driverid character, date_begin timestamp without time zone, date_end timestamp without time zone, os_list character, row_from integer, row_to integer, hardwareid character, orderby character) OWNER TO rvr_poweruser;

SET default_tablespace = '';

--
-- Name: Drivers; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Drivers" (
    "DriverId" uuid NOT NULL,
    "HardwareId" character varying(200) NOT NULL,
    "OS" integer NOT NULL,
    "SSFS" integer NOT NULL,
    "Index" integer NOT NULL,
    "IsCompatible" boolean NOT NULL,
    "Manufacturer" character varying(100) NOT NULL,
    "Version" character varying(100),
    "ReleaseDate" timestamp(6) without time zone,
    "ModifiedDate" timestamp(6) without time zone,
    "Name" character varying(200) NOT NULL,
    "Url" text,
    "Provider" character varying(50),
    "Class" character varying(50),
    "IsBanned" boolean,
    "ProductType" smallint,
    "IsBeta" boolean DEFAULT false,
    "IsFilter" boolean,
    "OSBuildFrom" integer,
    "Id" integer NOT NULL,
    "Size" integer,
    "Source" character varying(50),
    "SuccessInstalls" integer DEFAULT 0 NOT NULL,
    "TotalInstalls" integer DEFAULT 0 NOT NULL,
    "SuiteMask" smallint,
    "SuitMask" character varying(50),
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now(),
    "Note" character varying(100),
    "SignatureOwner" text,
    "SignedDate" timestamp without time zone,
    "OriginalManufacturer" text
);


ALTER TABLE driverreviver_v2."Drivers" OWNER TO rvr_poweruser;

--
-- Name: Get_Related_Drivers(character varying, integer); Type: FUNCTION; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE FUNCTION driverreviver_v2."Get_Related_Drivers"(hardwareid character varying, os integer) RETURNS SETOF driverreviver_v2."Drivers"
    LANGUAGE plpgsql
    AS $$
DECLARE
	sql_text VARCHAR :='';
	hardwareid_formatted VARCHAR :='';
BEGIN
	--HardwareId comes in format: ROOT\BasicDisplay,PCI\VEN_8086&DEV_1E59&REV_04,PCI\VEN_8086&DEV_1E59
	--Should be: 'ROOT\BasicDisplay','PCI\VEN_8086&DEV_1E59&REV_04','PCI\VEN_8086&DEV_1E59'

	hardwareid_formatted := LOWER(REPLACE(hardwareid, ',', ''','''));

	sql_text := 'SELECT *'
		|| ' FROM driverreviver_v2."Drivers"'
		|| ' WHERE "IsFilter" = FALSE'
		|| ' AND "OS" = ' || OS
		|| ' AND LOWER("HardwareId") IN (''' || hardwareid_formatted || ''')';

	RETURN QUERY EXECUTE sql_text;
END; $$;


ALTER FUNCTION driverreviver_v2."Get_Related_Drivers"(hardwareid character varying, os integer) OWNER TO rvr_poweruser;

--
-- Name: Remove_Duplicate_Devices(); Type: FUNCTION; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE FUNCTION driverreviver_v2."Remove_Duplicate_Devices"() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
	unique_row_ids INTEGER[];
	count_all_rows INTEGER;
BEGIN
	unique_row_ids := ARRAY(SELECT MIN("Id") FROM driverreviver_v2."Device" GROUP BY "Hash");
	SELECT COUNT(*) FROM driverreviver_v2."Device" INTO count_all_rows;

	DELETE FROM driverreviver_v2."Device" WHERE NOT unique_row_ids @> ARRAY["Id"];

	RETURN count_all_rows - array_length(unique_row_ids, 1);
END; $$;


ALTER FUNCTION driverreviver_v2."Remove_Duplicate_Devices"() OWNER TO rvr_poweruser;

--
-- Name: Remove_Duplicate_Laptop(); Type: FUNCTION; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE FUNCTION driverreviver_v2."Remove_Duplicate_Laptop"() RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
	unique_row_ids INTEGER[];
	count_all_rows INTEGER;
BEGIN
	unique_row_ids := ARRAY(SELECT MIN("Id") FROM driverreviver_v2."Laptop" GROUP BY "Hash");
	SELECT COUNT(*) FROM driverreviver_v2."Laptop" INTO count_all_rows;

	DELETE FROM driverreviver_v2."Laptop" WHERE NOT unique_row_ids @> ARRAY["Id"];

	RETURN count_all_rows - array_length(unique_row_ids, 1);
END; $$;


ALTER FUNCTION driverreviver_v2."Remove_Duplicate_Laptop"() OWNER TO rvr_poweruser;

--
-- Name: fill_average_audience_table(integer); Type: FUNCTION; Schema: msghistoryandstats; Owner: rvr_history_admin
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


ALTER FUNCTION msghistoryandstats.fill_average_audience_table(days_offset integer) OWNER TO rvr_history_admin;

--
-- Name: fill_messages_volume_table(integer); Type: FUNCTION; Schema: msghistoryandstats; Owner: rvr_history_admin
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


ALTER FUNCTION msghistoryandstats.fill_messages_volume_table(hours_offset integer) OWNER TO rvr_history_admin;

--
-- Name: fill_msg_sending_stats_table(integer); Type: FUNCTION; Schema: msghistoryandstats; Owner: rvr_history_admin
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


ALTER FUNCTION msghistoryandstats.fill_msg_sending_stats_table(days_number integer) OWNER TO rvr_history_admin;

--
-- Name: fill_p_usr_stats_src_table(integer, integer); Type: FUNCTION; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE FUNCTION msghistoryandstats.fill_p_usr_stats_src_table(days_number integer DEFAULT 1, offset_number integer DEFAULT 0) RETURNS integer
    LANGUAGE plpgsql STRICT
    AS $$
DECLARE
  min_days_number CONSTANT int := 1;
  max_days_number CONSTANT int := 365;
  minutes_in_day_number CONSTANT int := 1440; -- 24*60
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
      "msi",
      "checkType",
      "mmCustomerType"
    )
    SELECT
      h."requestDate",
      upper(h."json" #>> '{ request,application,uid }'),
      upper(h."json" #>> '{ parsedOptions,countryCode }'),
      upper(h."json" #>> '{ request,application,language }'),
      h."json" #> '{ request,installed }',
      h."json" #> '{ parsedOptions,userOwnership }',
      upper(h."json" #>> '{ request,application,prodCode }'),
      upper(h."json" #>> '{ request,application,version }'),
      substring(h."json" #>> '{ request,application,buildId }' from '\d+')::int,
      CASE WHEN (h."json" #>> '{ parsedOptions,daysToLicExpire }')::int <= (today - h."requestDate"::date)
      THEN 'EXPIRED'
      ELSE upper(h."json" #>> '{ parsedOptions,licStatus }')
    END,
      (h."json" #>> '{ parsedOptions,daysToLicExpire }')::int - (today - h."requestDate"::date),
      COALESCE((h."json" #>> '{ request,application,msi }')::int, 0) + minutes_in_day_number * (today - h."requestDate"::date),
      upper(h."json" #>> '{ request,application,checkType }'),
      upper(h."json" #>> '{ request,mindmanagerInfo,state,customerType }')
    FROM msghistoryandstats."messagesHistoryShortTerm" AS h
    JOIN (
      SELECT
        MAX(h."requestDate") AS "lastRequestDate",
        upper(h."json" #>> '{ request,application,uid }') AS "uid",
        upper(h."json" #>> '{ request,application,prodCode }') as "productCode"
      FROM msghistoryandstats."messagesHistoryShortTerm" AS h
      WHERE h."requestDate" >= today - days_number
      GROUP BY h."json" #>> '{ request,application,uid }', h."json" #>> '{ request,application,prodCode }'
    ) AS core ON
    core."lastRequestDate" = h."requestDate" AND
    core."uid" = h."json" #>> '{ request,application,uid }' AND
    core."productCode" = upper(h."json" #>> '{ request,application,prodCode }')
    limit insert_limit
    offset offset_number;

  -- get rows count of the filled table
  GET DIAGNOSTICS result_rows_count := ROW_COUNT;
  RETURN result_rows_count;
END;
$$;


ALTER FUNCTION msghistoryandstats.fill_p_usr_stats_src_table(days_number integer, offset_number integer) OWNER TO rvr_history_admin;

--
-- Name: fill_top_msgs_table(); Type: FUNCTION; Schema: msghistoryandstats; Owner: rvr_history_admin
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


ALTER FUNCTION msghistoryandstats.fill_top_msgs_table() OWNER TO rvr_history_admin;

--
-- Name: Get_Purchase_Setting_And_Autoactivation(character varying, character varying, character varying); Type: FUNCTION; Schema: redirect; Owner: rvr_poweruser
--

CREATE FUNCTION redirect."Get_Purchase_Setting_And_Autoactivation"(prodcode character varying, prodversion character varying, prodbuild character varying) RETURNS redirect."Purchase_Type"
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
	response redirect."Purchase_Type";
BEGIN
	-- Get build by user product and user version and user build
	SELECT * INTO query_build_result FROM redirect."Build" AS b JOIN redirect."ProductVersion" AS pv ON (pv."Id" = b."ProductVersion_Id" AND pv."Version" = ProdVersion) JOIN redirect."Product" AS p ON (pv."Product_Id" = p."Id" AND p."Code" = ProdCode) WHERE (b."Number" = ProdBuild) LIMIT 1;
	IF NOT FOUND THEN
	   -- Get build by user product and default version and user build
	   SELECT * INTO query_build_result FROM redirect."Build" AS b JOIN redirect."ProductVersion" AS pv ON (pv."Id" = b."ProductVersion_Id" AND pv."Version" = def_version) JOIN redirect."Product" AS p ON (pv."Product_Id" = p."Id" AND p."Code" = ProdCode) WHERE (b."Number" = ProdBuild) LIMIT 1;
	   IF NOT FOUND THEN
	      -- Get build by user product and default version and default build
	      SELECT * INTO query_build_result FROM redirect."Build" AS b JOIN redirect."ProductVersion" AS pv ON (pv."Id" = b."ProductVersion_Id" AND pv."Version" = def_version) JOIN redirect."Product" AS p ON (pv."Product_Id" = p."Id" AND p."Code" = ProdCode) WHERE (b."Number" = def_build) LIMIT 1;
	   END IF;
	END IF;

	IF query_build_result."Autoactivation" THEN
	    SELECT "Value" INTO response.autoactivation FROM redirect."Setting" WHERE "Name" = def_autoactivation_field_name;
	ELSE
	    response.autoactivation = def_autoactivation;
	END IF;

	IF query_build_result."InProductPurchasing" THEN
	    -- Get purchase settings
	    SELECT * INTO query_result FROM redirect."PurchaseSetting" AS ps WHERE (ps."Id" = query_build_result."PurchaseSetting_Id");

	    -- Map result
	    response.Width := query_result."Width";
	    response.Height := query_result."Height";
	    response.PageTitle := query_result."PageTitle";
	END IF;

	RETURN response;
END;
$$;


ALTER FUNCTION redirect."Get_Purchase_Setting_And_Autoactivation"(prodcode character varying, prodversion character varying, prodbuild character varying) OWNER TO rvr_poweruser;

--
-- Name: Drivers; Type: TABLE; Schema: driverreviver; Owner: rvr_poweruser
--

CREATE TABLE driverreviver."Drivers" (
    "DriverId" uuid NOT NULL,
    "HardwareId" character varying(200) NOT NULL,
    "OS" integer NOT NULL,
    "SSFS" integer NOT NULL,
    "Index" integer NOT NULL,
    "IsCompatible" boolean NOT NULL,
    "Manufacturer" character varying(100) NOT NULL,
    "Version" character varying(100),
    "ReleaseDate" timestamp(6) without time zone,
    "ModifiedDate" timestamp(6) without time zone NOT NULL,
    "Name" character varying(200) NOT NULL,
    "Url" text,
    "Domain" character varying(200),
    "Provider" character varying(50),
    "Class" character varying(50),
    "IsBanned" boolean,
    "SuitMask" character varying(50),
    "ProductType" character varying(50),
    "IsBeta" boolean
);


ALTER TABLE driverreviver."Drivers" OWNER TO rvr_poweruser;

--
-- Name: Drivers; Type: TABLE; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_all_drivers."Drivers" (
    "DriverId" uuid NOT NULL,
    "HardwareId" character varying(200) NOT NULL,
    "OS" integer NOT NULL,
    "SSFS" integer NOT NULL,
    "Index" integer NOT NULL,
    "IsCompatible" boolean NOT NULL,
    "Manufacturer" character varying(100) NOT NULL,
    "Version" character varying(100),
    "ReleaseDate" timestamp(6) without time zone,
    "ModifiedDate" timestamp(6) without time zone NOT NULL,
    "Name" character varying(200) NOT NULL,
    "Url" text,
    "Provider" character varying(50),
    "Class" character varying(50),
    "IsBanned" boolean,
    "SuitMask" character varying(50),
    "ProductType" smallint,
    "OSBuildFrom" integer,
    "Id" integer NOT NULL,
    "Size" integer,
    "Source" character varying(50)
);


ALTER TABLE driverreviver_all_drivers."Drivers" OWNER TO rvr_poweruser;

--
-- Name: Drivers_Id_seq; Type: SEQUENCE; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_all_drivers."Drivers_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_all_drivers."Drivers_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Drivers_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_all_drivers."Drivers_Id_seq" OWNED BY driverreviver_all_drivers."Drivers"."Id";


--
-- Name: BanRules; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."BanRules" (
    "Id" integer NOT NULL,
    "Class" character varying(64),
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now(),
    "Note" character varying(100)
);


ALTER TABLE driverreviver_v2."BanRules" OWNER TO rvr_poweruser;

--
-- Name: BanRules_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."BanRules_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."BanRules_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: BanRules_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."BanRules_Id_seq" OWNED BY driverreviver_v2."BanRules"."Id";


--
-- Name: Device; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Device" (
    "Id" integer NOT NULL,
    "Score" bigint NOT NULL,
    "Date" timestamp(6) without time zone,
    "Manufacturer" text,
    "Class" text,
    "Description" text,
    "Hash" text
);


ALTER TABLE driverreviver_v2."Device" OWNER TO rvr_poweruser;

--
-- Name: DeviceDeviceHardware; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."DeviceDeviceHardware" (
    "Device_Id" integer NOT NULL,
    "DeviceHardware_Id" integer NOT NULL
);


ALTER TABLE driverreviver_v2."DeviceDeviceHardware" OWNER TO rvr_poweruser;

--
-- Name: DeviceHardware; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."DeviceHardware" (
    "Id" integer NOT NULL,
    "IsCompatible" boolean NOT NULL,
    "Hardware_Id" integer NOT NULL
);


ALTER TABLE driverreviver_v2."DeviceHardware" OWNER TO rvr_poweruser;

--
-- Name: DeviceHardware_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."DeviceHardware_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."DeviceHardware_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: DeviceHardware_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."DeviceHardware_Id_seq" OWNED BY driverreviver_v2."DeviceHardware"."Id";


--
-- Name: Device_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Device_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Device_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Device_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Device_Id_seq" OWNED BY driverreviver_v2."Device"."Id";


--
-- Name: DownloadedFilePackage; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."DownloadedFilePackage" (
    "Package_Id" integer NOT NULL,
    "DownloadedFile_Id" integer NOT NULL
);


ALTER TABLE driverreviver_v2."DownloadedFilePackage" OWNER TO rvr_poweruser;

--
-- Name: DownloadedFiles; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."DownloadedFiles" (
    "Id" integer NOT NULL,
    "Link" text NOT NULL,
    "Size" bigint NOT NULL,
    "Hash" character varying(32) NOT NULL,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."DownloadedFiles" OWNER TO rvr_poweruser;

--
-- Name: DownloadedFiles_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."DownloadedFiles_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."DownloadedFiles_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: DownloadedFiles_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."DownloadedFiles_Id_seq" OWNED BY driverreviver_v2."DownloadedFiles"."Id";


--
-- Name: Drivers_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Drivers_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Drivers_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Drivers_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Drivers_Id_seq" OWNED BY driverreviver_v2."Drivers"."Id";


--
-- Name: Errors; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Errors" (
    "Id" integer NOT NULL,
    "Date" timestamp(6) without time zone,
    "Type" integer NOT NULL,
    "Url" text NOT NULL,
    "Message" text,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."Errors" OWNER TO rvr_poweruser;

--
-- Name: Errors_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Errors_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Errors_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Errors_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Errors_Id_seq" OWNED BY driverreviver_v2."Errors"."Id";


--
-- Name: FeatureConfiguration; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."FeatureConfiguration" (
    "Id" integer NOT NULL,
    "Name" character varying(50),
    "IsActive" boolean NOT NULL,
    "Description" character varying(100),
    "Data" text,
    "CreatedAt" timestamp without time zone,
    "UpdatedAt" timestamp without time zone
);


ALTER TABLE driverreviver_v2."FeatureConfiguration" OWNER TO rvr_poweruser;

--
-- Name: FeatureConfiguration_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."FeatureConfiguration_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."FeatureConfiguration_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: FeatureConfiguration_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."FeatureConfiguration_Id_seq" OWNED BY driverreviver_v2."FeatureConfiguration"."Id";


--
-- Name: Feedbacks; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Feedbacks" (
    "Id" integer NOT NULL,
    "Email" text NOT NULL,
    "Message" text NOT NULL,
    "Date" timestamp(6) without time zone,
    "Status" character varying(50) NOT NULL,
    "Type" text NOT NULL,
    "HardwareId" text NOT NULL,
    "OS" text NOT NULL,
    "Architecture" text NOT NULL,
    "Build" text NOT NULL,
    "Memo" text,
    "Unclear" boolean DEFAULT false NOT NULL,
    "LogFile" bytea,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."Feedbacks" OWNER TO rvr_poweruser;

--
-- Name: Feedbacks_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Feedbacks_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Feedbacks_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Feedbacks_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Feedbacks_Id_seq" OWNED BY driverreviver_v2."Feedbacks"."Id";


--
-- Name: Hardware; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Hardware" (
    "Id" integer NOT NULL,
    "HardwareId" text NOT NULL,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."Hardware" OWNER TO rvr_poweruser;

--
-- Name: Hardware_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Hardware_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Hardware_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Hardware_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Hardware_Id_seq" OWNED BY driverreviver_v2."Hardware"."Id";


--
-- Name: Laptop; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Laptop" (
    "Id" integer NOT NULL,
    "Model" text NOT NULL,
    "Hash" text
);


ALTER TABLE driverreviver_v2."Laptop" OWNER TO rvr_poweruser;

--
-- Name: LaptopDevice; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."LaptopDevice" (
    "Laptop_Id" integer NOT NULL,
    "Device_Id" integer NOT NULL
);


ALTER TABLE driverreviver_v2."LaptopDevice" OWNER TO rvr_poweruser;

--
-- Name: Laptop_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Laptop_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Laptop_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Laptop_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Laptop_Id_seq" OWNED BY driverreviver_v2."Laptop"."Id";


--
-- Name: Manufacturers; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Manufacturers" (
    "Id" integer NOT NULL,
    "Name" character varying(200),
    "ParentId" integer,
    "IsParent" boolean DEFAULT false NOT NULL,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."Manufacturers" OWNER TO rvr_poweruser;

--
-- Name: Manufacturers_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Manufacturers_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Manufacturers_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Manufacturers_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Manufacturers_Id_seq" OWNED BY driverreviver_v2."Manufacturers"."Id";


--
-- Name: OperatingSystem; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."OperatingSystem" (
    "Id" integer NOT NULL,
    "Major" integer NOT NULL,
    "Minor" integer NOT NULL,
    "Architecture" integer NOT NULL,
    "Name" character varying(50),
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."OperatingSystem" OWNER TO rvr_poweruser;

--
-- Name: OperatingSystem_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."OperatingSystem_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."OperatingSystem_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: OperatingSystem_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."OperatingSystem_Id_seq" OWNED BY driverreviver_v2."OperatingSystem"."Id";


--
-- Name: Package; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Package" (
    "Id" integer NOT NULL,
    "Hash" text NOT NULL,
    "FileKey" uuid NOT NULL,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."Package" OWNER TO rvr_poweruser;

--
-- Name: PackageHardwareOS; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."PackageHardwareOS" (
    "Id" integer NOT NULL,
    "Hardware_Id" integer NOT NULL,
    "OS_Id" integer NOT NULL,
    "Package_Id" integer NOT NULL,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."PackageHardwareOS" OWNER TO rvr_poweruser;

--
-- Name: PackageHardwareOS_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."PackageHardwareOS_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."PackageHardwareOS_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: PackageHardwareOS_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."PackageHardwareOS_Id_seq" OWNED BY driverreviver_v2."PackageHardwareOS"."Id";


--
-- Name: Package_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Package_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Package_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Package_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Package_Id_seq" OWNED BY driverreviver_v2."Package"."Id";


--
-- Name: ProviderHistories; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."ProviderHistories" (
    "Id" integer NOT NULL,
    "Date_End" timestamp without time zone,
    "Date_Begin" timestamp without time zone,
    "Links" integer,
    "Drivers" integer,
    "DriverConfigurations" integer,
    "ParsingErrorCount" integer NOT NULL,
    "Status" text,
    "CreatedAt" timestamp without time zone,
    "UpdatedAt" timestamp without time zone,
    "Provider_Id" integer
);


ALTER TABLE driverreviver_v2."ProviderHistories" OWNER TO rvr_poweruser;

--
-- Name: ProviderHistories_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."ProviderHistories_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."ProviderHistories_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: ProviderHistories_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."ProviderHistories_Id_seq" OWNED BY driverreviver_v2."ProviderHistories"."Id";


--
-- Name: ProviderItem; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."ProviderItem" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "URL" text,
    "File_Id" integer,
    "Parent_Id" integer,
    "Provider_Id" integer NOT NULL,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."ProviderItem" OWNER TO rvr_poweruser;

--
-- Name: ProviderItem_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."ProviderItem_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."ProviderItem_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: ProviderItem_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."ProviderItem_Id_seq" OWNED BY driverreviver_v2."ProviderItem"."Id";


--
-- Name: Providers; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Providers" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Status" text NOT NULL,
    "Date_Begin" timestamp(6) without time zone,
    "Date_End" timestamp(6) without time zone,
    "ParsingErrorCount" integer NOT NULL,
    "Links" integer,
    "Drivers" integer,
    "DriverConfigurations" integer,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."Providers" OWNER TO rvr_poweruser;

--
-- Name: Providers_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Providers_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Providers_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Providers_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Providers_Id_seq" OWNED BY driverreviver_v2."Providers"."Id";


--
-- Name: Settings; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."Settings" (
    "Name" character varying(20) NOT NULL,
    "Value" character varying(50) NOT NULL,
    "Id" integer NOT NULL,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."Settings" OWNER TO rvr_poweruser;

--
-- Name: Settings_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."Settings_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."Settings_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Settings_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."Settings_Id_seq" OWNED BY driverreviver_v2."Settings"."Id";


--
-- Name: UnknownOSes; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."UnknownOSes" (
    "Id" integer NOT NULL,
    "OS" text NOT NULL,
    "Url" text NOT NULL,
    "CreatedAt" timestamp without time zone DEFAULT now(),
    "UpdatedAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE driverreviver_v2."UnknownOSes" OWNER TO rvr_poweruser;

--
-- Name: UnknownOSes_Id_seq; Type: SEQUENCE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE SEQUENCE driverreviver_v2."UnknownOSes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE driverreviver_v2."UnknownOSes_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: UnknownOSes_Id_seq; Type: SEQUENCE OWNED BY; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER SEQUENCE driverreviver_v2."UnknownOSes_Id_seq" OWNED BY driverreviver_v2."UnknownOSes"."Id";


--
-- Name: __MigrationHistory; Type: TABLE; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE TABLE driverreviver_v2."__MigrationHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ContextKey" character varying(300) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    "Model" bytea
);


ALTER TABLE driverreviver_v2."__MigrationHistory" OWNER TO rvr_poweruser;

--
-- Name: Feedbacks; Type: TABLE; Schema: feedbacks; Owner: rvr_poweruser
--

CREATE TABLE feedbacks."Feedbacks" (
    "Id" integer NOT NULL,
    "ProductCode" text NOT NULL,
    "ProductVersion" text NOT NULL,
    "Rating" double precision NOT NULL,
    "Email" text NOT NULL,
    "Feedback" text NOT NULL,
    "AllowForMarketing" boolean NOT NULL,
    "Lang" text NOT NULL,
    "MajorOS" integer NOT NULL,
    "MinorOS" integer NOT NULL,
    "X64" boolean NOT NULL,
    "Logs" text,
    "CreatedAt" timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE feedbacks."Feedbacks" OWNER TO rvr_poweruser;

--
-- Name: Feedbacks_Id_seq; Type: SEQUENCE; Schema: feedbacks; Owner: rvr_poweruser
--

CREATE SEQUENCE feedbacks."Feedbacks_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE feedbacks."Feedbacks_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Feedbacks_Id_seq; Type: SEQUENCE OWNED BY; Schema: feedbacks; Owner: rvr_poweruser
--

ALTER SEQUENCE feedbacks."Feedbacks_Id_seq" OWNED BY feedbacks."Feedbacks"."Id";


--
-- Name: __MigrationHistory; Type: TABLE; Schema: feedbacks; Owner: rvr_poweruser
--

CREATE TABLE feedbacks."__MigrationHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ContextKey" character varying(300) NOT NULL,
    "ProductVersion" character varying(32),
    "Model" bytea
);


ALTER TABLE feedbacks."__MigrationHistory" OWNER TO rvr_poweruser;

--
-- Name: AppsDetecteds; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."AppsDetecteds" (
    "Id" integer NOT NULL,
    "Hash" text,
    "Name" text,
    "Publisher" text,
    "Version" text,
    "Group" text,
    "FirstDetectionDate" timestamp(6) without time zone NOT NULL
);


ALTER TABLE installsafe."AppsDetecteds" OWNER TO rvr_poweruser;

--
-- Name: AppsDetecteds_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."AppsDetecteds_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."AppsDetecteds_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: AppsDetecteds_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."AppsDetecteds_Id_seq" OWNED BY installsafe."AppsDetecteds"."Id";


--
-- Name: GroupRecommendations; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."GroupRecommendations" (
    "Group_Id" integer NOT NULL,
    "Recommendation_Id" integer NOT NULL
);


ALTER TABLE installsafe."GroupRecommendations" OWNER TO rvr_poweruser;

--
-- Name: Groups; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."Groups" (
    "Id" integer NOT NULL,
    "Name" text
);


ALTER TABLE installsafe."Groups" OWNER TO rvr_poweruser;

--
-- Name: Groups_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."Groups_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."Groups_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Groups_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."Groups_Id_seq" OWNED BY installsafe."Groups"."Id";


--
-- Name: InstallerAppsDetecteds; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."InstallerAppsDetecteds" (
    "Id" integer NOT NULL,
    "InstallerDetails_Id" integer,
    "AppsDetected_Id" integer,
    "Count" integer NOT NULL
);


ALTER TABLE installsafe."InstallerAppsDetecteds" OWNER TO rvr_poweruser;

--
-- Name: InstallerAppsDetecteds_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."InstallerAppsDetecteds_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."InstallerAppsDetecteds_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: InstallerAppsDetecteds_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."InstallerAppsDetecteds_Id_seq" OWNED BY installsafe."InstallerAppsDetecteds"."Id";


--
-- Name: InstallerDetails; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."InstallerDetails" (
    "Id" integer NOT NULL,
    "Hash" text,
    "Publisher" text,
    "Name" text,
    "Version" text,
    "FirstDetectionDate" timestamp(6) without time zone NOT NULL
);


ALTER TABLE installsafe."InstallerDetails" OWNER TO rvr_poweruser;

--
-- Name: InstallerDetails_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."InstallerDetails_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."InstallerDetails_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: InstallerDetails_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."InstallerDetails_Id_seq" OWNED BY installsafe."InstallerDetails"."Id";


--
-- Name: ListItems; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."ListItems" (
    "Id" integer NOT NULL,
    "IgnoreVersion" boolean NOT NULL,
    "IgnoreName" boolean NOT NULL,
    "IgnoreGroup" boolean NOT NULL,
    "IgnorePublisher" boolean NOT NULL,
    "AppsDetected_Id" integer,
    "Toolbar_Id" integer,
    "Rating" integer,
    "List_Id" integer
);


ALTER TABLE installsafe."ListItems" OWNER TO rvr_poweruser;

--
-- Name: ListItems_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."ListItems_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."ListItems_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: ListItems_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."ListItems_Id_seq" OWNED BY installsafe."ListItems"."Id";


--
-- Name: Lists; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."Lists" (
    "Id" integer NOT NULL,
    "Version" text
);


ALTER TABLE installsafe."Lists" OWNER TO rvr_poweruser;

--
-- Name: Lists_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."Lists_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."Lists_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Lists_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."Lists_Id_seq" OWNED BY installsafe."Lists"."Id";


--
-- Name: RawMainDatas; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."RawMainDatas" (
    "Id" integer NOT NULL,
    "Uid" text,
    "Json" text,
    "Timestamp" timestamp(6) without time zone NOT NULL
);


ALTER TABLE installsafe."RawMainDatas" OWNER TO rvr_poweruser;

--
-- Name: RawMainDatas_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."RawMainDatas_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."RawMainDatas_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: RawMainDatas_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."RawMainDatas_Id_seq" OWNED BY installsafe."RawMainDatas"."Id";


--
-- Name: RawRemovedToolbarDatas; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."RawRemovedToolbarDatas" (
    "Id" integer NOT NULL,
    "Uid" text,
    "Json" text,
    "Timestamp" timestamp(6) without time zone NOT NULL
);


ALTER TABLE installsafe."RawRemovedToolbarDatas" OWNER TO rvr_poweruser;

--
-- Name: RawRemovedToolbarDatas_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."RawRemovedToolbarDatas_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."RawRemovedToolbarDatas_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: RawRemovedToolbarDatas_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."RawRemovedToolbarDatas_Id_seq" OWNED BY installsafe."RawRemovedToolbarDatas"."Id";


--
-- Name: RawToolbarDatas; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."RawToolbarDatas" (
    "Id" integer NOT NULL,
    "Uid" text,
    "Json" text,
    "Timestamp" timestamp(6) without time zone NOT NULL
);


ALTER TABLE installsafe."RawToolbarDatas" OWNER TO rvr_poweruser;

--
-- Name: RawToolbarDatas_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."RawToolbarDatas_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."RawToolbarDatas_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: RawToolbarDatas_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."RawToolbarDatas_Id_seq" OWNED BY installsafe."RawToolbarDatas"."Id";


--
-- Name: Recommendations; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."Recommendations" (
    "Id" integer NOT NULL,
    "Type" integer NOT NULL,
    "Name" text,
    "Version" text,
    "Publisher" text,
    "Rating" real NOT NULL,
    "Active" boolean NOT NULL,
    "List_Id" integer,
    "Description" text
);


ALTER TABLE installsafe."Recommendations" OWNER TO rvr_poweruser;

--
-- Name: Recommendations_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."Recommendations_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."Recommendations_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Recommendations_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."Recommendations_Id_seq" OWNED BY installsafe."Recommendations"."Id";


--
-- Name: RemovedToolbars; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."RemovedToolbars" (
    "Id" integer NOT NULL,
    "RemovedToolbarId" integer NOT NULL,
    "userInfoId" integer NOT NULL
);


ALTER TABLE installsafe."RemovedToolbars" OWNER TO rvr_poweruser;

--
-- Name: RemovedToolbars_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."RemovedToolbars_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."RemovedToolbars_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: RemovedToolbars_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."RemovedToolbars_Id_seq" OWNED BY installsafe."RemovedToolbars"."Id";


--
-- Name: Toolbars; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."Toolbars" (
    "Id" integer NOT NULL,
    "Hash" text,
    "Name" text,
    "Publisher" text,
    "Version" text,
    "Group" text,
    "FirstDetectionDate" timestamp(6) without time zone NOT NULL,
    "Recommendation_Id" integer
);


ALTER TABLE installsafe."Toolbars" OWNER TO rvr_poweruser;

--
-- Name: Toolbars_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."Toolbars_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."Toolbars_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Toolbars_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."Toolbars_Id_seq" OWNED BY installsafe."Toolbars"."Id";


--
-- Name: UInstallerDetails; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."UInstallerDetails" (
    "Id" integer NOT NULL,
    "InstallerDetails_Id" integer,
    "Hash" text,
    "Count" integer NOT NULL,
    "UserInfo_Id" integer
);


ALTER TABLE installsafe."UInstallerDetails" OWNER TO rvr_poweruser;

--
-- Name: UInstallerDetails_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."UInstallerDetails_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."UInstallerDetails_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: UInstallerDetails_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."UInstallerDetails_Id_seq" OWNED BY installsafe."UInstallerDetails"."Id";


--
-- Name: UidToolbars; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."UidToolbars" (
    "Id" integer NOT NULL,
    "Toolbar_Id" integer,
    "Count" integer NOT NULL,
    "UserInfo_Id" integer
);


ALTER TABLE installsafe."UidToolbars" OWNER TO rvr_poweruser;

--
-- Name: UidToolbars_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."UidToolbars_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."UidToolbars_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: UidToolbars_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."UidToolbars_Id_seq" OWNED BY installsafe."UidToolbars"."Id";


--
-- Name: UidWin32; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."UidWin32" (
    "Id" integer NOT NULL,
    "UserId" integer NOT NULL,
    "Win32OSId" integer NOT NULL,
    "Count" integer NOT NULL,
    "UserInfo_Id" integer,
    "Win32_OperatingSystem_Id" integer
);


ALTER TABLE installsafe."UidWin32" OWNER TO rvr_poweruser;

--
-- Name: UidWin32_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."UidWin32_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."UidWin32_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: UidWin32_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."UidWin32_Id_seq" OWNED BY installsafe."UidWin32"."Id";


--
-- Name: UserInfoes; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."UserInfoes" (
    "Id" integer NOT NULL,
    uuid text,
    client text,
    client_version text
);


ALTER TABLE installsafe."UserInfoes" OWNER TO rvr_poweruser;

--
-- Name: UserInfoes_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."UserInfoes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."UserInfoes_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: UserInfoes_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."UserInfoes_Id_seq" OWNED BY installsafe."UserInfoes"."Id";


--
-- Name: Win32_OperatingSystem; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."Win32_OperatingSystem" (
    "Id" integer NOT NULL,
    "Hash" text,
    "EncryptionLevel" integer NOT NULL,
    "CurrentTimeZone" integer NOT NULL,
    "NumberOfUsers" integer NOT NULL,
    "NumberOfProcesses" integer NOT NULL,
    "MaxNumberOfProcesses" integer NOT NULL,
    "Debug" boolean NOT NULL,
    "Primary" boolean NOT NULL,
    "PortableOperatingSystem" boolean NOT NULL,
    "DataExecutionPrevention_Available" boolean NOT NULL,
    "DataExecutionPrevention_Drivers" boolean NOT NULL,
    "DataExecutionPrevention_32BitApplications" boolean NOT NULL,
    "CSName" text,
    "OSArchitecture" text,
    "Version" text,
    "BuildType" text,
    "BuildNumber" text,
    "Manufacturer" text,
    "SerialNumber" text,
    "CountryCode" text,
    "Locale" text,
    "CodeSet" text,
    "RegisteredUser" text,
    "Organization" text,
    "MaxProcessMemorySize" text,
    "FreePhysicalMemory" text,
    "TotalVisibleMemorySize" text,
    "FreeSpaceInPagingFiles" text,
    "SizeStoredInPagingFiles" text,
    "FreeVirtualMemory" text,
    "TotalVirtualMemorySize" text,
    "BootDevice" text,
    "SystemDevice" text,
    "SystemDrive" text,
    "SystemDirectory" text,
    "WindowsDirectory" text
);


ALTER TABLE installsafe."Win32_OperatingSystem" OWNER TO rvr_poweruser;

--
-- Name: Win32_OperatingSystem_Id_seq; Type: SEQUENCE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE SEQUENCE installsafe."Win32_OperatingSystem_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE installsafe."Win32_OperatingSystem_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Win32_OperatingSystem_Id_seq; Type: SEQUENCE OWNED BY; Schema: installsafe; Owner: rvr_poweruser
--

ALTER SEQUENCE installsafe."Win32_OperatingSystem_Id_seq" OWNED BY installsafe."Win32_OperatingSystem"."Id";


--
-- Name: __MigrationHistory; Type: TABLE; Schema: installsafe; Owner: rvr_poweruser
--

CREATE TABLE installsafe."__MigrationHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ContextKey" character varying(300) NOT NULL,
    "ProductVersion" character varying(32),
    "Model" bytea
);


ALTER TABLE installsafe."__MigrationHistory" OWNER TO rvr_poweruser;

--
-- Name: averageAudience; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TABLE msghistoryandstats."averageAudience" (
    id integer NOT NULL,
    date timestamp with time zone,
    "prodCode" character varying(255),
    "checkType" character varying(255),
    count integer
);


ALTER TABLE msghistoryandstats."averageAudience" OWNER TO rvr_history_admin;

--
-- Name: averageAudience_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."averageAudience_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."averageAudience_id_seq" OWNER TO rvr_history_admin;

--
-- Name: averageAudience_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."averageAudience_id_seq" OWNED BY msghistoryandstats."averageAudience".id;


--
-- Name: links; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TABLE msghistoryandstats.links (
    id integer NOT NULL,
    url character varying(512) NOT NULL
);


ALTER TABLE msghistoryandstats.links OWNER TO rvr_history_admin;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats.links_id_seq OWNER TO rvr_history_admin;

--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats.links_id_seq OWNED BY msghistoryandstats.links.id;


--
-- Name: messageSnapshots; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
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
    "includeBuildIDs" character varying(20)[],
    "excludeBuildIDs" character varying(20)[],
    "includeUIDs" character varying(40)[],
    "checkTypes" character varying(255)[],
    frequency character varying(15) NOT NULL,
    "minEngineVersion" character varying(20),
    "maxEngineVersion" character varying(20),
    "productOwnerships" json,
    "installedProducts" json,
    "minutesInstallFrom" integer,
    "minutesInstallTo" integer,
    "licenseExpiryFrom" integer,
    "licenseExpiryTo" integer,
    "countryCodes" character varying(3)[],
    "languageCodes" character varying(7)[],
    title character varying(255) NOT NULL,
    t character varying(255),
    "pirateStatesValue" character varying(10),
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
    "mmCustomerType" character varying(150),
    "mmLicenseType" character varying(150),
    "mmMessageType" msghistoryandstats."enum_messageSnapshots_mmMessageType"
);


ALTER TABLE msghistoryandstats."messageSnapshots" OWNER TO rvr_history_admin;

--
-- Name: messageSnapshots_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."messageSnapshots_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messageSnapshots_id_seq" OWNER TO rvr_history_admin;

--
-- Name: messageSnapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."messageSnapshots_id_seq" OWNED BY msghistoryandstats."messageSnapshots".id;


--
-- Name: messagesHistory; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TABLE msghistoryandstats."messagesHistory" (
    id integer NOT NULL,
    "requestDate" timestamp with time zone NOT NULL,
    "userDataSnapshotId" integer NOT NULL,
    "ipmSnapshotId" integer,
    "ipmResponseLinkId" integer,
    "iptnSnapshotId" integer,
    "iptnResponseLinkId" integer,
    json jsonb
);


ALTER TABLE msghistoryandstats."messagesHistory" OWNER TO rvr_history_admin;

--
-- Name: messagesHistoryShortTerm; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
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


ALTER TABLE msghistoryandstats."messagesHistoryShortTerm" OWNER TO rvr_history_admin;

--
-- Name: messagesHistoryShortTerm_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" OWNER TO rvr_history_admin;

--
-- Name: messagesHistoryShortTerm_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" OWNED BY msghistoryandstats."messagesHistoryShortTerm".id;


--
-- Name: messagesHistory_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."messagesHistory_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messagesHistory_id_seq" OWNER TO rvr_history_admin;

--
-- Name: messagesHistory_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."messagesHistory_id_seq" OWNED BY msghistoryandstats."messagesHistory".id;


--
-- Name: messagesSendingStats; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TABLE msghistoryandstats."messagesSendingStats" (
    id integer NOT NULL,
    date date NOT NULL,
    "messageId" integer NOT NULL,
    "messageType" text NOT NULL,
    "uniqRecipientsNumber" integer NOT NULL,
    "totalSendsNumber" integer NOT NULL
);


ALTER TABLE msghistoryandstats."messagesSendingStats" OWNER TO rvr_history_admin;

--
-- Name: messagesSendingStats_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."messagesSendingStats_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" OWNER TO rvr_history_admin;

--
-- Name: messagesSendingStats_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" OWNED BY msghistoryandstats."messagesSendingStats".id;


--
-- Name: messagesVolume; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TABLE msghistoryandstats."messagesVolume" (
    id integer NOT NULL,
    date timestamp with time zone,
    type character varying(255),
    count integer
);


ALTER TABLE msghistoryandstats."messagesVolume" OWNER TO rvr_history_admin;

--
-- Name: messagesVolume_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."messagesVolume_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messagesVolume_id_seq" OWNER TO rvr_history_admin;

--
-- Name: messagesVolume_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."messagesVolume_id_seq" OWNED BY msghistoryandstats."messagesVolume".id;


--
-- Name: potentialUsersStatsSrc; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TABLE msghistoryandstats."potentialUsersStatsSrc" (
    id integer NOT NULL,
    "requestDate" timestamp with time zone NOT NULL,
    "userUid" character varying(40) NOT NULL,
    "countryCode" character varying(3),
    "languageCode" character varying(12) NOT NULL,
    "productCode" character varying(10) NOT NULL,
    "buildId" integer,
    "licStatus" character varying(10),
    "daysToLicExpire" integer,
    msi integer NOT NULL,
    "checkType" character varying(255),
    "installedProductCodes" jsonb,
    "userOwnership" jsonb,
    version character varying(23),
    "mmCustomerType" character varying(255)
);


ALTER TABLE msghistoryandstats."potentialUsersStatsSrc" OWNER TO rvr_history_admin;

--
-- Name: potentialUsersStatsSrc_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" OWNER TO rvr_history_admin;

--
-- Name: potentialUsersStatsSrc_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" OWNED BY msghistoryandstats."potentialUsersStatsSrc".id;


--
-- Name: topMsgs; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE TABLE msghistoryandstats."topMsgs" (
    id integer NOT NULL,
    date timestamp with time zone,
    "messageId" integer,
    name character varying(255),
    count integer,
    type character varying(255)
);


ALTER TABLE msghistoryandstats."topMsgs" OWNER TO rvr_history_admin;

--
-- Name: topMsgs_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."topMsgs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."topMsgs_id_seq" OWNER TO rvr_history_admin;

--
-- Name: topMsgs_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."topMsgs_id_seq" OWNED BY msghistoryandstats."topMsgs".id;


--
-- Name: userDataSnapshots; Type: TABLE; Schema: msghistoryandstats; Owner: rvr_history_admin
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
    "productCode" character varying(10) NOT NULL,
    version character varying(20) NOT NULL,
    "buildId" character varying(20) NOT NULL,
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
    "mmLicenseScope" msghistoryandstats."enum_userDataSnapshots_mmLicenseScope",
    "mmCustomerType" msghistoryandstats."enum_userDataSnapshots_mmCustomerType"
);


ALTER TABLE msghistoryandstats."userDataSnapshots" OWNER TO rvr_history_admin;

--
-- Name: userDataSnapshots_id_seq; Type: SEQUENCE; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE SEQUENCE msghistoryandstats."userDataSnapshots_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" OWNER TO rvr_history_admin;

--
-- Name: userDataSnapshots_id_seq; Type: SEQUENCE OWNED BY; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" OWNED BY msghistoryandstats."userDataSnapshots".id;


--
-- Name: Build; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."Build" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Number" text,
    "ProductVersion_Id" bigint NOT NULL,
    "IsDefault" boolean NOT NULL,
    "Autoactivation" boolean DEFAULT false NOT NULL,
    "InProductPurchasing" boolean DEFAULT false NOT NULL,
    "PurchaseSetting_Id" bigint
);


ALTER TABLE redirect."Build" OWNER TO rvr_poweruser;

--
-- Name: Link; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."Link" (
    "Id" bigint NOT NULL,
    "Url" text,
    "Build_Id" bigint NOT NULL,
    "Type_Id" bigint NOT NULL,
    "Forced" boolean DEFAULT false NOT NULL
);


ALTER TABLE redirect."Link" OWNER TO rvr_poweruser;

--
-- Name: LinkType; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."LinkType" (
    "Id" bigint NOT NULL,
    "Type" text,
    "Product_Id" bigint NOT NULL,
    "IsDefault" boolean NOT NULL
);


ALTER TABLE redirect."LinkType" OWNER TO rvr_poweruser;

--
-- Name: Product; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."Product" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Code" text,
    "IsDefault" boolean NOT NULL
);


ALTER TABLE redirect."Product" OWNER TO rvr_poweruser;

--
-- Name: ProductVersion; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."ProductVersion" (
    "Id" bigint NOT NULL,
    "Version" text,
    "Product_Id" bigint NOT NULL,
    "IsDefault" boolean NOT NULL
);


ALTER TABLE redirect."ProductVersion" OWNER TO rvr_poweruser;

--
-- Name: Build_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."Build_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."Build_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Build_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."Build_Id_seq" OWNED BY redirect."Build"."Id";


--
-- Name: LinkParameter; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."LinkParameter" (
    "Link_Id" bigint NOT NULL,
    "Parameter_Id" bigint NOT NULL
);


ALTER TABLE redirect."LinkParameter" OWNER TO rvr_poweruser;

--
-- Name: LinkType_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."LinkType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."LinkType_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: LinkType_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."LinkType_Id_seq" OWNED BY redirect."LinkType"."Id";


--
-- Name: Link_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."Link_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."Link_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Link_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."Link_Id_seq" OWNED BY redirect."Link"."Id";


--
-- Name: NotificationEmail; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."NotificationEmail" (
    "Id" bigint NOT NULL,
    "Email" text
);


ALTER TABLE redirect."NotificationEmail" OWNER TO rvr_poweruser;

--
-- Name: NotificationEmail_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."NotificationEmail_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."NotificationEmail_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: NotificationEmail_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."NotificationEmail_Id_seq" OWNED BY redirect."NotificationEmail"."Id";


--
-- Name: Parameter; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."Parameter" (
    "Id" bigint NOT NULL,
    "Value" text,
    "Build_Id" bigint NOT NULL,
    "Name_Id" bigint NOT NULL
);


ALTER TABLE redirect."Parameter" OWNER TO rvr_poweruser;

--
-- Name: ParameterName; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."ParameterName" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Product_Id" bigint NOT NULL,
    "IsDefault" boolean DEFAULT false NOT NULL
);


ALTER TABLE redirect."ParameterName" OWNER TO rvr_poweruser;

--
-- Name: ParameterName_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."ParameterName_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."ParameterName_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: ParameterName_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."ParameterName_Id_seq" OWNED BY redirect."ParameterName"."Id";


--
-- Name: Parameter_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."Parameter_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."Parameter_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Parameter_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."Parameter_Id_seq" OWNED BY redirect."Parameter"."Id";


--
-- Name: ProductVersion_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."ProductVersion_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."ProductVersion_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: ProductVersion_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."ProductVersion_Id_seq" OWNED BY redirect."ProductVersion"."Id";


--
-- Name: Product_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."Product_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."Product_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Product_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."Product_Id_seq" OWNED BY redirect."Product"."Id";


--
-- Name: PurchaseSetting; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."PurchaseSetting" (
    "Id" bigint NOT NULL,
    "PageTitle" text,
    "Height" integer DEFAULT 0 NOT NULL,
    "Width" integer DEFAULT 0 NOT NULL,
    "IsDefault" boolean DEFAULT false NOT NULL
);


ALTER TABLE redirect."PurchaseSetting" OWNER TO rvr_poweruser;

--
-- Name: PurchaseSetting_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."PurchaseSetting_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."PurchaseSetting_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: PurchaseSetting_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."PurchaseSetting_Id_seq" OWNED BY redirect."PurchaseSetting"."Id";


--
-- Name: Setting; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."Setting" (
    "Id" bigint NOT NULL,
    "Name" text,
    "Value" text
);


ALTER TABLE redirect."Setting" OWNER TO rvr_poweruser;

--
-- Name: Setting_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."Setting_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."Setting_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: Setting_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."Setting_Id_seq" OWNED BY redirect."Setting"."Id";


--
-- Name: UnknownProduct; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."UnknownProduct" (
    "Id" bigint NOT NULL,
    "Code" text,
    "Url" text,
    "Date" timestamp(6) without time zone NOT NULL
);


ALTER TABLE redirect."UnknownProduct" OWNER TO rvr_poweruser;

--
-- Name: UnknownProduct_Id_seq; Type: SEQUENCE; Schema: redirect; Owner: rvr_poweruser
--

CREATE SEQUENCE redirect."UnknownProduct_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."UnknownProduct_Id_seq" OWNER TO rvr_poweruser;

--
-- Name: UnknownProduct_Id_seq; Type: SEQUENCE OWNED BY; Schema: redirect; Owner: rvr_poweruser
--

ALTER SEQUENCE redirect."UnknownProduct_Id_seq" OWNED BY redirect."UnknownProduct"."Id";


--
-- Name: __MigrationHistory; Type: TABLE; Schema: redirect; Owner: rvr_poweruser
--

CREATE TABLE redirect."__MigrationHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ContextKey" character varying(300) NOT NULL,
    "ProductVersion" character varying(32),
    "Model" bytea
);


ALTER TABLE redirect."__MigrationHistory" OWNER TO rvr_poweruser;

--
-- Name: Drivers Id; Type: DEFAULT; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_all_drivers."Drivers" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_all_drivers."Drivers_Id_seq"'::regclass);


--
-- Name: BanRules Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."BanRules" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."BanRules_Id_seq"'::regclass);


--
-- Name: Device Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Device" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Device_Id_seq"'::regclass);


--
-- Name: DeviceHardware Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."DeviceHardware" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."DeviceHardware_Id_seq"'::regclass);


--
-- Name: DownloadedFiles Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."DownloadedFiles" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."DownloadedFiles_Id_seq"'::regclass);


--
-- Name: Drivers Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Drivers" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Drivers_Id_seq"'::regclass);


--
-- Name: Errors Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Errors" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Errors_Id_seq"'::regclass);


--
-- Name: FeatureConfiguration Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."FeatureConfiguration" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."FeatureConfiguration_Id_seq"'::regclass);


--
-- Name: Feedbacks Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Feedbacks" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Feedbacks_Id_seq"'::regclass);


--
-- Name: Hardware Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Hardware" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Hardware_Id_seq"'::regclass);


--
-- Name: Laptop Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Laptop" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Laptop_Id_seq"'::regclass);


--
-- Name: Manufacturers Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Manufacturers" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Manufacturers_Id_seq"'::regclass);


--
-- Name: OperatingSystem Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."OperatingSystem" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."OperatingSystem_Id_seq"'::regclass);


--
-- Name: Package Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Package" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Package_Id_seq"'::regclass);


--
-- Name: PackageHardwareOS Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."PackageHardwareOS" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."PackageHardwareOS_Id_seq"'::regclass);


--
-- Name: ProviderHistories Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."ProviderHistories" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."ProviderHistories_Id_seq"'::regclass);


--
-- Name: ProviderItem Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."ProviderItem" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."ProviderItem_Id_seq"'::regclass);


--
-- Name: Providers Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Providers" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Providers_Id_seq"'::regclass);


--
-- Name: Settings Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Settings" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."Settings_Id_seq"'::regclass);


--
-- Name: UnknownOSes Id; Type: DEFAULT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."UnknownOSes" ALTER COLUMN "Id" SET DEFAULT nextval('driverreviver_v2."UnknownOSes_Id_seq"'::regclass);


--
-- Name: Feedbacks Id; Type: DEFAULT; Schema: feedbacks; Owner: rvr_poweruser
--

ALTER TABLE ONLY feedbacks."Feedbacks" ALTER COLUMN "Id" SET DEFAULT nextval('feedbacks."Feedbacks_Id_seq"'::regclass);


--
-- Name: AppsDetecteds Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."AppsDetecteds" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."AppsDetecteds_Id_seq"'::regclass);


--
-- Name: Groups Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Groups" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."Groups_Id_seq"'::regclass);


--
-- Name: InstallerAppsDetecteds Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."InstallerAppsDetecteds" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."InstallerAppsDetecteds_Id_seq"'::regclass);


--
-- Name: InstallerDetails Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."InstallerDetails" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."InstallerDetails_Id_seq"'::regclass);


--
-- Name: ListItems Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."ListItems" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."ListItems_Id_seq"'::regclass);


--
-- Name: Lists Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Lists" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."Lists_Id_seq"'::regclass);


--
-- Name: RawMainDatas Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."RawMainDatas" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."RawMainDatas_Id_seq"'::regclass);


--
-- Name: RawRemovedToolbarDatas Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."RawRemovedToolbarDatas" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."RawRemovedToolbarDatas_Id_seq"'::regclass);


--
-- Name: RawToolbarDatas Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."RawToolbarDatas" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."RawToolbarDatas_Id_seq"'::regclass);


--
-- Name: Recommendations Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Recommendations" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."Recommendations_Id_seq"'::regclass);


--
-- Name: RemovedToolbars Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."RemovedToolbars" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."RemovedToolbars_Id_seq"'::regclass);


--
-- Name: Toolbars Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Toolbars" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."Toolbars_Id_seq"'::regclass);


--
-- Name: UInstallerDetails Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."UInstallerDetails" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."UInstallerDetails_Id_seq"'::regclass);


--
-- Name: UidToolbars Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."UidToolbars" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."UidToolbars_Id_seq"'::regclass);


--
-- Name: UidWin32 Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."UidWin32" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."UidWin32_Id_seq"'::regclass);


--
-- Name: UserInfoes Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."UserInfoes" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."UserInfoes_Id_seq"'::regclass);


--
-- Name: Win32_OperatingSystem Id; Type: DEFAULT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Win32_OperatingSystem" ALTER COLUMN "Id" SET DEFAULT nextval('installsafe."Win32_OperatingSystem_Id_seq"'::regclass);


--
-- Name: averageAudience id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."averageAudience" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."averageAudience_id_seq"'::regclass);


--
-- Name: links id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats.links ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats.links_id_seq'::regclass);


--
-- Name: messageSnapshots id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messageSnapshots" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messageSnapshots_id_seq"'::regclass);


--
-- Name: messagesHistory id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesHistory_id_seq"'::regclass);


--
-- Name: messagesHistoryShortTerm id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesHistoryShortTerm_id_seq"'::regclass);


--
-- Name: messagesSendingStats id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesSendingStats" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesSendingStats_id_seq"'::regclass);


--
-- Name: messagesVolume id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesVolume" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."messagesVolume_id_seq"'::regclass);


--
-- Name: potentialUsersStatsSrc id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."potentialUsersStatsSrc" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."potentialUsersStatsSrc_id_seq"'::regclass);


--
-- Name: topMsgs id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."topMsgs" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."topMsgs_id_seq"'::regclass);


--
-- Name: userDataSnapshots id; Type: DEFAULT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."userDataSnapshots" ALTER COLUMN id SET DEFAULT nextval('msghistoryandstats."userDataSnapshots_id_seq"'::regclass);


--
-- Name: Build Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Build" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."Build_Id_seq"'::regclass);


--
-- Name: Link Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Link" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."Link_Id_seq"'::regclass);


--
-- Name: LinkType Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."LinkType" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."LinkType_Id_seq"'::regclass);


--
-- Name: NotificationEmail Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."NotificationEmail" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."NotificationEmail_Id_seq"'::regclass);


--
-- Name: Parameter Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Parameter" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."Parameter_Id_seq"'::regclass);


--
-- Name: ParameterName Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."ParameterName" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."ParameterName_Id_seq"'::regclass);


--
-- Name: Product Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Product" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."Product_Id_seq"'::regclass);


--
-- Name: ProductVersion Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."ProductVersion" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."ProductVersion_Id_seq"'::regclass);


--
-- Name: PurchaseSetting Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."PurchaseSetting" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."PurchaseSetting_Id_seq"'::regclass);


--
-- Name: Setting Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Setting" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."Setting_Id_seq"'::regclass);


--
-- Name: UnknownProduct Id; Type: DEFAULT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."UnknownProduct" ALTER COLUMN "Id" SET DEFAULT nextval('redirect."UnknownProduct_Id_seq"'::regclass);


--
-- Name: Drivers Drivers_pkey; Type: CONSTRAINT; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_all_drivers."Drivers"
    ADD CONSTRAINT "Drivers_pkey" PRIMARY KEY ("Id");


--
-- Name: BanRules BanRules_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."BanRules"
    ADD CONSTRAINT "BanRules_pkey" PRIMARY KEY ("Id");


--
-- Name: DeviceHardware DeviceHardware_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."DeviceHardware"
    ADD CONSTRAINT "DeviceHardware_pkey" PRIMARY KEY ("Id");


--
-- Name: Device Device_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Device"
    ADD CONSTRAINT "Device_pkey" PRIMARY KEY ("Id");


--
-- Name: Drivers Drivers_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Drivers"
    ADD CONSTRAINT "Drivers_pkey" PRIMARY KEY ("Id");


--
-- Name: Errors Errors_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Errors"
    ADD CONSTRAINT "Errors_pkey" PRIMARY KEY ("Id");


--
-- Name: Feedbacks Feedbacks_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Feedbacks"
    ADD CONSTRAINT "Feedbacks_pkey" PRIMARY KEY ("Id");


--
-- Name: Hardware Hardware_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Hardware"
    ADD CONSTRAINT "Hardware_pkey" PRIMARY KEY ("Id");


--
-- Name: Laptop Laptop_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Laptop"
    ADD CONSTRAINT "Laptop_pkey" PRIMARY KEY ("Id");


--
-- Name: Manufacturers ManufacturersDistinct_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Manufacturers"
    ADD CONSTRAINT "ManufacturersDistinct_pkey" PRIMARY KEY ("Id");


--
-- Name: OperatingSystem OperatingSystem_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."OperatingSystem"
    ADD CONSTRAINT "OperatingSystem_pkey" PRIMARY KEY ("Id");


--
-- Name: DeviceDeviceHardware PK_DeviceDeviceHardware; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."DeviceDeviceHardware"
    ADD CONSTRAINT "PK_DeviceDeviceHardware" PRIMARY KEY ("Device_Id", "DeviceHardware_Id");


--
-- Name: DownloadedFilePackage PK_DownloadedFilePackage; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."DownloadedFilePackage"
    ADD CONSTRAINT "PK_DownloadedFilePackage" PRIMARY KEY ("Package_Id", "DownloadedFile_Id");


--
-- Name: DownloadedFiles PK_DownloadedFiles; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."DownloadedFiles"
    ADD CONSTRAINT "PK_DownloadedFiles" PRIMARY KEY ("Id", "Hash");


--
-- Name: LaptopDevice PK_LaptopDevice; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."LaptopDevice"
    ADD CONSTRAINT "PK_LaptopDevice" PRIMARY KEY ("Laptop_Id", "Device_Id");


--
-- Name: __MigrationHistory PK___MigrationHistory; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."__MigrationHistory"
    ADD CONSTRAINT "PK___MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey");


--
-- Name: FeatureConfiguration PK_driverreviver_v2.FeatureConfiguration; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."FeatureConfiguration"
    ADD CONSTRAINT "PK_driverreviver_v2.FeatureConfiguration" PRIMARY KEY ("Id");


--
-- Name: ProviderHistories PK_driverreviver_v2.ProviderHistories; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."ProviderHistories"
    ADD CONSTRAINT "PK_driverreviver_v2.ProviderHistories" PRIMARY KEY ("Id");


--
-- Name: PackageHardwareOS PackageHardwareOS_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."PackageHardwareOS"
    ADD CONSTRAINT "PackageHardwareOS_pkey" PRIMARY KEY ("Id");


--
-- Name: Package Package_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Package"
    ADD CONSTRAINT "Package_pkey" PRIMARY KEY ("Id");


--
-- Name: ProviderItem ProviderItem_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."ProviderItem"
    ADD CONSTRAINT "ProviderItem_pkey" PRIMARY KEY ("Id");


--
-- Name: Providers Providers_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Providers"
    ADD CONSTRAINT "Providers_pkey" PRIMARY KEY ("Id");


--
-- Name: Settings Settings_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Settings"
    ADD CONSTRAINT "Settings_pkey" PRIMARY KEY ("Id");


--
-- Name: UnknownOSes UnknownOSes_pkey; Type: CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."UnknownOSes"
    ADD CONSTRAINT "UnknownOSes_pkey" PRIMARY KEY ("Id");


--
-- Name: Feedbacks Feedbacks_pkey; Type: CONSTRAINT; Schema: feedbacks; Owner: rvr_poweruser
--

ALTER TABLE ONLY feedbacks."Feedbacks"
    ADD CONSTRAINT "Feedbacks_pkey" PRIMARY KEY ("Id");


--
-- Name: __MigrationHistory PK___MigrationHistory; Type: CONSTRAINT; Schema: feedbacks; Owner: rvr_poweruser
--

ALTER TABLE ONLY feedbacks."__MigrationHistory"
    ADD CONSTRAINT "PK___MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey");


--
-- Name: AppsDetecteds AppsDetecteds_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."AppsDetecteds"
    ADD CONSTRAINT "AppsDetecteds_pkey" PRIMARY KEY ("Id");


--
-- Name: Groups Groups_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Groups"
    ADD CONSTRAINT "Groups_pkey" PRIMARY KEY ("Id");


--
-- Name: InstallerAppsDetecteds InstallerAppsDetecteds_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."InstallerAppsDetecteds"
    ADD CONSTRAINT "InstallerAppsDetecteds_pkey" PRIMARY KEY ("Id");


--
-- Name: InstallerDetails InstallerDetails_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."InstallerDetails"
    ADD CONSTRAINT "InstallerDetails_pkey" PRIMARY KEY ("Id");


--
-- Name: ListItems ListItems_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."ListItems"
    ADD CONSTRAINT "ListItems_pkey" PRIMARY KEY ("Id");


--
-- Name: Lists Lists_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Lists"
    ADD CONSTRAINT "Lists_pkey" PRIMARY KEY ("Id");


--
-- Name: GroupRecommendations PK_GroupRecommendations; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."GroupRecommendations"
    ADD CONSTRAINT "PK_GroupRecommendations" PRIMARY KEY ("Group_Id", "Recommendation_Id");


--
-- Name: __MigrationHistory PK___MigrationHistory; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."__MigrationHistory"
    ADD CONSTRAINT "PK___MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey");


--
-- Name: RawMainDatas RawMainDatas_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."RawMainDatas"
    ADD CONSTRAINT "RawMainDatas_pkey" PRIMARY KEY ("Id");


--
-- Name: RawRemovedToolbarDatas RawRemovedToolbarDatas_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."RawRemovedToolbarDatas"
    ADD CONSTRAINT "RawRemovedToolbarDatas_pkey" PRIMARY KEY ("Id");


--
-- Name: RawToolbarDatas RawToolbarDatas_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."RawToolbarDatas"
    ADD CONSTRAINT "RawToolbarDatas_pkey" PRIMARY KEY ("Id");


--
-- Name: Recommendations Recommendations_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Recommendations"
    ADD CONSTRAINT "Recommendations_pkey" PRIMARY KEY ("Id");


--
-- Name: RemovedToolbars RemovedToolbars_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."RemovedToolbars"
    ADD CONSTRAINT "RemovedToolbars_pkey" PRIMARY KEY ("Id");


--
-- Name: Toolbars Toolbars_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Toolbars"
    ADD CONSTRAINT "Toolbars_pkey" PRIMARY KEY ("Id");


--
-- Name: UInstallerDetails UInstallerDetails_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."UInstallerDetails"
    ADD CONSTRAINT "UInstallerDetails_pkey" PRIMARY KEY ("Id");


--
-- Name: UidToolbars UidToolbars_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."UidToolbars"
    ADD CONSTRAINT "UidToolbars_pkey" PRIMARY KEY ("Id");


--
-- Name: UidWin32 UidWin32_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."UidWin32"
    ADD CONSTRAINT "UidWin32_pkey" PRIMARY KEY ("Id");


--
-- Name: UserInfoes UserInfoes_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."UserInfoes"
    ADD CONSTRAINT "UserInfoes_pkey" PRIMARY KEY ("Id");


--
-- Name: Win32_OperatingSystem Win32_OperatingSystem_pkey; Type: CONSTRAINT; Schema: installsafe; Owner: rvr_poweruser
--

ALTER TABLE ONLY installsafe."Win32_OperatingSystem"
    ADD CONSTRAINT "Win32_OperatingSystem_pkey" PRIMARY KEY ("Id");


--
-- Name: averageAudience averageAudience_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."averageAudience"
    ADD CONSTRAINT "averageAudience_pkey" PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: messageSnapshots messageSnapshots_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messageSnapshots"
    ADD CONSTRAINT "messageSnapshots_pkey" PRIMARY KEY (id);


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_pkey" PRIMARY KEY (id);


--
-- Name: messagesHistory messagesHistory_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_pkey" PRIMARY KEY (id);


--
-- Name: messagesSendingStats messagesSendingStats_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesSendingStats"
    ADD CONSTRAINT "messagesSendingStats_pkey" PRIMARY KEY (id);


--
-- Name: messagesVolume messagesVolume_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesVolume"
    ADD CONSTRAINT "messagesVolume_pkey" PRIMARY KEY (id);


--
-- Name: potentialUsersStatsSrc potentialUsersStatsSrc_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."potentialUsersStatsSrc"
    ADD CONSTRAINT "potentialUsersStatsSrc_pkey" PRIMARY KEY (id);


--
-- Name: topMsgs topMsgs_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."topMsgs"
    ADD CONSTRAINT "topMsgs_pkey" PRIMARY KEY (id);


--
-- Name: userDataSnapshots userDataSnapshots_pkey; Type: CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."userDataSnapshots"
    ADD CONSTRAINT "userDataSnapshots_pkey" PRIMARY KEY (id);


--
-- Name: Build Build_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Build"
    ADD CONSTRAINT "Build_pkey" PRIMARY KEY ("Id");


--
-- Name: LinkType LinkType_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."LinkType"
    ADD CONSTRAINT "LinkType_pkey" PRIMARY KEY ("Id");


--
-- Name: Link Link_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Link"
    ADD CONSTRAINT "Link_pkey" PRIMARY KEY ("Id");


--
-- Name: NotificationEmail NotificationEmail_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."NotificationEmail"
    ADD CONSTRAINT "NotificationEmail_pkey" PRIMARY KEY ("Id");


--
-- Name: LinkParameter PK_LinkParameter; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."LinkParameter"
    ADD CONSTRAINT "PK_LinkParameter" PRIMARY KEY ("Link_Id", "Parameter_Id");


--
-- Name: __MigrationHistory PK___MigrationHistory; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."__MigrationHistory"
    ADD CONSTRAINT "PK___MigrationHistory" PRIMARY KEY ("MigrationId", "ContextKey");


--
-- Name: PurchaseSetting PK_redirect.PurchaseSetting; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."PurchaseSetting"
    ADD CONSTRAINT "PK_redirect.PurchaseSetting" PRIMARY KEY ("Id");


--
-- Name: ParameterName ParameterName_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."ParameterName"
    ADD CONSTRAINT "ParameterName_pkey" PRIMARY KEY ("Id");


--
-- Name: Parameter Parameter_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Parameter"
    ADD CONSTRAINT "Parameter_pkey" PRIMARY KEY ("Id");


--
-- Name: ProductVersion ProductVersion_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."ProductVersion"
    ADD CONSTRAINT "ProductVersion_pkey" PRIMARY KEY ("Id");


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("Id");


--
-- Name: Setting Setting_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Setting"
    ADD CONSTRAINT "Setting_pkey" PRIMARY KEY ("Id");


--
-- Name: UnknownProduct UnknownProduct_pkey; Type: CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."UnknownProduct"
    ADD CONSTRAINT "UnknownProduct_pkey" PRIMARY KEY ("Id");


--
-- Name: idxDrivers_DriverId; Type: INDEX; Schema: driverreviver; Owner: rvr_poweruser
--

CREATE INDEX "idxDrivers_DriverId" ON driverreviver."Drivers" USING btree ("DriverId");

ALTER TABLE driverreviver."Drivers" CLUSTER ON "idxDrivers_DriverId";


--
-- Name: idxDrivers_OS_HardwareId; Type: INDEX; Schema: driverreviver; Owner: rvr_poweruser
--

CREATE INDEX "idxDrivers_OS_HardwareId" ON driverreviver."Drivers" USING btree ("OS", "HardwareId");


--
-- Name: idxDrivers_DriverId; Type: INDEX; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

CREATE INDEX "idxDrivers_DriverId" ON driverreviver_all_drivers."Drivers" USING btree ("DriverId");

ALTER TABLE driverreviver_all_drivers."Drivers" CLUSTER ON "idxDrivers_DriverId";


--
-- Name: idxDrivers_OS_HardwareId; Type: INDEX; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

CREATE INDEX "idxDrivers_OS_HardwareId" ON driverreviver_all_drivers."Drivers" USING btree ("OS", "HardwareId");


--
-- Name: Manufacturers_IX_Name; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE UNIQUE INDEX "Manufacturers_IX_Name" ON driverreviver_v2."Manufacturers" USING btree ("Name");


--
-- Name: Manufacturers_IX_ParentId; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "Manufacturers_IX_ParentId" ON driverreviver_v2."Manufacturers" USING btree ("ParentId");


--
-- Name: ProviderHistories_IX_Provider_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "ProviderHistories_IX_Provider_Id" ON driverreviver_v2."ProviderHistories" USING btree ("Provider_Id");


--
-- Name: feedbacks_select_idx; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX feedbacks_select_idx ON driverreviver_v2."Feedbacks" USING btree ("Date", "Email", "Type", "Id", "Message", "HardwareId", "OS", "Architecture", "Build", "Status", "Memo", "Unclear");


--
-- Name: idxDeviceDeviceHardware_DeviceHardware_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDeviceDeviceHardware_DeviceHardware_Id" ON driverreviver_v2."DeviceDeviceHardware" USING btree ("DeviceHardware_Id");


--
-- Name: idxDeviceDeviceHardware_Device_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDeviceDeviceHardware_Device_Id" ON driverreviver_v2."DeviceDeviceHardware" USING btree ("Device_Id");


--
-- Name: idxDeviceHardware_Hardware_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDeviceHardware_Hardware_Id" ON driverreviver_v2."DeviceHardware" USING btree ("Hardware_Id");


--
-- Name: idxDeviceHardware_Hardware_Id_IsCompatible; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDeviceHardware_Hardware_Id_IsCompatible" ON driverreviver_v2."DeviceHardware" USING btree ("IsCompatible", "Hardware_Id");


--
-- Name: idxDevice_Hash; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDevice_Hash" ON driverreviver_v2."Device" USING btree ("Hash");


--
-- Name: idxDownloadedFilePackage_DownloadedFile_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDownloadedFilePackage_DownloadedFile_Id" ON driverreviver_v2."DownloadedFilePackage" USING btree ("DownloadedFile_Id");


--
-- Name: idxDownloadedFilePackage_Package_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDownloadedFilePackage_Package_Id" ON driverreviver_v2."DownloadedFilePackage" USING btree ("Package_Id");


--
-- Name: idxDrivers_DriverId; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDrivers_DriverId" ON driverreviver_v2."Drivers" USING btree ("DriverId");

ALTER TABLE driverreviver_v2."Drivers" CLUSTER ON "idxDrivers_DriverId";


--
-- Name: idxDrivers_OS_HardwareId; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDrivers_OS_HardwareId" ON driverreviver_v2."Drivers" USING btree ("OS", "HardwareId");


--
-- Name: idxDrivers_OS_HardwareId_lowercase; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxDrivers_OS_HardwareId_lowercase" ON driverreviver_v2."Drivers" USING btree ("OS", lower(("HardwareId")::text));


--
-- Name: idxHardware_HardwareId; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxHardware_HardwareId" ON driverreviver_v2."Hardware" USING btree ("HardwareId");


--
-- Name: idxLaptopDevice_Device_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxLaptopDevice_Device_Id" ON driverreviver_v2."LaptopDevice" USING btree ("Device_Id");


--
-- Name: idxLaptopDevice_Laptop_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxLaptopDevice_Laptop_Id" ON driverreviver_v2."LaptopDevice" USING btree ("Laptop_Id");


--
-- Name: idxLaptop_Hash; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxLaptop_Hash" ON driverreviver_v2."Laptop" USING btree ("Hash");


--
-- Name: idxPackageHardwareOS_Hardware_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxPackageHardwareOS_Hardware_Id" ON driverreviver_v2."PackageHardwareOS" USING btree ("Hardware_Id");


--
-- Name: idxPackageHardwareOS_OS_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxPackageHardwareOS_OS_Id" ON driverreviver_v2."PackageHardwareOS" USING btree ("OS_Id");


--
-- Name: idxPackageHardwareOS_Package_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxPackageHardwareOS_Package_Id" ON driverreviver_v2."PackageHardwareOS" USING btree ("Package_Id");


--
-- Name: idxProviderItem_File_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxProviderItem_File_Id" ON driverreviver_v2."ProviderItem" USING btree ("File_Id");


--
-- Name: idxProviderItem_Parent_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxProviderItem_Parent_Id" ON driverreviver_v2."ProviderItem" USING btree ("Parent_Id");


--
-- Name: idxProviderItem_Provider_Id; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX "idxProviderItem_Provider_Id" ON driverreviver_v2."ProviderItem" USING btree ("Provider_Id");


--
-- Name: unknownoses_select_all_idx; Type: INDEX; Schema: driverreviver_v2; Owner: rvr_poweruser
--

CREATE INDEX unknownoses_select_all_idx ON driverreviver_v2."UnknownOSes" USING btree ("Id", "OS", "Url");


--
-- Name: Feedbacks_IX_CreatedAt; Type: INDEX; Schema: feedbacks; Owner: rvr_poweruser
--

CREATE INDEX "Feedbacks_IX_CreatedAt" ON feedbacks."Feedbacks" USING btree ("CreatedAt");


--
-- Name: Feedbacks_IX_Email; Type: INDEX; Schema: feedbacks; Owner: rvr_poweruser
--

CREATE INDEX "Feedbacks_IX_Email" ON feedbacks."Feedbacks" USING btree ("Email");


--
-- Name: Feedbacks_IX_ProductCode; Type: INDEX; Schema: feedbacks; Owner: rvr_poweruser
--

CREATE INDEX "Feedbacks_IX_ProductCode" ON feedbacks."Feedbacks" USING btree ("ProductCode");


--
-- Name: InstallerDetails_Hash_idx; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "InstallerDetails_Hash_idx" ON installsafe."InstallerDetails" USING btree ("Hash");


--
-- Name: UInstallerDetails_Hash_idx; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "UInstallerDetails_Hash_idx" ON installsafe."UInstallerDetails" USING btree ("Hash");


--
-- Name: UserInfoes_Id_idx; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "UserInfoes_Id_idx" ON installsafe."UserInfoes" USING btree ("Id");


--
-- Name: UserInfoes_uuid_idx; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "UserInfoes_uuid_idx" ON installsafe."UserInfoes" USING btree (uuid);


--
-- Name: Win32_OperatingSystem_Hash_idx; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "Win32_OperatingSystem_Hash_idx" ON installsafe."Win32_OperatingSystem" USING btree ("Hash");


--
-- Name: idxGroupRecommendations_Group_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxGroupRecommendations_Group_Id" ON installsafe."GroupRecommendations" USING btree ("Group_Id");


--
-- Name: idxGroupRecommendations_Recommendation_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxGroupRecommendations_Recommendation_Id" ON installsafe."GroupRecommendations" USING btree ("Recommendation_Id");


--
-- Name: idxGroups_Name; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxGroups_Name" ON installsafe."Groups" USING btree ("Name");


--
-- Name: idxInstallerAppsDetecteds_AppsDetected_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxInstallerAppsDetecteds_AppsDetected_Id" ON installsafe."InstallerAppsDetecteds" USING btree ("AppsDetected_Id");


--
-- Name: idxInstallerAppsDetecteds_InstallerDetails_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxInstallerAppsDetecteds_InstallerDetails_Id" ON installsafe."InstallerAppsDetecteds" USING btree ("InstallerDetails_Id");


--
-- Name: idxListItems_AppsDetected_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxListItems_AppsDetected_Id" ON installsafe."ListItems" USING btree ("AppsDetected_Id");


--
-- Name: idxListItems_List_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxListItems_List_Id" ON installsafe."ListItems" USING btree ("List_Id");


--
-- Name: idxListItems_Toolbar_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxListItems_Toolbar_Id" ON installsafe."ListItems" USING btree ("Toolbar_Id");


--
-- Name: idxRecommendations_List_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxRecommendations_List_Id" ON installsafe."Recommendations" USING btree ("List_Id");


--
-- Name: idxRemovedToolbars_RemovedToolbarsId; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxRemovedToolbars_RemovedToolbarsId" ON installsafe."RemovedToolbars" USING btree ("RemovedToolbarId");


--
-- Name: idxToolbars_Name_Version_Group_Publisher; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxToolbars_Name_Version_Group_Publisher" ON installsafe."Toolbars" USING btree ("Name", "Publisher", "Version", "Group");


--
-- Name: idxToolbars_Recommendation_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxToolbars_Recommendation_Id" ON installsafe."Toolbars" USING btree ("Recommendation_Id");


--
-- Name: idxUInstallerDetails_InstallerDetails_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxUInstallerDetails_InstallerDetails_Id" ON installsafe."UInstallerDetails" USING btree ("InstallerDetails_Id");


--
-- Name: idxUInstallerDetails_UserInfo_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxUInstallerDetails_UserInfo_Id" ON installsafe."UInstallerDetails" USING btree ("UserInfo_Id");


--
-- Name: idxUidToolbars_Toolbar_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxUidToolbars_Toolbar_Id" ON installsafe."UidToolbars" USING btree ("Toolbar_Id");


--
-- Name: idxUidToolbars_UserInfo_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxUidToolbars_UserInfo_Id" ON installsafe."UidToolbars" USING btree ("UserInfo_Id");


--
-- Name: idxUidWin32_UserInfo_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxUidWin32_UserInfo_Id" ON installsafe."UidWin32" USING btree ("UserInfo_Id");


--
-- Name: idxUidWin32_Win32_OperatingSystem_Id; Type: INDEX; Schema: installsafe; Owner: rvr_poweruser
--

CREATE INDEX "idxUidWin32_Win32_OperatingSystem_Id" ON installsafe."UidWin32" USING btree ("Win32_OperatingSystem_Id");


--
-- Name: messages_history_request_date; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX messages_history_request_date ON msghistoryandstats."messagesHistory" USING btree ("requestDate");


--
-- Name: messages_history_short_term_prodCode; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX "messages_history_short_term_prodCode" ON msghistoryandstats."messagesHistoryShortTerm" USING gin (((((json -> 'request'::text) -> 'application'::text) -> 'prodCode'::text)));


--
-- Name: messages_history_short_term_request_date; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX messages_history_short_term_request_date ON msghistoryandstats."messagesHistoryShortTerm" USING btree ("requestDate");


--
-- Name: messages_history_short_term_uid; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX messages_history_short_term_uid ON msghistoryandstats."messagesHistoryShortTerm" USING gin (((((json -> 'request'::text) -> 'application'::text) -> 'uid'::text)));


--
-- Name: messages_history_user_snapshots; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX messages_history_user_snapshots ON msghistoryandstats."messagesHistory" USING btree ("userDataSnapshotId");


--
-- Name: messages_sending_stats_date; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX messages_sending_stats_date ON msghistoryandstats."messagesSendingStats" USING btree (date);


--
-- Name: messages_sending_stats_message_id; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX messages_sending_stats_message_id ON msghistoryandstats."messagesSendingStats" USING btree ("messageId");


--
-- Name: messages_sending_stats_message_type; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX messages_sending_stats_message_type ON msghistoryandstats."messagesSendingStats" USING btree ("messageType");


--
-- Name: msg_history_ipmSnapshotId; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX "msg_history_ipmSnapshotId" ON msghistoryandstats."messagesHistory" USING btree ("ipmSnapshotId") WHERE ("ipmSnapshotId" IS NOT NULL);


--
-- Name: potential_users_stats_src_build_id; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_build_id ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("buildId");


--
-- Name: potential_users_stats_src_check_type; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_check_type ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("checkType");


--
-- Name: potential_users_stats_src_country_code; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_country_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("countryCode");


--
-- Name: potential_users_stats_src_days_to_lic_expire; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_days_to_lic_expire ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("daysToLicExpire");


--
-- Name: potential_users_stats_src_dsi; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_dsi ON msghistoryandstats."potentialUsersStatsSrc" USING btree (msi);


--
-- Name: potential_users_stats_src_installed_product_codes; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_installed_product_codes ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("installedProductCodes");


--
-- Name: potential_users_stats_src_language_code; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_language_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("languageCode");


--
-- Name: potential_users_stats_src_lic_status; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_lic_status ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("licStatus");


--
-- Name: potential_users_stats_src_msi; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_msi ON msghistoryandstats."potentialUsersStatsSrc" USING btree (msi);


--
-- Name: potential_users_stats_src_product_code; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_product_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("productCode");


--
-- Name: potential_users_stats_src_user_ownership; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_user_ownership ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("userOwnership");


--
-- Name: potential_users_stats_src_user_uid; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_user_uid ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("userUid");


--
-- Name: potential_users_stats_src_version; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE INDEX potential_users_stats_src_version ON msghistoryandstats."potentialUsersStatsSrc" USING btree (version);


--
-- Name: user_data_snapshots_hash; Type: INDEX; Schema: msghistoryandstats; Owner: rvr_history_admin
--

CREATE UNIQUE INDEX user_data_snapshots_hash ON msghistoryandstats."userDataSnapshots" USING btree (hash);


--
-- Name: Build_IX_PurchaseSetting_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "Build_IX_PurchaseSetting_Id" ON redirect."Build" USING btree ("PurchaseSetting_Id");


--
-- Name: idxBuild_ProductVersion_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxBuild_ProductVersion_Id" ON redirect."Build" USING btree ("ProductVersion_Id");


--
-- Name: idxLinkParameter_Link_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxLinkParameter_Link_Id" ON redirect."LinkParameter" USING btree ("Link_Id");


--
-- Name: idxLinkParameter_Parameter_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxLinkParameter_Parameter_Id" ON redirect."LinkParameter" USING btree ("Parameter_Id");


--
-- Name: idxLinkType_Product_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxLinkType_Product_Id" ON redirect."LinkType" USING btree ("Product_Id");


--
-- Name: idxLink_Build_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxLink_Build_Id" ON redirect."Link" USING btree ("Build_Id");


--
-- Name: idxLink_Type_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxLink_Type_Id" ON redirect."Link" USING btree ("Type_Id");


--
-- Name: idxParameterName_Product_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxParameterName_Product_Id" ON redirect."ParameterName" USING btree ("Product_Id");


--
-- Name: idxParameter_Build_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxParameter_Build_Id" ON redirect."Parameter" USING btree ("Build_Id");


--
-- Name: idxParameter_Name_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxParameter_Name_Id" ON redirect."Parameter" USING btree ("Name_Id");


--
-- Name: idxProductVersion_Product_Id; Type: INDEX; Schema: redirect; Owner: rvr_poweruser
--

CREATE INDEX "idxProductVersion_Product_Id" ON redirect."ProductVersion" USING btree ("Product_Id");


--
-- Name: Manufacturers FK_driverreviver_v2.Manufacturers_driverreviver_v2.Manufacturer; Type: FK CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."Manufacturers"
    ADD CONSTRAINT "FK_driverreviver_v2.Manufacturers_driverreviver_v2.Manufacturer" FOREIGN KEY ("ParentId") REFERENCES driverreviver_v2."Manufacturers"("Id");


--
-- Name: ProviderHistories FK_driverreviver_v2.ProviderHistories_driverreviver_v2.Provider; Type: FK CONSTRAINT; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER TABLE ONLY driverreviver_v2."ProviderHistories"
    ADD CONSTRAINT "FK_driverreviver_v2.ProviderHistories_driverreviver_v2.Provider" FOREIGN KEY ("Provider_Id") REFERENCES driverreviver_v2."Providers"("Id");


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_ipmResponseLinkId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_ipmResponseLinkId_fkey" FOREIGN KEY ("ipmResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_ipmSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_ipmSnapshotId_fkey" FOREIGN KEY ("ipmSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_iptnResponseLinkId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_iptnResponseLinkId_fkey" FOREIGN KEY ("iptnResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_iptnSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_iptnSnapshotId_fkey" FOREIGN KEY ("iptnSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistoryShortTerm messagesHistoryShortTerm_userDataSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistoryShortTerm"
    ADD CONSTRAINT "messagesHistoryShortTerm_userDataSnapshotId_fkey" FOREIGN KEY ("userDataSnapshotId") REFERENCES msghistoryandstats."userDataSnapshots"(id) ON UPDATE CASCADE;


--
-- Name: messagesHistory messagesHistory_ipmResponseLinkId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_ipmResponseLinkId_fkey" FOREIGN KEY ("ipmResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistory messagesHistory_ipmSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_ipmSnapshotId_fkey" FOREIGN KEY ("ipmSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistory messagesHistory_iptnResponseLinkId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_iptnResponseLinkId_fkey" FOREIGN KEY ("iptnResponseLinkId") REFERENCES msghistoryandstats.links(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistory messagesHistory_iptnSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_iptnSnapshotId_fkey" FOREIGN KEY ("iptnSnapshotId") REFERENCES msghistoryandstats."messageSnapshots"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: messagesHistory messagesHistory_userDataSnapshotId_fkey; Type: FK CONSTRAINT; Schema: msghistoryandstats; Owner: rvr_history_admin
--

ALTER TABLE ONLY msghistoryandstats."messagesHistory"
    ADD CONSTRAINT "messagesHistory_userDataSnapshotId_fkey" FOREIGN KEY ("userDataSnapshotId") REFERENCES msghistoryandstats."userDataSnapshots"(id) ON UPDATE CASCADE;


--
-- Name: Build FK_redirect.Build_redirect.PurchaseSetting_PurchaseSetting_Id; Type: FK CONSTRAINT; Schema: redirect; Owner: rvr_poweruser
--

ALTER TABLE ONLY redirect."Build"
    ADD CONSTRAINT "FK_redirect.Build_redirect.PurchaseSetting_PurchaseSetting_Id" FOREIGN KEY ("PurchaseSetting_Id") REFERENCES redirect."PurchaseSetting"("Id");


--
-- Name: DATABASE reviversoft; Type: ACL; Schema: -; Owner: itadmin
--

REVOKE CONNECT,TEMPORARY ON DATABASE reviversoft FROM PUBLIC;
GRANT CONNECT ON DATABASE reviversoft TO dradmin;
GRANT TEMPORARY ON DATABASE reviversoft TO rvr_db_datawriter;
GRANT CONNECT ON DATABASE reviversoft TO rvr_poweruser;
GRANT CONNECT ON DATABASE reviversoft TO rvr_history_admin;
GRANT TEMPORARY ON DATABASE reviversoft TO rvr_hist_db_datawriter;
GRANT CONNECT ON DATABASE reviversoft TO rvr_history_reader;
GRANT TEMPORARY ON DATABASE reviversoft TO wz_hist_db_datawriter;
GRANT CONNECT ON DATABASE reviversoft TO rvr_desktop_user;
GRANT CONNECT ON DATABASE reviversoft TO phdata_db_datareader;


--
-- Name: SCHEMA driverreviver; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA driverreviver TO rvr_view_definition;
GRANT CREATE ON SCHEMA driverreviver TO rvr_db_dlladmin;
GRANT USAGE ON SCHEMA driverreviver TO phdata_view_definition;


--
-- Name: SCHEMA driverreviver_all_drivers; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA driverreviver_all_drivers TO rvr_view_definition;
GRANT CREATE ON SCHEMA driverreviver_all_drivers TO rvr_db_dlladmin;
GRANT USAGE ON SCHEMA driverreviver_all_drivers TO rvr_driver_view_definition;
GRANT USAGE ON SCHEMA driverreviver_all_drivers TO phdata_view_definition;


--
-- Name: SCHEMA driverreviver_test; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA driverreviver_test TO rvr_view_definition;
GRANT CREATE ON SCHEMA driverreviver_test TO rvr_db_dlladmin;
GRANT USAGE ON SCHEMA driverreviver_test TO phdata_view_definition;


--
-- Name: SCHEMA driverreviver_v2; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA driverreviver_v2 TO rvr_view_definition;
GRANT CREATE ON SCHEMA driverreviver_v2 TO rvr_db_dlladmin;
GRANT USAGE ON SCHEMA driverreviver_v2 TO rvr_driver_view_definition;
GRANT USAGE ON SCHEMA driverreviver_v2 TO phdata_view_definition;


--
-- Name: SCHEMA feedbacks; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA feedbacks TO rvr_view_definition;
GRANT CREATE ON SCHEMA feedbacks TO rvr_db_dlladmin;
GRANT USAGE ON SCHEMA feedbacks TO phdata_view_definition;


--
-- Name: SCHEMA installsafe; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA installsafe TO rvr_view_definition;
GRANT CREATE ON SCHEMA installsafe TO rvr_db_dlladmin;
GRANT USAGE ON SCHEMA installsafe TO phdata_view_definition;


--
-- Name: SCHEMA msghistoryandstats; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA msghistoryandstats TO rvr_hist_view_definition;
GRANT CREATE ON SCHEMA msghistoryandstats TO rvr_hist_db_dlladmin;
GRANT USAGE ON SCHEMA msghistoryandstats TO phdata_view_definition;


--
-- Name: SCHEMA redirect; Type: ACL; Schema: -; Owner: itadmin
--

GRANT USAGE ON SCHEMA redirect TO rvr_view_definition;
GRANT CREATE ON SCHEMA redirect TO rvr_db_dlladmin;
GRANT USAGE ON SCHEMA redirect TO phdata_view_definition;


--
-- Name: TABLE "Drivers"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Drivers" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Drivers" TO phdata_db_datareader;


--
-- Name: TABLE "Drivers"; Type: ACL; Schema: driverreviver; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver."Drivers" TO phdata_db_datareader;


--
-- Name: TABLE "Drivers"; Type: ACL; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_all_drivers."Drivers" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_all_drivers."Drivers" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Drivers_Id_seq"; Type: ACL; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_all_drivers."Drivers_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_all_drivers."Drivers_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "BanRules"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."BanRules" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."BanRules" TO phdata_db_datareader;


--
-- Name: SEQUENCE "BanRules_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."BanRules_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."BanRules_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Device"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Device" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Device" TO phdata_db_datareader;


--
-- Name: TABLE "DeviceDeviceHardware"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."DeviceDeviceHardware" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."DeviceDeviceHardware" TO phdata_db_datareader;


--
-- Name: TABLE "DeviceHardware"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."DeviceHardware" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."DeviceHardware" TO phdata_db_datareader;


--
-- Name: SEQUENCE "DeviceHardware_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."DeviceHardware_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."DeviceHardware_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Device_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Device_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Device_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "DownloadedFilePackage"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."DownloadedFilePackage" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."DownloadedFilePackage" TO phdata_db_datareader;


--
-- Name: TABLE "DownloadedFiles"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."DownloadedFiles" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."DownloadedFiles" TO phdata_db_datareader;


--
-- Name: SEQUENCE "DownloadedFiles_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."DownloadedFiles_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."DownloadedFiles_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Drivers_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Drivers_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Drivers_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Errors"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Errors" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Errors" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Errors_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Errors_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Errors_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "FeatureConfiguration"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."FeatureConfiguration" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."FeatureConfiguration" TO phdata_db_datareader;


--
-- Name: SEQUENCE "FeatureConfiguration_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."FeatureConfiguration_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."FeatureConfiguration_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Feedbacks"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Feedbacks" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Feedbacks" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Feedbacks_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Feedbacks_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Feedbacks_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Hardware"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Hardware" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Hardware" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Hardware_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Hardware_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Hardware_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Laptop"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Laptop" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Laptop" TO phdata_db_datareader;


--
-- Name: TABLE "LaptopDevice"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."LaptopDevice" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."LaptopDevice" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Laptop_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Laptop_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Laptop_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Manufacturers"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Manufacturers" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Manufacturers" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Manufacturers_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Manufacturers_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Manufacturers_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "OperatingSystem"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."OperatingSystem" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."OperatingSystem" TO phdata_db_datareader;


--
-- Name: SEQUENCE "OperatingSystem_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."OperatingSystem_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."OperatingSystem_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Package"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Package" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Package" TO phdata_db_datareader;


--
-- Name: TABLE "PackageHardwareOS"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."PackageHardwareOS" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."PackageHardwareOS" TO phdata_db_datareader;


--
-- Name: SEQUENCE "PackageHardwareOS_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."PackageHardwareOS_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."PackageHardwareOS_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Package_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Package_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Package_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "ProviderHistories"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."ProviderHistories" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."ProviderHistories" TO phdata_db_datareader;


--
-- Name: SEQUENCE "ProviderHistories_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."ProviderHistories_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."ProviderHistories_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "ProviderItem"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."ProviderItem" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."ProviderItem" TO phdata_db_datareader;


--
-- Name: SEQUENCE "ProviderItem_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."ProviderItem_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."ProviderItem_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Providers"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Providers" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Providers" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Providers_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Providers_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Providers_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Settings"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."Settings" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."Settings" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Settings_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Settings_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."Settings_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "UnknownOSes"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."UnknownOSes" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."UnknownOSes" TO phdata_db_datareader;


--
-- Name: SEQUENCE "UnknownOSes_Id_seq"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."UnknownOSes_Id_seq" TO rvr_driver_db_datareader;
GRANT SELECT,USAGE ON SEQUENCE driverreviver_v2."UnknownOSes_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "__MigrationHistory"; Type: ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE driverreviver_v2."__MigrationHistory" TO rvr_driver_db_datareader;
GRANT SELECT ON TABLE driverreviver_v2."__MigrationHistory" TO phdata_db_datareader;


--
-- Name: TABLE "Feedbacks"; Type: ACL; Schema: feedbacks; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE feedbacks."Feedbacks" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Feedbacks_Id_seq"; Type: ACL; Schema: feedbacks; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE feedbacks."Feedbacks_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "__MigrationHistory"; Type: ACL; Schema: feedbacks; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE feedbacks."__MigrationHistory" TO phdata_db_datareader;


--
-- Name: TABLE "AppsDetecteds"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."AppsDetecteds" TO phdata_db_datareader;


--
-- Name: SEQUENCE "AppsDetecteds_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."AppsDetecteds_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "GroupRecommendations"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."GroupRecommendations" TO phdata_db_datareader;


--
-- Name: TABLE "Groups"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."Groups" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Groups_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."Groups_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "InstallerAppsDetecteds"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."InstallerAppsDetecteds" TO phdata_db_datareader;


--
-- Name: SEQUENCE "InstallerAppsDetecteds_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."InstallerAppsDetecteds_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "InstallerDetails"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."InstallerDetails" TO phdata_db_datareader;


--
-- Name: SEQUENCE "InstallerDetails_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."InstallerDetails_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "ListItems"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."ListItems" TO phdata_db_datareader;


--
-- Name: SEQUENCE "ListItems_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."ListItems_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Lists"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."Lists" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Lists_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."Lists_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "RawMainDatas"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."RawMainDatas" TO phdata_db_datareader;


--
-- Name: SEQUENCE "RawMainDatas_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."RawMainDatas_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "RawRemovedToolbarDatas"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."RawRemovedToolbarDatas" TO phdata_db_datareader;


--
-- Name: SEQUENCE "RawRemovedToolbarDatas_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."RawRemovedToolbarDatas_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "RawToolbarDatas"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."RawToolbarDatas" TO phdata_db_datareader;


--
-- Name: SEQUENCE "RawToolbarDatas_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."RawToolbarDatas_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Recommendations"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."Recommendations" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Recommendations_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."Recommendations_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "RemovedToolbars"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."RemovedToolbars" TO phdata_db_datareader;


--
-- Name: SEQUENCE "RemovedToolbars_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."RemovedToolbars_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Toolbars"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."Toolbars" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Toolbars_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."Toolbars_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "UInstallerDetails"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."UInstallerDetails" TO phdata_db_datareader;


--
-- Name: SEQUENCE "UInstallerDetails_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."UInstallerDetails_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "UidToolbars"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."UidToolbars" TO phdata_db_datareader;


--
-- Name: SEQUENCE "UidToolbars_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."UidToolbars_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "UidWin32"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."UidWin32" TO phdata_db_datareader;


--
-- Name: SEQUENCE "UidWin32_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."UidWin32_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "UserInfoes"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."UserInfoes" TO phdata_db_datareader;


--
-- Name: SEQUENCE "UserInfoes_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."UserInfoes_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Win32_OperatingSystem"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."Win32_OperatingSystem" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Win32_OperatingSystem_Id_seq"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE installsafe."Win32_OperatingSystem_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "__MigrationHistory"; Type: ACL; Schema: installsafe; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE installsafe."__MigrationHistory" TO phdata_db_datareader;


--
-- Name: TABLE "averageAudience"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."averageAudience" TO phdata_db_datareader;


--
-- Name: SEQUENCE "averageAudience_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."averageAudience_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE links; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats.links TO phdata_db_datareader;


--
-- Name: SEQUENCE links_id_seq; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats.links_id_seq TO phdata_db_datareader;


--
-- Name: TABLE "messageSnapshots"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messageSnapshots" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messageSnapshots_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messageSnapshots_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "messagesHistory"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messagesHistory" TO phdata_db_datareader;


--
-- Name: TABLE "messagesHistoryShortTerm"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messagesHistoryShortTerm" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messagesHistoryShortTerm_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messagesHistory_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesHistory_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "messagesSendingStats"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messagesSendingStats" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messagesSendingStats_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "messagesVolume"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."messagesVolume" TO phdata_db_datareader;


--
-- Name: SEQUENCE "messagesVolume_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."messagesVolume_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "potentialUsersStatsSrc"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."potentialUsersStatsSrc" TO phdata_db_datareader;


--
-- Name: SEQUENCE "potentialUsersStatsSrc_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "topMsgs"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."topMsgs" TO phdata_db_datareader;


--
-- Name: SEQUENCE "topMsgs_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."topMsgs_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "userDataSnapshots"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT ON TABLE msghistoryandstats."userDataSnapshots" TO phdata_db_datareader;


--
-- Name: SEQUENCE "userDataSnapshots_id_seq"; Type: ACL; Schema: msghistoryandstats; Owner: rvr_history_admin
--

GRANT SELECT,USAGE ON SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Build"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."Build" TO phdata_db_datareader;


--
-- Name: TABLE "Link"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."Link" TO phdata_db_datareader;


--
-- Name: TABLE "LinkType"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."LinkType" TO phdata_db_datareader;


--
-- Name: TABLE "Product"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."Product" TO phdata_db_datareader;


--
-- Name: TABLE "ProductVersion"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."ProductVersion" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Build_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."Build_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "LinkParameter"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."LinkParameter" TO phdata_db_datareader;


--
-- Name: SEQUENCE "LinkType_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."LinkType_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Link_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."Link_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "NotificationEmail"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."NotificationEmail" TO phdata_db_datareader;


--
-- Name: SEQUENCE "NotificationEmail_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."NotificationEmail_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Parameter"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."Parameter" TO phdata_db_datareader;


--
-- Name: TABLE "ParameterName"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."ParameterName" TO phdata_db_datareader;


--
-- Name: SEQUENCE "ParameterName_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."ParameterName_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Parameter_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."Parameter_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "ProductVersion_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."ProductVersion_Id_seq" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Product_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."Product_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "PurchaseSetting"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."PurchaseSetting" TO phdata_db_datareader;


--
-- Name: SEQUENCE "PurchaseSetting_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."PurchaseSetting_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "Setting"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."Setting" TO phdata_db_datareader;


--
-- Name: SEQUENCE "Setting_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."Setting_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "UnknownProduct"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."UnknownProduct" TO phdata_db_datareader;


--
-- Name: SEQUENCE "UnknownProduct_Id_seq"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT,USAGE ON SEQUENCE redirect."UnknownProduct_Id_seq" TO phdata_db_datareader;


--
-- Name: TABLE "__MigrationHistory"; Type: ACL; Schema: redirect; Owner: rvr_poweruser
--

GRANT SELECT ON TABLE redirect."__MigrationHistory" TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: driverreviver; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver GRANT SELECT,USAGE ON SEQUENCES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver GRANT UPDATE ON SEQUENCES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: driverreviver; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver GRANT ALL ON FUNCTIONS TO rvr_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: driverreviver; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver GRANT SELECT ON TABLES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver GRANT REFERENCES,TRIGGER ON TABLES TO rvr_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: driverreviver_all_drivers; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT SELECT,USAGE ON SEQUENCES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT UPDATE ON SEQUENCES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT SELECT,USAGE ON SEQUENCES TO rvr_driver_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE rvr_poweruser IN SCHEMA driverreviver_all_drivers GRANT SELECT,USAGE ON SEQUENCES TO rvr_driver_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: driverreviver_all_drivers; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT ALL ON FUNCTIONS TO rvr_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: driverreviver_all_drivers; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT SELECT ON TABLES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT REFERENCES,TRIGGER ON TABLES TO rvr_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT SELECT ON TABLES TO rvr_driver_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_all_drivers GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: driverreviver_all_drivers; Owner: rvr_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE rvr_poweruser IN SCHEMA driverreviver_all_drivers GRANT SELECT ON TABLES TO rvr_driver_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: driverreviver_test; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_test GRANT SELECT,USAGE ON SEQUENCES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_test GRANT UPDATE ON SEQUENCES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_test GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: driverreviver_test; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_test GRANT ALL ON FUNCTIONS TO rvr_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: driverreviver_test; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_test GRANT SELECT ON TABLES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_test GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_test GRANT REFERENCES,TRIGGER ON TABLES TO rvr_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_test GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: driverreviver_v2; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT SELECT,USAGE ON SEQUENCES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT UPDATE ON SEQUENCES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT SELECT,USAGE ON SEQUENCES TO rvr_driver_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE rvr_poweruser IN SCHEMA driverreviver_v2 GRANT SELECT,USAGE ON SEQUENCES TO rvr_driver_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: driverreviver_v2; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT ALL ON FUNCTIONS TO rvr_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: driverreviver_v2; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT SELECT ON TABLES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT REFERENCES,TRIGGER ON TABLES TO rvr_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT SELECT ON TABLES TO rvr_driver_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA driverreviver_v2 GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: driverreviver_v2; Owner: rvr_poweruser
--

ALTER DEFAULT PRIVILEGES FOR ROLE rvr_poweruser IN SCHEMA driverreviver_v2 GRANT SELECT ON TABLES TO rvr_driver_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: feedbacks; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA feedbacks GRANT SELECT,USAGE ON SEQUENCES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA feedbacks GRANT UPDATE ON SEQUENCES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA feedbacks GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: feedbacks; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA feedbacks GRANT ALL ON FUNCTIONS TO rvr_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: feedbacks; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA feedbacks GRANT SELECT ON TABLES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA feedbacks GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA feedbacks GRANT REFERENCES,TRIGGER ON TABLES TO rvr_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA feedbacks GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: installsafe; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA installsafe GRANT SELECT,USAGE ON SEQUENCES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA installsafe GRANT UPDATE ON SEQUENCES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA installsafe GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: installsafe; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA installsafe GRANT ALL ON FUNCTIONS TO rvr_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: installsafe; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA installsafe GRANT SELECT ON TABLES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA installsafe GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA installsafe GRANT REFERENCES,TRIGGER ON TABLES TO rvr_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA installsafe GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: msghistoryandstats; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT,USAGE ON SEQUENCES TO rvr_hist_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT UPDATE ON SEQUENCES TO rvr_hist_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: msghistoryandstats; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT ALL ON FUNCTIONS TO rvr_hist_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: msghistoryandstats; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT ON TABLES TO rvr_hist_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_hist_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT REFERENCES,TRIGGER ON TABLES TO rvr_hist_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA msghistoryandstats GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: redirect; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA redirect GRANT SELECT,USAGE ON SEQUENCES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA redirect GRANT UPDATE ON SEQUENCES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA redirect GRANT SELECT,USAGE ON SEQUENCES TO phdata_db_datareader;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: redirect; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA redirect GRANT ALL ON FUNCTIONS TO rvr_db_executor;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: redirect; Owner: itadmin
--

ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA redirect GRANT SELECT ON TABLES TO rvr_db_datareader;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA redirect GRANT INSERT,DELETE,TRUNCATE,UPDATE ON TABLES TO rvr_db_datawriter;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA redirect GRANT REFERENCES,TRIGGER ON TABLES TO rvr_db_dlladmin;
ALTER DEFAULT PRIVILEGES FOR ROLE itadmin IN SCHEMA redirect GRANT SELECT ON TABLES TO phdata_db_datareader;


--
-- PostgreSQL database dump complete
--

