--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_SEQUENCES_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web_sequences"

CREATE SEQUENCE driverreviver_all_drivers."Drivers_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_all_drivers."Drivers_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_all_drivers."Drivers_Id_seq" OWNED BY driverreviver_all_drivers."Drivers"."Id";

CREATE SEQUENCE driverreviver_v2."BanRules_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."BanRules_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."BanRules_Id_seq" OWNED BY driverreviver_v2."BanRules"."Id";

CREATE SEQUENCE driverreviver_v2."DeviceHardware_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."DeviceHardware_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."DeviceHardware_Id_seq" OWNED BY driverreviver_v2."DeviceHardware"."Id";

CREATE SEQUENCE driverreviver_v2."Device_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Device_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Device_Id_seq" OWNED BY driverreviver_v2."Device"."Id";

CREATE SEQUENCE driverreviver_v2."DownloadedFiles_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."DownloadedFiles_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."DownloadedFiles_Id_seq" OWNED BY driverreviver_v2."DownloadedFiles"."Id";

CREATE SEQUENCE driverreviver_v2."Drivers_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Drivers_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Drivers_Id_seq" OWNED BY driverreviver_v2."Drivers"."Id";

CREATE SEQUENCE driverreviver_v2."Errors_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Errors_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Errors_Id_seq" OWNED BY driverreviver_v2."Errors"."Id";

CREATE SEQUENCE driverreviver_v2."FeatureConfiguration_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."FeatureConfiguration_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."FeatureConfiguration_Id_seq" OWNED BY driverreviver_v2."FeatureConfiguration"."Id";

CREATE SEQUENCE driverreviver_v2."Feedbacks_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Feedbacks_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Feedbacks_Id_seq" OWNED BY driverreviver_v2."Feedbacks"."Id";

CREATE SEQUENCE driverreviver_v2."Hardware_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Hardware_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Hardware_Id_seq" OWNED BY driverreviver_v2."Hardware"."Id";

CREATE SEQUENCE driverreviver_v2."Laptop_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Laptop_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Laptop_Id_seq" OWNED BY driverreviver_v2."Laptop"."Id";

CREATE SEQUENCE driverreviver_v2."Manufacturers_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Manufacturers_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Manufacturers_Id_seq" OWNED BY driverreviver_v2."Manufacturers"."Id";

CREATE SEQUENCE driverreviver_v2."OperatingSystem_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."OperatingSystem_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."OperatingSystem_Id_seq" OWNED BY driverreviver_v2."OperatingSystem"."Id";

CREATE SEQUENCE driverreviver_v2."PackageHardwareOS_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."PackageHardwareOS_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."PackageHardwareOS_Id_seq" OWNED BY driverreviver_v2."PackageHardwareOS"."Id";

CREATE SEQUENCE driverreviver_v2."Package_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Package_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Package_Id_seq" OWNED BY driverreviver_v2."Package"."Id";

CREATE SEQUENCE driverreviver_v2."ProviderHistories_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."ProviderHistories_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."ProviderHistories_Id_seq" OWNED BY driverreviver_v2."ProviderHistories"."Id";

CREATE SEQUENCE driverreviver_v2."ProviderItem_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."ProviderItem_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."ProviderItem_Id_seq" OWNED BY driverreviver_v2."ProviderItem"."Id";

CREATE SEQUENCE driverreviver_v2."Providers_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Providers_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Providers_Id_seq" OWNED BY driverreviver_v2."Providers"."Id";

CREATE SEQUENCE driverreviver_v2."Settings_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."Settings_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."Settings_Id_seq" OWNED BY driverreviver_v2."Settings"."Id";

CREATE SEQUENCE driverreviver_v2."UnknownOSes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE driverreviver_v2."UnknownOSes_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE driverreviver_v2."UnknownOSes_Id_seq" OWNED BY driverreviver_v2."UnknownOSes"."Id";

CREATE SEQUENCE feedbacks."Feedbacks_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE feedbacks."Feedbacks_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE feedbacks."Feedbacks_Id_seq" OWNED BY feedbacks."Feedbacks"."Id";

CREATE SEQUENCE installsafe."AppsDetecteds_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."AppsDetecteds_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."AppsDetecteds_Id_seq" OWNED BY installsafe."AppsDetecteds"."Id";

CREATE SEQUENCE installsafe."Groups_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."Groups_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."Groups_Id_seq" OWNED BY installsafe."Groups"."Id";

CREATE SEQUENCE installsafe."InstallerAppsDetecteds_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."InstallerAppsDetecteds_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."InstallerAppsDetecteds_Id_seq" OWNED BY installsafe."InstallerAppsDetecteds"."Id";

CREATE SEQUENCE installsafe."InstallerDetails_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."InstallerDetails_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."InstallerDetails_Id_seq" OWNED BY installsafe."InstallerDetails"."Id";

CREATE SEQUENCE installsafe."ListItems_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."ListItems_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."ListItems_Id_seq" OWNED BY installsafe."ListItems"."Id";

CREATE SEQUENCE installsafe."Lists_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."Lists_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."Lists_Id_seq" OWNED BY installsafe."Lists"."Id";

CREATE SEQUENCE installsafe."RawMainDatas_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."RawMainDatas_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."RawMainDatas_Id_seq" OWNED BY installsafe."RawMainDatas"."Id";

CREATE SEQUENCE installsafe."RawRemovedToolbarDatas_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."RawRemovedToolbarDatas_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."RawRemovedToolbarDatas_Id_seq" OWNED BY installsafe."RawRemovedToolbarDatas"."Id";

