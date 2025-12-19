
-- seed_data.sql
-- Seed small set of users, patients, chips and holidays, and example generator for more rows

-- Seed users
INSERT INTO users(user_id, username, fullname, role, password) VALUES(seq_user.NEXTVAL, 'dr_mary', 'Mary Kamanzi', 'DOCTOR', 'drpass123');
INSERT INTO users(user_id, username, fullname, role, password) VALUES(seq_user.NEXTVAL, 'nurse_paul', 'Paul N', 'NURSE', 'nursepass');
INSERT INTO users(user_id, username, fullname, role, password) VALUES(seq_user.NEXTVAL, 'admin', 'Admin User', 'ADMIN', 'adminpass');

-- Seed patients and chips
INSERT INTO patients(patient_id, first_name, last_name, dob, contact) VALUES(seq_patient.NEXTVAL, 'Alice', 'Uwimana', DATE '1990-05-20', '+250788000111');
INSERT INTO patients(patient_id, first_name, last_name, dob, contact) VALUES(seq_patient.NEXTVAL, 'John', 'Doe', DATE '1985-11-10', '+250788000222');

INSERT INTO microchips(chip_id, patient_id, implanted_date) VALUES('CHP-0001', 1000, DATE '2022-01-15');
INSERT INTO microchips(chip_id, patient_id, implanted_date) VALUES('CHP-0002', 1001, DATE '2023-07-21');

-- Seed health records
INSERT INTO health_records(record_id, patient_id, blood_type, allergy, note, sensitivity_level, created_by) VALUES(seq_record.NEXTVAL, 1000, 'A+', 'None', 'Initial record for Alice', 1, 500);
INSERT INTO health_records(record_id, patient_id, blood_type, allergy, note, sensitivity_level, created_by) VALUES(seq_record.NEXTVAL, 1001, 'O-', 'Penicillin', 'Initial record for John', 2, 501);

-- Holidays (example)
INSERT INTO holidays(holiday_date, description) VALUES(DATE '2025-12-25', 'Christmas');
INSERT INTO holidays(holiday_date, description) VALUES(DATE '2026-01-01', 'New Year');

COMMIT;
