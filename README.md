# 📚 Student Attendance and Performance Tracking System

---

## 📅 Project Details

- **Student Name**: Iradukunda Joshua  
- **Student ID**: 27967  
- **Lecturer**: Eric Maniraguha  
- **Course Code & Name**: INSY 8311 – Database Development with PL/SQL  
- **Academic Year**: 2025–2026  

---

## 🌐 Introduction

In emergency healthcare, rapid and accurate patient identification is critical to saving lives. Unconscious patients often arrive without reliable medical history, leading to delays and potential fatal errors such as wrong blood transfusions or ignored allergies.  

This project presents **HMMS** – a secure Oracle PL/SQL database system using implanted microchips for instant patient identification and controlled access to vital health records. It combines innovation, security, auditing, and business intelligence to deliver a production-ready solution.

---

## 💪 Problem Statement

Healthcare facilities face several challenges:

- Delayed identification of unconscious patients  
- Risk of medical errors due to missing allergy or blood-type information  
- Lack of secure audit trails for sensitive data access  
- Manual processes prone to manipulation and data loss  

**HMMS** addresses these challenges through microchip technology, role-based security, and real-time analytics.

---

## 🛡️ Target Users

- Doctors & Nurses (emergency scanning and record access)  
- Medical Records Officers  
- Hospital Administrators  
- Ministry of Health (oversight)  

---

## 🚀 Project Goals

- Instant emergency data retrieval (less than 2 seconds)  
- Prevent medical errors through accurate critical information  
- Full audit trail of all data changes and access attempts  
- Enforce business rule: no DML on sensitive tables on weekdays or public holidays  
- Provide BI dashboards for security trends and performance metrics (+2 bonus)  

---

## 📊 Entity Relationship Diagram (ERD)

### Entities
- PATIENTS  
- USERS  
- MICROCHIPS  
- HEALTH_RECORDS  
- RESTRICTION_HOLIDAYS  
- AUDIT_LOG  
- ACCESS_ATTEMPTS  

### Relationships
- One Patient → One active Microchip  
- One Patient → Many Health Records  
- Users implant microchips and update records  
- Triggers enforce restriction rules  
- All actions are logged in **AUDIT_LOG**  

---

## 🔧 Database Structure

### 🔢 Tables
- PATIENTS  
- USERS  
- MICROCHIPS  
- HEALTH_RECORDS  
- RESTRICTION_HOLIDAYS  
- AUDIT_LOG  
- ACCESS_ATTEMPTS  

### 💡 Constraints
- Primary and Foreign Keys  
- UNIQUE, NOT NULL, and CHECK constraints  
- IDENTITY columns for auto-increment  

---

## 🔢 SQL Components

### 🛠️ Procedures
- Register_Patient  
- Implant_Microchip  
- Update_Health_Record
- <img width="959" height="490" alt="procedure_to_regiister_patients" src="https://github.com/user-attachments/assets/343597d1-26cd-4098-9ad3-066fddd367cc" />


### 💡 Functions
- Get_Emergency_Info (returns cursor)  
- Is_Update_Allowed
- <img width="958" height="467" alt="function_active_chip" src="https://github.com/user-attachments/assets/9ae7a832-81d8-420d-ba91-c31e582b74a1" />


### 👀 Cursors
- High-risk patients (severe allergies or chronic conditions)
-

- 

### 📦 Packages
- **HMMS_API** – modular collection of procedures and functions
- <img width="959" height="496" alt="package_microchops_body" src="https://github.com/user-attachments/assets/521fee00-0f9f-4823-9fc3-191a7a46ed7e" />
 

### 🚧 Triggers
- Compound triggers on HEALTH_RECORDS and MICROCHIPS  
- Block DML on weekdays (Monday–Friday) and public holidays  
- Log successful changes and denied attempts
- <img width="956" height="488" alt="trigger_create_health_record" src="https://github.com/user-attachments/assets/97c28aa9-7182-4f89-a14f-647fec211eb8" />


---

## 📊 Sample Data

- **Patients**: Aimable Nzeyimana (O+), Grace Mukamana (A-), Paul Habimana (B+)  
- **Users**: Dr. Jean Hakizimana, Nurse Marie Uwase, Admin Joshua  
- **Allergies**: Penicillin, Nuts, Peanuts  
- **Holidays**: Christmas, New Year, Kwibohora  

---

## 💼 Tools Used

- Oracle Database 21c Express Edition  
- SQL Developer  
- Enterprise Manager Express  
- GitHub for version control  
- draw.io for ERD and BPMN  

---

## 📅 Timeline

- **Phase I: Problem Definition ✔️**  
  Identified emergency identification crisis and proposed a microchip-based solution with strong BI potential.  

- **Phase II: Business Process Modeling ✔️**  
  BPMN swimlane diagram illustrating patient arrival, microchip scan, record retrieval, and restricted updates.
   <img width="1537" height="712" alt="Untitled Diagram-Page-1 drawio" src="https://github.com/user-attachments/assets/be86aebf-fdde-4f64-b2ce-4a57fee2fc44" />

- **Phase III: Logical Design ✔️**  
  Seven-table ER diagram normalized to 3NF with audit and holiday entities for security compliance.
  <img width="521" height="541" alt="ERD drawio" src="https://github.com/user-attachments/assets/474bac68-a56e-45f4-b017-4d736458bda7" />


- **Phase IV: Database Creation ✔️**  
  PDB configured with a dedicated EM Express port and user privileges.
  <img width="959" height="489" alt="create_audit_logs" src="https://github.com/user-attachments/assets/2fa9b516-1809-4594-a31f-31c66f66c879" />


- **Phase V: Data Insertion and Validation ✔️**  
  800+ realistic Rwandan records inserted and validated against constraints.
  <img width="959" height="485" alt="insert_into_mircochip" src="https://github.com/user-attachments/assets/123bc52b-6bf1-4393-aacc-d477ec9d3682" />


- **Phase VI: PL/SQL Development ✔️**  
  HMMS_API package with procedures, functions, cursors, and window functions.  

- **Phase VII: Advanced Programming & Auditing ✔️**  
  Compound triggers enforce mandatory weekday and holiday restrictions with full auditing and denied attempt logging.  
<img width="958" height="484" alt="procedure_implant_microchip" src="https://github.com/user-attachments/assets/ec7a94bb-5ad5-4079-9951-de9934c93b73" />

- **Phase VIII: Final Documentation & Presentation ✔️**  
  Complete GitHub repository, BI dashboards, and a 10-slide presentation.  
<img width="956" height="488" alt="trigger_create_health_record" src="https://github.com/user-attachments/assets/9eafbc45-c861-47c8-94c9-032cff6549fb" />

---

## 📄 License

This project is submitted as the **Capstone Project for Database Development with PL/SQL**,  
Academic Year **2025–2026**,  
**Adventist University of Central Africa (AUCA)**.
