
-- create_tables.sql
-- Sequences
CREATE SEQUENCE seq_patient START WITH 1000 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_record START WITH 10000 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_user START WITH 500 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_audit START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

-- Tables
CREATE TABLE patients (
  patient_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(100) NOT NULL,
  last_name VARCHAR2(100) NOT NULL,
  dob DATE,
  contact VARCHAR2(100),
  created_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE TABLE microchips (
  chip_id VARCHAR2(50) PRIMARY KEY,
  patient_id NUMBER NOT NULL,
  implanted_date DATE,
  active CHAR(1) DEFAULT 'Y',
  CONSTRAINT fk_chip_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE users (
  user_id NUMBER PRIMARY KEY,
  username VARCHAR2(100) UNIQUE NOT NULL,
  fullname VARCHAR2(200),
  role VARCHAR2(20) DEFAULT 'USER',
  password VARCHAR2(200),
  status VARCHAR2(20) DEFAULT 'ACTIVE',
  created_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE TABLE health_records (
  record_id NUMBER PRIMARY KEY,
  patient_id NUMBER NOT NULL,
  blood_type VARCHAR2(3),
  allergy VARCHAR2(200),
  note CLOB,
  sensitivity_level NUMBER DEFAULT 1,
  created_by NUMBER,
  created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
  CONSTRAINT fk_hr_patient FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  CONSTRAINT fk_hr_user FOREIGN KEY (created_by) REFERENCES users(user_id)
);

CREATE TABLE audit_log (
  log_id NUMBER PRIMARY KEY,
  user_id NUMBER,
  action VARCHAR2(50),
  table_name VARCHAR2(50),
  row_id VARCHAR2(100),
  details CLOB,
  log_time TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE TABLE holidays (
  holiday_date DATE PRIMARY KEY,
  description VARCHAR2(200)
);
