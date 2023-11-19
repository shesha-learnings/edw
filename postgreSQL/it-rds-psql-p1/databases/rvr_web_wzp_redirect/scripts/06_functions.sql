
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

