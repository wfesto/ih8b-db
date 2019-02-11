--liquibase formatted sql

--changeset wfesto:initial-schema-creation-01
drop table if exists account;
create table account (
	account_id				serial 	primary key,
	user_name				varchar(256) NOT NULL,
	email_enc				varchar(256) NOT NULL UNIQUE,
	password_hsh			varchar(1024) NOT NULL,
	password_slt			varchar(1024) NOT NULL,
	password_create_ts		timestamp default current_timestamp,
	password_reset_code		varchar(8),
	password_reset_ts		timestamp,
	create_ts				timestamp	default current_timestamp,
	update_ts				timestamp
);

comment on table account is 'User Account and associated data';

comment on column account.user_name is 'User-defined user name for account';
comment on column account.email_enc is 'Encrypted email address';
comment on column account.password_hsh is 'Hashed password';
comment on column account.password_slt is 'Password hash salt';
comment on column account.password_create_ts is 'Timestamp for current password creation';
comment on column account.password_reset_code is 'Code given to user to reset password';
comment on column account.password_reset_ts is 'Timestamp when password reset code is sent.';
comment on column account.create_ts is 'Timestamp for account creation.';
comment on column account.update_ts is 'Timestamp for account update.';

CREATE TRIGGER update_account_update_ts
BEFORE UPDATE ON account
FOR EACH ROW EXECUTE PROCEDURE public.update_modified_ts_column();