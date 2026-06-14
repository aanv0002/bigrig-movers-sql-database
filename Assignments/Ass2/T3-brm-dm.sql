--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-brm-dm.sql

--Student ID: 35737476
--Student Name: Amra Anver

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--3(a)
DROP SEQUENCE employee_seq;
CREATE SEQUENCE employee_seq START WITH 300 INCREMENT BY 5;

DROP SEQUENCE quote_seq;
CREATE SEQUENCE quote_seq START WITH 300 INCREMENT BY 5;

DROP SEQUENCE job_seq;
CREATE SEQUENCE job_seq START WITH 300 INCREMENT BY 5;


--3(b)
INSERT INTO employee VALUES ( employee_seq.NEXTVAL,
                              'Aurello',
                              'Brown',
                              '0431952053',
                              NULL,
                              'T',
                              (
                                  SELECT emp_no
                                    FROM employee
                                   WHERE upper(emp_gname) = upper('Sarah')
                                     AND upper(emp_fname) = upper('Mitchell')
                              ) );

COMMIT;

--Assumptions/Notes
--There is only one manager named Sarah Mitchell
--The case for Aurello Brown has been maintained as supplied
--Since Sarah Mitchell is given in itallics in the question, search conducted in the database for the string as listed


--3(c)
INSERT INTO quote VALUES ( quote_seq.NEXTVAL,
                           TO_DATE('17-May-2026','dd-Mon-yyyy'),
                           TO_DATE('25-May-2026','dd-Mon-yyyy'),
                           '29 Kuranda Road, Adelaide SA 5030',
                           '9 Albatros Drive, Mount Gambier SA 5270',
                           1000.00,
                           (
                               SELECT cust_no
                                 FROM customer
                                WHERE upper(cust_gname) = 'VICTORIA'
                                  AND upper(cust_fname) = 'ELLA'
                                  AND upper(cust_bname) = upper('Flintstone Store')
                           ),
                           (
                               SELECT emp_no
                                 FROM employee
                                WHERE emp_contact_no = '0431952053'
                           ) );


INSERT INTO job VALUES ( job_seq.NEXTVAL,
                         TO_DATE('25-May-2026 09:00','dd-Mon-yyyy HH24:MI'),
                         TO_DATE('25-May-2026 09:00','dd-Mon-yyyy HH24:MI') + ( 5 / 24
                         ),
                         NULL,
                         'Y',
                         quote_seq.CURRVAL,
                         (
                             SELECT emp_no
                               FROM employee
                              WHERE emp_contact_no = '0431952053'
                         ),
                         (
                             SELECT emp_no
                               FROM employee
                              WHERE upper(emp_gname) = upper('Michael')
                                AND upper(emp_fname) = upper('Johnson')
                                AND upper(emp_role) = 'D'
                         ),
                         'TRL08',
                         '1HGBH41JXMN109186' );

COMMIT;

--Assumptions/Notes
--There is only one customer named VICTORIA ELLA from the Flintstone Store, and only one driver named Michael Johnson in the database
--Both insert statements have been placed into one single transaction as per the client's request

--3(d)

UPDATE job
   SET job_cost = (
    SELECT quote_cost * ( 1.2 )
      FROM quote
     WHERE quote_prepared_date = TO_DATE('17-May-2026','dd-Mon-yyyy')
),
       job_pickup_dt = TO_DATE('25-May-2026 14:00','dd-Mon-yyyy HH24:MI'),
       job_intended_dropoff_dt = TO_DATE('25-May-2026 14:00','dd-Mon-yyyy HH24:MI') +
       ( 5 / 24 )
 WHERE quote_no IN (
    SELECT quote_no
      FROM quote
     WHERE ( quote_prepared_date = TO_DATE('17-May-2026',
             'dd-Mon-yyyy')
       AND cust_no = (
        SELECT cust_no
          FROM customer
         WHERE upper(cust_gname) = 'VICTORIA'
           AND upper(cust_fname) = 'ELLA'
           AND upper(cust_bname) = upper('Flintstone Store')
    ) )
);

COMMIT;

--Assumption/Notes
--There is only one customer named VICTORIA ELLA from the Flintstone Store in the database
--There is only one quote placed by VICTORIA ELLA on 17 May 2026

--3(e)

DELETE FROM job
 WHERE quote_no IN (
    SELECT quote_no
      FROM quote
     WHERE quote_prepared_date = TO_DATE('17-May-2026',
             'dd-Mon-yyyy')
       AND cust_no = (
        SELECT cust_no
          FROM customer
         WHERE upper(cust_gname) = 'VICTORIA'
           AND upper(cust_fname) = 'ELLA'
           AND upper(cust_bname) = upper('Flintstone Store')
    )
);

COMMIT;

--Assumption/Notes
--There is only one customer named VICTORIA ELLA from the Flintstone Store in the database
--There is only one quote placed by VICTORIA ELLA on 17 May 2026