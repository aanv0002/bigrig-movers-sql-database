--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: 35737476
--Student Name: Amra Anver

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--3(a)
drop sequence EMPLOYEE_SEQ;
create sequence EMPLOYEE_SEQ start with 300 increment by 5;

drop sequence QUOTE_SEQ;
create sequence QUOTE_SEQ start with 300 increment by 5;

drop sequence JOB_SEQ;
create sequence JOB_SEQ start with 300 increment by 5;


--3(b)
insert into employee values (
    EMPLOYEE_SEQ.nextval,
    'Aurello',
    'Brown',
    '0431952053',
    NULL,
    'T',
    (SELECT emp_no from employee where upper(emp_gname)=upper('Sarah') and upper(emp_fname)=upper('Mitchell'))
);

--Assumptions/Notes
--There is only one manager named Sarah Mitchell
--The case for Aurello Brown has been maintained as supplied
--Since Sarah Mitchell is given in itallics in the question, search conducted in the database for the string as listed

COMMIT;

--3(c)
INSERT INTO quote VALUES (
    QUOTE_SEQ.nextval,
    to_date('17-May-2026', 'dd-Mon-yyyy'),
    to_date('25-May-2026', 'dd-Mon-yyyy'),
    '29 Kuranda Road, Adelaide SA 5030',
    '9 Albatros Drive, Mount Gambier SA 5270',
    1000.00,
    (SELECT cust_no from customer where upper(cust_gname)='VICTORIA' and upper(cust_fname)='ELLA' and upper(cust_bname)=upper('Flintstone Store')),
    (SELECT emp_no from employee where emp_contact_no='0431952053')
);


INSERT INTO job VALUES (
    JOB_SEQ.nextval,
    to_date('25-May-2026 09:00', 'dd-Mon-yyyy HH24:MI'),
    to_date('25-May-2026 09:00', 'dd-Mon-yyyy HH24:MI') + (5/24),
    NULL,
    'Y',
    QUOTE_SEQ.currval,
    (SELECT emp_no from employee where emp_contact_no='0431952053'),
    (SELECT emp_no from employee where upper(emp_gname)=upper('Michael') and upper(emp_fname)=upper('Johnson') and upper(emp_role)='D'),
    'TRL08',
    '1HGBH41JXMN109186'
);

COMMIT;

--Assumptions/Notes
--There is only one customer named VICTORIA ELLA from the Flintstone Store, and only one driver named Michael Johnson in the database
--Both insert statements have been placed into one single transaction as per the client's request

--3(d)

UPDATE job set 

job_cost = (SELECT quote_cost*(1.2) from quote where quote_prepared_date=to_date('17-May-2026','dd-Mon-yyyy')),

job_pickup_dt = to_date('25-May-2026 14:00', 'dd-Mon-yyyy HH24:MI'), 

job_intended_dropoff_dt=to_date('25-May-2026 14:00', 'dd-Mon-yyyy HH24:MI') + (5/24)

where quote_no IN (SELECT quote_no from quote where (quote_prepared_date=to_date('17-May-2026', 'dd-Mon-yyyy') 
and cust_no=(SELECT cust_no from customer where upper(cust_gname)='VICTORIA' and upper(cust_fname)='ELLA' and upper(cust_bname)=upper('Flintstone Store'))));

COMMIT;

--Assumption/Notes
--There is only one customer named VICTORIA ELLA from the Flintstone Store in the database
--There is only one quote placed by VICTORIA ELLA on 17 May 2026

--3(e)

DELETE from job where quote_no IN (SELECT quote_no from quote where quote_prepared_date=to_date('17-May-2026','dd-Mon-yyyy') 
and cust_no=(SELECT cust_no from customer where upper(cust_gname)='VICTORIA' and upper(cust_fname)='ELLA' and upper(cust_bname)=upper('Flintstone Store')));

COMMIT;

--Assumption/Notes
--There is only one customer named VICTORIA ELLA from the Flintstone Store in the database
--There is only one quote placed by VICTORIA ELLA on 17 May 2026