--liquibase formatted sql

--changeset wfesto:stored-proc-update-ts-01
CREATE OR REPLACE FUNCTION update_modified_ts_column()
RETURNS TRIGGER AS $$
BEGIN
   IF row(NEW.*) IS DISTINCT FROM row(OLD.*) THEN
      NEW.update_ts = now(); 
      RETURN NEW;
   ELSE
      RETURN OLD;
   END IF;
END;
$$ language 'plpgsql';