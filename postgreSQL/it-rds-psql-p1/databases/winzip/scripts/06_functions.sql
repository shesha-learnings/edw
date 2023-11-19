--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

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