CREATE SEQUENCE installsafe."RawToolbarDatas_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."RawToolbarDatas_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."RawToolbarDatas_Id_seq" OWNED BY installsafe."RawToolbarDatas"."Id";

CREATE SEQUENCE installsafe."Recommendations_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."Recommendations_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."Recommendations_Id_seq" OWNED BY installsafe."Recommendations"."Id";

CREATE SEQUENCE installsafe."RemovedToolbars_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."RemovedToolbars_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."RemovedToolbars_Id_seq" OWNED BY installsafe."RemovedToolbars"."Id";

CREATE SEQUENCE installsafe."Toolbars_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."Toolbars_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."Toolbars_Id_seq" OWNED BY installsafe."Toolbars"."Id";

CREATE SEQUENCE installsafe."UInstallerDetails_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."UInstallerDetails_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."UInstallerDetails_Id_seq" OWNED BY installsafe."UInstallerDetails"."Id";

CREATE SEQUENCE installsafe."UidToolbars_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."UidToolbars_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."UidToolbars_Id_seq" OWNED BY installsafe."UidToolbars"."Id";

CREATE SEQUENCE installsafe."UidWin32_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."UidWin32_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."UidWin32_Id_seq" OWNED BY installsafe."UidWin32"."Id";

CREATE SEQUENCE installsafe."UserInfoes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."UserInfoes_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."UserInfoes_Id_seq" OWNED BY installsafe."UserInfoes"."Id";

CREATE SEQUENCE installsafe."Win32_OperatingSystem_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE installsafe."Win32_OperatingSystem_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE installsafe."Win32_OperatingSystem_Id_seq" OWNED BY installsafe."Win32_OperatingSystem"."Id";

CREATE SEQUENCE msghistoryandstats."averageAudience_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."averageAudience_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."averageAudience_id_seq" OWNED BY msghistoryandstats."averageAudience".id;

CREATE SEQUENCE msghistoryandstats.links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats.links_id_seq OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats.links_id_seq OWNED BY msghistoryandstats.links.id;

CREATE SEQUENCE msghistoryandstats."messageSnapshots_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."messageSnapshots_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."messageSnapshots_id_seq" OWNED BY msghistoryandstats."messageSnapshots".id;

CREATE SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."messagesHistoryShortTerm_id_seq" OWNED BY msghistoryandstats."messagesHistoryShortTerm".id;

CREATE SEQUENCE msghistoryandstats."messagesHistory_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messagesHistory_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."messagesHistory_id_seq" OWNED BY msghistoryandstats."messagesHistory".id;

CREATE SEQUENCE msghistoryandstats."messagesSendingStats_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."messagesSendingStats_id_seq" OWNED BY msghistoryandstats."messagesSendingStats".id;

CREATE SEQUENCE msghistoryandstats."messagesVolume_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."messagesVolume_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."messagesVolume_id_seq" OWNED BY msghistoryandstats."messagesVolume".id;

CREATE SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."potentialUsersStatsSrc_id_seq" OWNED BY msghistoryandstats."potentialUsersStatsSrc".id;

CREATE SEQUENCE msghistoryandstats."topMsgs_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."topMsgs_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."topMsgs_id_seq" OWNED BY msghistoryandstats."topMsgs".id;

CREATE SEQUENCE msghistoryandstats."userDataSnapshots_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" OWNER TO rvr_history_admin;
ALTER SEQUENCE msghistoryandstats."userDataSnapshots_id_seq" OWNED BY msghistoryandstats."userDataSnapshots".id;

CREATE SEQUENCE redirect."Build_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE redirect."Build_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."Build_Id_seq" OWNED BY redirect."Build"."Id";

CREATE SEQUENCE redirect."LinkType_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."LinkType_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."LinkType_Id_seq" OWNED BY redirect."LinkType"."Id";

CREATE SEQUENCE redirect."Link_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."Link_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."Link_Id_seq" OWNED BY redirect."Link"."Id";

CREATE SEQUENCE redirect."NotificationEmail_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."NotificationEmail_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."NotificationEmail_Id_seq" OWNED BY redirect."NotificationEmail"."Id";

CREATE SEQUENCE redirect."ParameterName_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."ParameterName_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."ParameterName_Id_seq" OWNED BY redirect."ParameterName"."Id";

CREATE SEQUENCE redirect."Parameter_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."Parameter_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."Parameter_Id_seq" OWNED BY redirect."Parameter"."Id";

CREATE SEQUENCE redirect."ProductVersion_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."ProductVersion_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."ProductVersion_Id_seq" OWNED BY redirect."ProductVersion"."Id";

CREATE SEQUENCE redirect."Product_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."Product_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."Product_Id_seq" OWNED BY redirect."Product"."Id";

CREATE SEQUENCE redirect."PurchaseSetting_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."PurchaseSetting_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."PurchaseSetting_Id_seq" OWNED BY redirect."PurchaseSetting"."Id";

CREATE SEQUENCE redirect."Setting_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."Setting_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."Setting_Id_seq" OWNED BY redirect."Setting"."Id";

CREATE SEQUENCE redirect."UnknownProduct_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE redirect."UnknownProduct_Id_seq" OWNER TO rvr_poweruser;
ALTER SEQUENCE redirect."UnknownProduct_Id_seq" OWNED BY redirect."UnknownProduct"."Id";
