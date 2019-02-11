DROP DATABASE ih8b;

CREATE DATABASE ih8b
    WITH 
    OWNER = db_owner
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

alter user postgres set timezone = 'UTC';
alter user db_owner set timezone = 'UTC';
alter user db_user set timezone = 'UTC';