/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T2-brm-insert.sql

--Student ID: 35737476
--Student Name: Amra Anver

/*
Indicate if AI was used (Yes/No): Yes

If AI was used:
I used Google Gemini
I used these prompts:
generate insert statements for 
10 EMPLOYEE entries 
Involved at least 2 managers, 2 truck dispatchers, 1 mechanic and 2 drivers 
30 QUOTE entries 
Involved at least 5 different customers and 2 truck dispatchers 
Involved at least 2 customers who place at minimum 2 quotes 
20 JOB entries 
Involved at least 10 truck/trailer combinations 
Involved at least 5 truck/trailer combinations that are used in at least 2 jobs 
Involved at least 2 quotes that have never been placed as job 
Involved at least 5 jobs that have slightly higher or lower cost than the quote 
Involved at least 5 jobs that have the same cost as the quote

Your inserted data must conform to the following rules: 
(i)  Treat all the data you add as a single transaction, 
since you are setting up the initial test state for the database. 
(ii) The primary key values for this data should be
hardcoded values (i.e. NOT make use of sequences). 
If the primary key attribute’s data type is numeric, it must consist of values below 100. 
(iii)Dates used must be chosen between the 1st May 2026 and 31st July 2026.
(iv) The data added must be sensible (e.g. the drop-off time must be after the pick up time;
 only employees with the role Driver can drive the truck; the job must align with the quote; etc).
*/

--------------------------------------
--INSERT INTO employee
--------------------------------------
-- Managers (No manager assigned)
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (1, 'John', 'Smith', '0411111111', NULL, 'B', NULL);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (2, 'Jane', 'Doe', '0422222222', NULL, 'B', NULL);

-- Truck Dispatchers (Assigned to Manager 1)
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (3, 'Robert', 'Brown', '0433333333', NULL, 'T', 1);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (4, 'Emily', 'Davis', '0444444444', NULL, 'T', 1);

-- Mechanic (Assigned to Manager 2)
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (5, 'Michael', 'Wilson', '0455555555', NULL, 'M', 2);

