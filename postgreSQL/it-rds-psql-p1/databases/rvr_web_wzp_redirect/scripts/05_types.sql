
CREATE TYPE rvr_web_wzp_redirect."Purchase_Type" AS (
	autoactivation integer,
	width integer,
	height integer,
	pagetitle character varying
);

ALTER TYPE rvr_web_wzp_redirect."Purchase_Type" OWNER TO rvr_web_wzp_poweruser;
