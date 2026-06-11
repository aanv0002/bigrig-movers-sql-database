SET ECHO ON

/*

Applied 8 Schema Insert file
applied8_schema_insert.sql

Author: FIT Database Teaching Team
License: Copyright Monash University, unless otherwise stated. All Rights Reserved.
COPYRIGHT WARNING
Warning
This material is protected by copyright. For use within Monash University only. NOT FOR RESALE.
Do not remove this notice.

This is the Applied 7 sample solution modified to add a surrogate PK for ENROLMENT
and to insert data into the STUDENT and UNIT tables

*/

-- Drop all tables
DROP TABLE enrolment CASCADE CONSTRAINTS PURGE;

DROP TABLE student CASCADE CONSTRAINTS PURGE;

DROP TABLE unit CASCADE CONSTRAINTS PURGE;


-- Create the STUDENT table to store student information
CREATE TABLE student (
    stu_nbr     NUMBER(8) NOT NULL,
    stu_lname   VARCHAR2(50),
    stu_fname   VARCHAR2(50),
    stu_dob     DATE NOT NULL
);

COMMENT ON COLUMN student.stu_nbr IS
    'Student number';

COMMENT ON COLUMN student.stu_lname IS
    'Student last name';

COMMENT ON COLUMN student.stu_fname IS
    'Student first name';

COMMENT ON COLUMN student.stu_dob IS
    'Student date of birth';

-- Add primary key constraint on student number
ALTER TABLE student ADD CONSTRAINT student_pk PRIMARY KEY ( stu_nbr );

-- Ensure student number is 8 digits (greater than 10,000,000)
ALTER TABLE student ADD CONSTRAINT ck_stu_nbr CHECK ( stu_nbr > 10000000 );

-- Create the UNIT table to store unit/subject information
CREATE TABLE unit (
    unit_code   CHAR(7) NOT NULL,
    unit_name   VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN unit.unit_code IS
    'Unit code';

COMMENT ON COLUMN unit.unit_name IS
    'Unit name';

-- Add primary key constraint on unit code
ALTER TABLE unit ADD CONSTRAINT unit_pk PRIMARY KEY ( unit_code );

-- Ensure each unit name is unique across all units
ALTER TABLE unit ADD CONSTRAINT uq_unit_name UNIQUE ( unit_name );

-- Create the ENROLMENT table to store student enrolment records
CREATE TABLE enrolment (
    enrol_id         number(9) not null,
    stu_nbr          NUMBER(8) NOT NULL,
    unit_code        CHAR(7) NOT NULL,
    enrol_year       DATE NOT NULL,
    enrol_semester   CHAR(1) NOT NULL,
    enrol_mark       NUMBER(3),
    enrol_grade      VARCHAR2(2)
);

COMMENT ON COLUMN enrolment.enrol_id IS
    'Enrolment identifier - surrogate key added';

COMMENT ON COLUMN enrolment.stu_nbr IS
    'Student number';

COMMENT ON COLUMN enrolment.unit_code IS
    'Unit code';

COMMENT ON COLUMN enrolment.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN enrolment.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN enrolment.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN enrolment.enrol_grade IS
    'Enrolment grade (letter)';

-- Add primary key constraint using the surrogate key
ALTER TABLE enrolment
    ADD CONSTRAINT enrolment_pk PRIMARY KEY (enrol_id);

-- Ensure no duplicate enrolments for same student/unit/year/semester combination
ALTER TABLE enrolment
    ADD CONSTRAINT enrolment_uq UNIQUE ( stu_nbr,
                                         unit_code,
                                         enrol_year,
                                         enrol_semester );

-- Foreign key constraint linking to student table
ALTER TABLE enrolment
    ADD CONSTRAINT student_enrolment_fk FOREIGN KEY ( stu_nbr )
        REFERENCES student ( stu_nbr );

-- Foreign key constraint linking to unit table
ALTER TABLE enrolment
    ADD CONSTRAINT unit_enrolment_fk FOREIGN KEY ( unit_code )
        REFERENCES unit ( unit_code );

-- Restrict semester values to valid options
ALTER TABLE enrolment
    ADD CONSTRAINT ck_enrol_sem CHECK ( enrol_semester IN (
        '1',
        '2',
        '3'
    ) );


-- Insert sample student data
INSERT INTO student VALUES (
    11111111,
    'Bloggs',
    'Fred',
    to_date('01-Jan-2003','dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111112,
    'Nice',
    NULL,                              -- No first name provided
    to_date('10-Oct-2004','dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111113,
    'Wheat',
    'Wendy',
    to_date('05-May-2005','dd-Mon-yyyy')
);

INSERT INTO student VALUES (
    11111114,
    'Sheen',
    'Cindy',
    to_date('25-Dec-2004','dd-Mon-yyyy')
);

-- Insert sample unit data
INSERT INTO unit VALUES (
    'FIT9999',
    'FIT Last Unit'
);

INSERT INTO unit VALUES (
    'FIT9132',
    'Introduction to Databases'
);

INSERT INTO unit VALUES (
    'FIT9161',
    'Project'
);

INSERT INTO unit VALUES (
    'FIT5111',
    'Student''s Life'                  -- Note: escaped apostrophe in SQL
);

-- Commit all changes to make them permanent
COMMIT;


SET ECHO OFF