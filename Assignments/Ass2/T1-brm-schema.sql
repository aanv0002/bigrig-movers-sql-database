--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-brm-schema.sql

--Student ID: 35737476
--Student Name: Amra Anver

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/


/* drop table statements - do not remove*/

DROP TABLE employee CASCADE CONSTRAINTS PURGE;

DROP TABLE job CASCADE CONSTRAINTS PURGE;

DROP TABLE quote CASCADE CONSTRAINTS PURGE;

-- Task 1 Add Create table statements for the Missing TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- EMPLOYEE

CREATE TABLE employee (
    emp_no            NUMBER(3) NOT NULL,
    emp_gname         VARCHAR2(30) NOT NULL,
    emp_fname         VARCHAR2(30) NOT NULL,
    emp_contact_no    CHAR(10) NOT NULL,
    emp_licenceno     VARCHAR2(11),
    emp_role          NUMBER(3) NOT NULL
);

COMMENT ON COLUMN employee.emp_no IS 
    'Employee number';

COMMENT ON COLUMN employee.emp_gname IS 
    'Employee given name';

COMMENT ON COLUMN employee.emp_fname IS 
    'Employee family name';

COMMENT ON COLUMN employee.emp_contact_no IS 
    'Employee contact number';

COMMENT ON COLUMN employee.emp_licenceno IS 
    'Employee licence number';

COMMENT ON COLUMN employee.emp_role IS 
    'Employee role';

-- JOB

CREATE TABLE job (
    job_no                  NUMBER(5) NOT NULL,
    job_pickup_dt           DATE NOT NULL,
    job_intended_dropoff_dt DATE NOT NULL,
    job_cost                NUMBER(6,2),
    job_payment_made        CHAR(1) NOT NULL
);

COMMENT ON COLUMN job.job_no IS 
    'Job number';

COMMENT ON COLUMN job.job_pickup_dt IS
    'Job scheduled pick up date and time';

COMMENT ON COLUMN job.job_intended_dropoff_dt IS 
    'Job intended drop-off date and time';

COMMENT ON COLUMN job.job_cost IS 
    'The actual job cost (if different from quote cost)';

COMMENT ON COLUMN job.job_payment_made IS 
    'Flag to note whether the job has been paid (Y or N)';


-- QUOTE

CREATE TABLE quote (
    quote_no               NUMBER(5) NOT NULL,
    quote_prepared_date    DATE NOT NULL,
    quote_pref_start_date  DATE NOT NULL,
    quote_start_location   VARCHAR2(50) NOT NULL,
    quote_end_location     VARCHAR2(60) NOT NULL,
    quote_cost             NUMBER(6,2)
);

COMMENT ON COLUMN quote.quote_no IS 
    'Quote number';

COMMENT ON COLUMN quote.quote_prepared_date IS 
    'The date the quote was prepared';

COMMENT ON COLUMN quote.quote_pref_start_date IS 
    'The preferred start date for the quote';

COMMENT ON COLUMN quote.quote_start_location IS 
    'The start location for the quote';

COMMENT ON COLUMN quote.quote_end_location IS 
    'The end location for the quote';

COMMENT ON COLUMN quote.quote_cost IS 
    'The quoted cost';

-- Add all missing FK Constraints below here


