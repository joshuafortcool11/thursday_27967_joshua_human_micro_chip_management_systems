
-- hmms_api_pkg.sql
CREATE OR REPLACE PACKAGE hmms_api IS
  PROCEDURE register_patient(p_first IN VARCHAR2, p_last IN VARCHAR2, p_dob IN DATE, p_contact IN VARCHAR2, p_out_patient_id OUT NUMBER);
  PROCEDURE assign_chip(p_patient_id IN NUMBER, p_chip_id IN VARCHAR2);
  PROCEDURE view_patient_summary(p_user IN VARCHAR2, p_chip_id IN VARCHAR2, p_out_summary OUT CLOB);
  PROCEDURE update_health_record(p_user IN VARCHAR2, p_patient_id IN NUMBER, p_blood IN VARCHAR2, p_allergy IN VARCHAR2, p_note IN CLOB);
  FUNCTION search_patient_by_chip(p_chip_id IN VARCHAR2) RETURN NUMBER;
END hmms_api;
/
CREATE OR REPLACE PACKAGE BODY hmms_api IS

  PROCEDURE log_action(p_user_id NUMBER, p_action VARCHAR2, p_table VARCHAR2, p_row VARCHAR2, p_details CLOB) IS
    v_logid NUMBER := seq_audit.NEXTVAL;
  BEGIN
    INSERT INTO audit_log(log_id, user_id, action, table_name, row_id, details)
    VALUES(v_logid, p_user_id, p_action, p_table, p_row, p_details);
    COMMIT;
  END log_action;

  PROCEDURE register_patient(p_first IN VARCHAR2, p_last IN VARCHAR2, p_dob IN DATE, p_contact IN VARCHAR2, p_out_patient_id OUT NUMBER) IS
  BEGIN
    p_out_patient_id := seq_patient.NEXTVAL;
    INSERT INTO patients(patient_id, first_name, last_name, dob, contact)
    VALUES(p_out_patient_id, p_first, p_last, p_dob, p_contact);
    COMMIT;
    log_action(NULL, 'INSERT', 'PATIENTS', TO_CHAR(p_out_patient_id), 'Registered patient '||p_first||' '||p_last);
  EXCEPTION WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
  END register_patient;

  PROCEDURE assign_chip(p_patient_id IN NUMBER, p_chip_id IN VARCHAR2) IS
  BEGIN
    INSERT INTO microchips(chip_id, patient_id, implanted_date, active)
    VALUES(p_chip_id, p_patient_id, SYSDATE, 'Y');
    COMMIT;
    log_action(NULL, 'INSERT', 'MICROCHIPS', p_chip_id, 'Assigned chip to patient '||p_patient_id);
  EXCEPTION WHEN DUP_VAL_ON_INDEX THEN
    RAISE_APPLICATION_ERROR(-20001, 'Chip id already exists');
  WHEN OTHERS THEN
    ROLLBACK; RAISE;
  END assign_chip;

  FUNCTION search_patient_by_chip(p_chip_id IN VARCHAR2) RETURN NUMBER IS
    v_pid NUMBER;
  BEGIN
    SELECT patient_id INTO v_pid FROM microchips WHERE chip_id = p_chip_id AND active = 'Y';
    RETURN v_pid;
  EXCEPTION WHEN NO_DATA_FOUND THEN
    RETURN NULL;
  END search_patient_by_chip;

  PROCEDURE view_patient_summary(p_user IN VARCHAR2, p_chip_id IN VARCHAR2, p_out_summary OUT CLOB) IS
    v_pid NUMBER;
    v_blood VARCHAR2(3);
    v_allergy VARCHAR2(200);
    v_note CLOB;
    v_user_id NUMBER;
  BEGIN
    SELECT user_id INTO v_user_id FROM users WHERE username = p_user AND status = 'ACTIVE';
    SELECT patient_id INTO v_pid FROM microchips WHERE chip_id = p_chip_id AND active='Y';
    SELECT blood_type, allergy, note INTO v_blood, v_allergy, v_note
      FROM (SELECT blood_type, allergy, note FROM health_records WHERE patient_id = v_pid ORDER BY created_at DESC)
    WHERE ROWNUM = 1;
    p_out_summary := 'Patient='||v_pid||' Blood='||NVL(v_blood,'N/A')||' Allergy='||NVL(v_allergy,'None')||' Note='||DBMS_LOB.SUBSTR(v_note,200,1);
    log_action(v_user_id, 'VIEW', 'MICROCHIPS', p_chip_id, 'Viewed summary');
  EXCEPTION WHEN NO_DATA_FOUND THEN
    p_out_summary := 'No data found';
    RAISE;
  END view_patient_summary;

  PROCEDURE update_health_record(p_user IN VARCHAR2, p_patient_id IN NUMBER, p_blood IN VARCHAR2, p_allergy IN VARCHAR2, p_note IN CLOB) IS
    v_user_id NUMBER;
    v_rid NUMBER := seq_record.NEXTVAL;
  BEGIN
    SELECT user_id INTO v_user_id FROM users WHERE username = p_user;
    INSERT INTO health_records(record_id, patient_id, blood_type, allergy, note, created_by)
      VALUES(v_rid, p_patient_id, p_blood, p_allergy, p_note, v_user_id);
    COMMIT;
    log_action(v_user_id, 'INSERT', 'HEALTH_RECORDS', TO_CHAR(v_rid), 'Added health record');
  EXCEPTION WHEN OTHERS THEN
    ROLLBACK; RAISE;
  END update_health_record;

END hmms_api;
/
