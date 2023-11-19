--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE SEQUENCE msghistoryandstats."averageAudience_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."averageAudience_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."averageAudience_id_seq" OWNED BY msghistoryandstats."averageAudience".id;

CREATE SEQUENCE msghistoryandstats.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats.links_id_seq OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats.links_id_seq OWNED BY msghistoryandstats.links.id;

CREATE SEQUENCE msghistoryandstats."messageSnapshots_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messageSnapshots_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."messageSnapshots_id_seq" OWNED BY msghistoryandstats."messageSnapshots".id;

CREATE SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" OWNED BY msghistoryandstats."messagesHistoryShortTerm".id;

CREATE SEQUENCE msghistoryandstats."messagesHistory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messagesHistory_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."messagesHistory_id_seq" OWNED BY msghistoryandstats."messagesHistory".id;

CREATE SEQUENCE msghistoryandstats."messagesSendingStats_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" OWNED BY msghistoryandstats."messagesSendingStats".id;

CREATE SEQUENCE msghistoryandstats."messagesVolume_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messagesVolume_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."messagesVolume_id_seq" OWNED BY msghistoryandstats."messagesVolume".id;

CREATE SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" OWNED BY msghistoryandstats."potentialUsersStatsSrc".id;

CREATE SEQUENCE msghistoryandstats."topMsgs_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."topMsgs_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."topMsgs_id_seq" OWNED BY msghistoryandstats."topMsgs".id;

CREATE SEQUENCE msghistoryandstats."userDataSnapshots_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" OWNER TO wz_history_admin;
ALTER SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" OWNED BY msghistoryandstats."userDataSnapshots".id;