-- Drivers (Assigned to Manager 2, require licenses)
INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (6, 'David', 'Taylor', '0466666666', 'LIC10000001', 'D', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (7, 'Sarah', 'Miller', '0477777777', 'LIC10000002', 'D', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (8, 'James', 'Anderson', '0488888888', 'LIC10000003', 'D', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (9, 'Jessica', 'Thomas', '0499999999', 'LIC10000004', 'D', 2);

INSERT INTO employee (emp_no, emp_gname, emp_fname, emp_contact_no, emp_licenceno, emp_role, emp_no_manager)
VALUES (10, 'Daniel', 'Jackson', '0412345678', 'LIC10000005', 'D', 2);

--------------------------------------
--INSERT INTO quote
--------------------------------------
-- Customer 1 Quotes (Multiple)
INSERT INTO quote VALUES (1, TO_DATE('01-May-2026', 'dd-Mon-yyyy'), TO_DATE('05-May-2026', 'dd-Mon-yyyy'), 'Melbourne WH', 'Sydney Hub', 1200.00, 1, 3);
INSERT INTO quote VALUES (2, TO_DATE('02-May-2026', 'dd-Mon-yyyy'), TO_DATE('07-May-2026', 'dd-Mon-yyyy'), 'Melbourne WH', 'Brisbane Depot', 2500.00, 1, 3);
INSERT INTO quote VALUES (3, TO_DATE('10-May-2026', 'dd-Mon-yyyy'), TO_DATE('15-May-2026', 'dd-Mon-yyyy'), 'Geelong Plant', 'Adelaide Port', 1800.00, 1, 4);
INSERT INTO quote VALUES (4, TO_DATE('15-May-2026', 'dd-Mon-yyyy'), TO_DATE('20-May-2026', 'dd-Mon-yyyy'), 'Sydney Hub', 'Melbourne WH', 1200.00, 1, 4);
INSERT INTO quote VALUES (5, TO_DATE('20-May-2026', 'dd-Mon-yyyy'), TO_DATE('25-May-2026', 'dd-Mon-yyyy'), 'Brisbane Depot', 'Sydney Hub', 1500.00, 1, 3);

-- Customer 2 Quotes (Multiple)
INSERT INTO quote VALUES (6, TO_DATE('01-May-2026', 'dd-Mon-yyyy'), TO_DATE('06-May-2026', 'dd-Mon-yyyy'), 'Sydney Port', 'Newcastle Yard', 800.00, 2, 4);
INSERT INTO quote VALUES (7, TO_DATE('05-May-2026', 'dd-Mon-yyyy'), TO_DATE('10-May-2026', 'dd-Mon-yyyy'), 'Sydney Port', 'Melbourne WH', 1300.00, 2, 3);
INSERT INTO quote VALUES (8, TO_DATE('12-May-2026', 'dd-Mon-yyyy'), TO_DATE('18-May-2026', 'dd-Mon-yyyy'), 'Wollongong Plant', 'Brisbane Depot', 2700.00, 2, 4);
INSERT INTO quote VALUES (9, TO_DATE('19-May-2026', 'dd-Mon-yyyy'), TO_DATE('22-May-2026', 'dd-Mon-yyyy'), 'Newcastle Yard', 'Sydney Port', 800.00, 2, 3);
INSERT INTO quote VALUES (10, TO_DATE('25-May-2026', 'dd-Mon-yyyy'), TO_DATE('30-May-2026', 'dd-Mon-yyyy'), 'Melbourne WH', 'Adelaide Port', 1900.00, 2, 4);

-- Customer 3 Quotes
INSERT INTO quote VALUES (11, TO_DATE('01-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('05-Jun-2026', 'dd-Mon-yyyy'), 'Perth Hub', 'Fremantle Port', 600.00, 3, 3);
INSERT INTO quote VALUES (12, TO_DATE('04-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('10-Jun-2026', 'dd-Mon-yyyy'), 'Perth Hub', 'Adelaide Port', 3200.00, 3, 3);
INSERT INTO quote VALUES (13, TO_DATE('10-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('15-Jun-2026', 'dd-Mon-yyyy'), 'Fremantle Port', 'Kalgoorlie Site', 1400.00, 3, 4);
INSERT INTO quote VALUES (14, TO_DATE('15-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('20-Jun-2026', 'dd-Mon-yyyy'), 'Adelaide Port', 'Melbourne WH', 1900.00, 3, 4);
INSERT INTO quote VALUES (15, TO_DATE('20-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('25-Jun-2026', 'dd-Mon-yyyy'), 'Melbourne WH', 'Perth Hub', 3400.00, 3, 3);

-- Customer 4 Quotes
INSERT INTO quote VALUES (16, TO_DATE('01-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('06-Jun-2026', 'dd-Mon-yyyy'), 'Melbourne WH', 'Ballarat Yard', 500.00, 4, 4);
INSERT INTO quote VALUES (17, TO_DATE('05-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('11-Jun-2026', 'dd-Mon-yyyy'), 'Melbourne WH', 'Sydney Hub', 1250.00, 4, 3);
INSERT INTO quote VALUES (18, TO_DATE('12-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('17-Jun-2026', 'dd-Mon-yyyy'), 'Ballarat Yard', 'Bendigo Plant', 450.00, 4, 4);
INSERT INTO quote VALUES (19, TO_DATE('18-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('23-Jun-2026', 'dd-Mon-yyyy'), 'Sydney Hub', 'Brisbane Depot', 1600.00, 4, 3);
INSERT INTO quote VALUES (20, TO_DATE('24-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('29-Jun-2026', 'dd-Mon-yyyy'), 'Brisbane Depot', 'Melbourne WH', 2600.00, 4, 4);

-- Customer 5 Quotes
INSERT INTO quote VALUES (21, TO_DATE('01-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('05-Jul-2026', 'dd-Mon-yyyy'), 'Brisbane Depot', 'Gold Coast Hub', 700.00, 5, 3);
INSERT INTO quote VALUES (22, TO_DATE('04-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('09-Jul-2026', 'dd-Mon-yyyy'), 'Brisbane Depot', 'Sydney Hub', 1550.00, 5, 4);
INSERT INTO quote VALUES (23, TO_DATE('10-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('14-Jul-2026', 'dd-Mon-yyyy'), 'Gold Coast Hub', 'Toowoomba Yard', 850.00, 5, 3);
INSERT INTO quote VALUES (24, TO_DATE('15-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('20-Jul-2026', 'dd-Mon-yyyy'), 'Sydney Hub', 'Melbourne WH', 1300.00, 5, 4);
INSERT INTO quote VALUES (25, TO_DATE('20-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('25-Jul-2026', 'dd-Mon-yyyy'), 'Melbourne WH', 'Brisbane Depot', 2550.00, 5, 3);

-- Quotes 26 to 30 to round up to exactly 30 entries (Assigned dynamically)
INSERT INTO quote VALUES (26, TO_DATE('02-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('06-Jul-2026', 'dd-Mon-yyyy'), 'Adelaide Port', 'Sydney Hub', 2100.00, 1, 3);
INSERT INTO quote VALUES (27, TO_DATE('06-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('11-Jul-2026', 'dd-Mon-yyyy'), 'Sydney Hub', 'Adelaide Port', 2100.00, 2, 4);
INSERT INTO quote VALUES (28, TO_DATE('12-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('18-Jul-2026', 'dd-Mon-yyyy'), 'Perth Hub', 'Sydney Port', 4100.00, 3, 3);
-- CRITICAL REQUIREMENT: These last 2 quotes (29 and 30) will NEVER be placed as a job.
INSERT INTO quote VALUES (29, TO_DATE('15-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('22-Jul-2026', 'dd-Mon-yyyy'), 'Darwin Depot', 'Melbourne WH', 5500.00, 4, 4);
INSERT INTO quote VALUES (30, TO_DATE('18-Jul-2026', 'dd-Mon-yyyy'), TO_DATE('26-Jul-2026', 'dd-Mon-yyyy'), 'Hobart Port', 'Sydney Hub', 3200.00, 5, 3);

--------------------------------------
--INSERT INTO job
--------------------------------------
-- Group 1: 5 combinations used TWICE (10 jobs total)
-- All 10 of these are set up to satisfy "5 jobs with same cost" and "5 jobs with different cost"

-- Combination A: ('1HGBH41JXMN109186', 'TRL01')
-- Job 1: Same cost
INSERT INTO job VALUES (1, TO_DATE('05-May-2026', 'dd-Mon-yyyy'), TO_DATE('07-May-2026', 'dd-Mon-yyyy'), 1200.00, 'Y', 1, 3, 6, 'TRL01', '1HGBH41JXMN109186');
-- Job 2: Different cost (higher due to route delays)
INSERT INTO job VALUES (2, TO_DATE('07-May-2026', 'dd-Mon-yyyy'), TO_DATE('10-May-2026', 'dd-Mon-yyyy'), 2700.00, 'Y', 2, 3, 7, 'TRL01', '1HGBH41JXMN109186');

-- Combination B: ('2FMDK3GC8BBA12345', 'TRL02')
-- Job 3: Same cost
INSERT INTO job VALUES (3, TO_DATE('10-May-2026', 'dd-Mon-yyyy'), TO_DATE('12-May-2026', 'dd-Mon-yyyy'), 1800.00, 'Y', 3, 4, 8, 'TRL02', '2FMDK3GC8BBA12345');
-- Job 4: Different cost (lower due to promotional discount)
INSERT INTO job VALUES (4, TO_DATE('15-May-2026', 'dd-Mon-yyyy'), TO_DATE('17-May-2026', 'dd-Mon-yyyy'), 1100.00, 'Y', 4, 4, 9, 'TRL02', '2FMDK3GC8BBA12345');

-- Combination C: ('3VWFE21C04M000001', 'TRL03')
-- Job 5: Same cost
INSERT INTO job VALUES (5, TO_DATE('20-May-2026', 'dd-Mon-yyyy'), TO_DATE('22-May-2026', 'dd-Mon-yyyy'), 1500.00, 'Y', 5, 3, 10, 'TRL03', '3VWFE21C04M000001');
-- Job 6: Different cost (higher)
INSERT INTO job VALUES (6, TO_DATE('06-May-2026', 'dd-Mon-yyyy'), TO_DATE('08-May-2026', 'dd-Mon-yyyy'), 950.00, 'Y', 6, 4, 6, 'TRL03', '3VWFE21C04M000001');

-- Combination D: ('4T1BF1FK5CU123456', 'TRL04')
-- Job 7: Same cost
INSERT INTO job VALUES (7, TO_DATE('10-May-2026', 'dd-Mon-yyyy'), TO_DATE('12-May-2026', 'dd-Mon-yyyy'), 1300.00, 'Y', 7, 3, 7, 'TRL04', '4T1BF1FK5CU123456');
-- Job 8: Different cost (higher)
INSERT INTO job VALUES (8, TO_DATE('18-May-2026', 'dd-Mon-yyyy'), TO_DATE('21-May-2026', 'dd-Mon-yyyy'), 2900.00, 'Y', 8, 4, 8, 'TRL04', '4T1BF1FK5CU123456');

-- Combination E: ('5FNRL5H40BB098765', 'TRL05')
-- Job 9: Same cost
INSERT INTO job VALUES (9, TO_DATE('22-May-2026', 'dd-Mon-yyyy'), TO_DATE('24-May-2026', 'dd-Mon-yyyy'), 800.00, 'Y', 9, 3, 9, 'TRL05', '5FNRL5H40BB098765');
-- Job 10: Different cost (lower)
INSERT INTO job VALUES (10, TO_DATE('30-May-2026', 'dd-Mon-yyyy'), TO_DATE('02-Jun-2026', 'dd-Mon-yyyy'), 1750.00, 'Y', 10, 4, 10, 'TRL05', '5FNRL5H40BB098765');


-- Group 2: 10 more jobs, each using an entirely unique, valid combination from brm-schema-insert.sql
-- This brings total distinct combinations used in the script up to 15 (which meets the "at least 10" criteria)

-- Job 11 | Combination 6: ('1FTFW1ET5DFC10112', 'TRL06')
INSERT INTO job VALUES (11, TO_DATE('05-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('07-Jun-2026', 'dd-Mon-yyyy'), 600.00, 'Y', 11, 3, 6, 'TRL06', '1FTFW1ET5DFC10112');

-- Job 12 | Combination 7: ('2C4RDGCG8ER123789', 'TRL07')
INSERT INTO job VALUES (12, TO_DATE('10-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('13-Jun-2026', 'dd-Mon-yyyy'), 3200.00, 'Y', 12, 3, 7, 'TRL07', '2C4RDGCG8ER123789');

-- Job 13 | Combination 8: ('5XYKT3A69CG234567', 'TRL08')
INSERT INTO job VALUES (13, TO_DATE('15-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('18-Jun-2026', 'dd-Mon-yyyy'), 1400.00, 'Y', 13, 4, 8, 'TRL08', '5XYKT3A69CG234567');

-- Job 14 | Combination 9: ('1HGBH41JXMN109186', 'TRL05')
INSERT INTO job VALUES (14, TO_DATE('20-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('23-Jun-2026', 'dd-Mon-yyyy'), 1900.00, 'Y', 14, 4, 9, 'TRL05', '1HGBH41JXMN109186');

-- Job 15 | Combination 10: ('2FMDK3GC8BBA12345', 'TRL08')
INSERT INTO job VALUES (15, TO_DATE('25-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('28-Jun-2026', 'dd-Mon-yyyy'), 3400.00, 'Y', 15, 3, 10, 'TRL08', '2FMDK3GC8BBA12345');

-- Job 16 | Combination 11: ('3VWFE21C04M000001', 'TRL01')
INSERT INTO job VALUES (16, TO_DATE('06-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('08-Jun-2026', 'dd-Mon-yyyy'), 500.00, 'Y', 16, 4, 6, 'TRL01', '3VWFE21C04M000001');

-- Job 17 | Combination 12: ('4T1BF1FK5CU123456', 'TRL07')
INSERT INTO job VALUES (17, TO_DATE('11-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('14-Jun-2026', 'dd-Mon-yyyy'), 1250.00, 'Y', 17, 3, 7, 'TRL07', '4T1BF1FK5CU123456');

-- Job 18 | Combination 13: ('5FNRL5H40BB098765', 'TRL02')
INSERT INTO job VALUES (18, TO_DATE('17-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('19-Jun-2026', 'dd-Mon-yyyy'), 450.00, 'Y', 18, 4, 8, 'TRL02', '5FNRL5H40BB098765');

-- Job 19 | Combination 14: ('1FTFW1ET5DFC10112', 'TRL04')
INSERT INTO job VALUES (19, TO_DATE('23-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('26-Jun-2026', 'dd-Mon-yyyy'), 1600.00, 'Y', 19, 3, 9, 'TRL04', '1FTFW1ET5DFC10112');

-- Job 20 | Combination 15: ('2C4RDGCG8ER123789', 'TRL03')
INSERT INTO job VALUES (20, TO_DATE('29-Jun-2026', 'dd-Mon-yyyy'), TO_DATE('02-Jul-2026', 'dd-Mon-yyyy'), 2600.00, 'Y', 20, 4, 10, 'TRL03', '2C4RDGCG8ER123789');

COMMIT;