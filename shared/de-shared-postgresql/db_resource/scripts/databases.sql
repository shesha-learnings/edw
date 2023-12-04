--liquibase formatted sql
--preconditions onFail:HALT onError:HALT
--changeset DBMigration_Initial_Version:20230612 contextFilter:migration,dev,stage,prod,databases runInTransaction:false
--labels: "Databases"

SET default_tablespace = '';

CREATE DATABASE db1
    WITH 
    OWNER = ${admin_user}
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    CONNECTION LIMIT = -1;
