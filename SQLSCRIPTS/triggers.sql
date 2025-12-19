
-- triggers.sql: restriction triggers and audit examples
CREATE OR REPLACE TRIGGER trg_restrict_dml_health
  FOR INSERT OR UPDATE OR DELETE ON health_records
  COMPOUND TRIGGER

  FUNCTION is_allowed RETURN BOOLEAN IS
    v_day VARCHAR2(3);
    v_today DATE := TRUNC(SYSDATE);
    v_count NUMBER;
  BEGIN
    v_day := TO_CHAR(v_today, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH'); -- MON,TUE,..
    -- block Monday-Friday
    IF v_day IN ('MON','TUE','WED','THU','FRI') THEN
      RETURN FALSE;
    END IF;
    -- block if today is in holidays table
    SELECT COUNT(*) INTO v_count FROM holidays WHERE holiday_date = v_today;
    IF v_count > 0 THEN
      RETURN FALSE;
    END IF;
    RETURN TRUE;
  END is_allowed;

  BEFORE STATEMENT IS
  BEGIN
    IF NOT is_allowed THEN
      RAISE_APPLICATION_ERROR(-20050, 'DML not allowed today due to weekday/holiday restriction.');
    END IF;
  END BEFORE STATEMENT;

  AFTER EACH ROW IS
  BEGIN
    INSERT INTO audit_log(log_id, user_id, action, table_name, row_id, details)
      VALUES(seq_audit.NEXTVAL, NULL, CASE WHEN INSERTING THEN 'INSERT' WHEN UPDATING THEN 'UPDATE' ELSE 'DELETE' END, 'HEALTH_RECORDS', 
             NVL(TO_CHAR(:NEW.record_id), TO_CHAR(:OLD.record_id)), 'Change by trigger');
  END AFTER EACH ROW;

END;
/
