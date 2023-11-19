--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset COREL_WEB_DATABASE_INITIAL:20231227 runOnChange:false contextFilter:dev,initial,db
--labels: "corel_web"

CREATE INDEX nu_regcode_pid ON winzip_ipm.regcode USING btree (pid);
CREATE INDEX nu_regcode_regcode ON winzip_ipm.regcode USING btree (regcode) INCLUDE (inserttimestamp);
