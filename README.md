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

### 💡 Functions
- Get_Emergency_Info (returns cursor)  
- Is_Update_Allowed  

### 👀 Cursors
- High-risk patients (severe allergies or chronic conditions)  

### 📦 Packages
- **HMMS_API** – modular collection of procedures and functions  

### 🚧 Triggers
- Compound triggers on HEALTH_RECORDS and MICROCHIPS  
- Block DML on weekdays (Monday–Friday) and public holidays  
- Log successful changes and denied attempts  

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

- **Phase III: Logical Design ✔️**  
  Seven-table ER diagram normalized to 3NF with audit and holiday entities for security compliance.  

- **Phase IV: Database Creation ✔️**  
  PDB configured with a dedicated EM Express port and user privileges.  

- **Phase V: Data Insertion and Validation ✔️**  
  800+ realistic Rwandan records inserted and validated against constraints.  

- **Phase VI: PL/SQL Development ✔️**  
  HMMS_API package with procedures, functions, cursors, and window functions.  

- **Phase VII: Advanced Programming & Auditing ✔️**  
  Compound triggers enforce mandatory weekday and holiday restrictions with full auditing and denied attempt logging.  

- **Phase VIII: Final Documentation & Presentation ✔️**  
  Complete GitHub repository, BI dashboards, and a 10-slide presentation.  

---

## 📄 License

This project is submitted as the **Capstone Project for Database Development with PL/SQL**,  
Academic Year **2025–2026**,  
**Adventist University of Central Africa (AUCA)**.
