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
    emp_role          NUMBER(3) NOT NULL,
    emp_no_manager    NUMBER(3)
);

COMMENT ON COLUMN employee.emp_no IS 
    'Identifier for employee';

COMMENT ON COLUMN employee.emp_gname IS 
    'Employee given name';

COMMENT ON COLUMN employee.emp_fname IS 
    'Employee family name';

COMMENT ON COLUMN employee.emp_contact_no IS 
    'Employee contact number';

COMMENT ON COLUMN employee.emp_licenceno IS 
    'Employee licence number';

COMMENT ON COLUMN employee.emp_role IS 
    'Employee role - Manager (B), Truck Dispatcher (T), Mechanic (M), or Driver (D)';

COMMENT ON COLUMN employee.emp_no_manager IS
    'Employee number of the manager the employee is assigned to'

ALTER TABLE employee 
  ADD 
    (CONSTRAINT employee_pk PRIMARY KEY ( emp_no ),

    CONSTRAINT emp_contactno_uq UNIQUE ( emp_contact_no ),

    CONSTRAINT emp_licenceno_uq UNIQUE ( emp_licenceno ),

    CONSTRAINT chk_emp_role CHECK ( emp_role IN ( 'B', 'T', 'M', 'D' ) ));

-- JOB

CREATE TABLE job (
    job_no                  NUMBER(5) NOT NULL,
    job_pickup_dt           DATE NOT NULL,
    job_intended_dropoff_dt DATE NOT NULL,
    job_cost                NUMBER(6,2),
    job_payment_made        CHAR(1) NOT NULL,
    quote_no                NUMBER(5) NOT NULL,
    sched_emp_no            NUMBER(3) NOT NULL,
    driver_emp_no           NUMBER(3) NOT NULL,
    trailer_code            CHAR(5) NOT NULL,
    truck_vin               CHAR(17) NOT NULL
);

COMMENT ON COLUMN job.job_no IS 
    'Identifier for job';

COMMENT ON COLUMN job.job_pickup_dt IS
    'Job scheduled pick up date and time';

COMMENT ON COLUMN job.job_intended_dropoff_dt IS 
    'Job intended drop-off date and time';

COMMENT ON COLUMN job.job_cost IS 
    'The actual job cost (if different from quote cost)';

COMMENT ON COLUMN job.job_payment_made IS 
    'Flag to note whether the job has been paid (Yes(Y) or No(N))';

COMMENT ON COLUMN job.quote_no IS 
    'Identifier for quote';

COMMENT ON COLUMN job.sched_emp_no IS 
    'Identifier for employee scheduling the job';

COMMENT ON COLUMN job.driver_emp_no IS 
    'Identifier for driver(D) employee';

COMMENT ON COLUMN job.trailer_code IS 
    'Identifier for trailer';

COMMENT ON COLUMN job.truck_vin IS 
    'Vehicle Indentification Number (VIN)';

ALTER TABLE job 
 ADD
    (CONSTRAINT job_pk PRIMARY KEY ( job_no ),
    CONSTRAINT chk_payment_made CHECK (job_payment_made IN ( 'Y', 'N' ) ));

-- QUOTE

CREATE TABLE quote (
    quote_no               NUMBER(5) NOT NULL,
    quote_prepared_date    DATE NOT NULL,
    quote_pref_start_date  DATE NOT NULL,
    quote_start_location   VARCHAR2(50) NOT NULL,
    quote_end_location     VARCHAR2(60) NOT NULL,
    quote_cost             NUMBER(6,2) NOT NULL,
    cust_no                NUMBER(4) NOT NULL,
    emp_no                 NUMBER(3) NOT NULL
);

COMMENT ON COLUMN quote.quote_no IS 
    'Identifier for quote';

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

COMMENT ON COLUMN quote.cust_no IS 
    'Identifier for customer - register customer if first time booking';

COMMENT ON COLUMN quote.emp_no IS 
    'Identifier for employee';

ALTER TABLE quote ADD CONSTRAINT quote_pk PRIMARY KEY ( quote_no );

-- Add all missing FK Constraints below here

ALTER TABLE employee
    ADD CONSTRAINT emp_no_manager_emp_fk FOREIGN KEY(emp_no_manager) 
    REFERENCES employee(emp_no) ON DELETE SET NULL;

ALTER TABLE job
    ADD 
    (CONSTRAINT qt_job_fk FOREIGN KEY(quote_no)
    REFERENCES quote(quote_no) ON DELETE SET NULL,

    CONSTRAINT sched_emp_job_fk FOREIGN KEY(sched_emp_no) 
    REFERENCES employee(emp_no) ON DELETE SET NULL,

    CONSTRAINT driver_emp_job_fk FOREIGN KEY(driver_emp_no) 
    REFERENCES employee(emp_no) ON DELETE SET NULL,
    
    CONSTRAINT trailer_comb_job_fk FOREIGN KEY(trailer_code) 
    REFERENCES combination(trailer_code) ON DELETE SET NULL,
    
    CONSTRAINT truck_comb_job_fk FOREIGN KEY(truck_vin) 
    REFERENCES combination(truck_vin) ON DELETE SET NULL);

ALTER TABLE quote
    ADD 
    (CONSTRAINT emp_qt_fk FOREIGN KEY(emp_no) 
    REFERENCES employee(emp_no) ON DELETE SET NULL,

    CONSTRAINT cust_qt_fk FOREIGN KEY(cust_no) 
    REFERENCES customer(cust_no) ON DELETE SET NULL);
