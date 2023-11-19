--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE INDEX messages_history_request_date ON msghistoryandstats."messagesHistory" USING btree ("requestDate");
CREATE INDEX "messages_history_short_term_prodCode" ON msghistoryandstats."messagesHistoryShortTerm" USING gin (((json #> '{request,application,prodCode}'::text[])));
CREATE INDEX messages_history_short_term_request_date ON msghistoryandstats."messagesHistoryShortTerm" USING btree ("requestDate");
CREATE INDEX messages_history_short_term_uid ON msghistoryandstats."messagesHistoryShortTerm" USING gin (((json #> '{request,application,uid}'::text[])));
CREATE INDEX messages_sending_stats_date ON msghistoryandstats."messagesSendingStats" USING btree (date);
CREATE INDEX messages_sending_stats_message_id ON msghistoryandstats."messagesSendingStats" USING btree ("messageId");
CREATE INDEX messages_sending_stats_message_type ON msghistoryandstats."messagesSendingStats" USING btree ("messageType");
CREATE INDEX potential_users_stats_src_build_id ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("buildId");
CREATE INDEX potential_users_stats_src_check_type ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("checkType");
CREATE INDEX potential_users_stats_src_country_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("countryCode");
CREATE INDEX potential_users_stats_src_days_to_lic_expire ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("daysToLicExpire");
CREATE INDEX potential_users_stats_src_dsi ON msghistoryandstats."potentialUsersStatsSrc" USING btree (dsi);
CREATE INDEX potential_users_stats_src_installed_product_codes ON msghistoryandstats."potentialUsersStatsSrc" USING gin ("installedProductCodes");
CREATE INDEX potential_users_stats_src_language_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("languageCode");
CREATE INDEX potential_users_stats_src_lic_status ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("licStatus");
CREATE INDEX potential_users_stats_src_product_code ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("productCode");
CREATE INDEX potential_users_stats_src_user_ownership ON msghistoryandstats."potentialUsersStatsSrc" USING gin ("userOwnership");
CREATE INDEX potential_users_stats_src_user_uid ON msghistoryandstats."potentialUsersStatsSrc" USING btree ("userUid");
CREATE INDEX potential_users_stats_src_version ON msghistoryandstats."potentialUsersStatsSrc" USING btree (version);
CREATE UNIQUE INDEX user_data_snapshots_hash ON msghistoryandstats."userDataSnapshots" USING btree (hash);
