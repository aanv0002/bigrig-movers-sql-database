--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T5-brm-select.sql

--Student ID: 35737476
--Student Name: Amra Anver

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

/* (a) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer


--Purpose of the query is to get the customers whose average quoted cost for all quotes is greater than
-- overall average of the database
--Select command should display cust_no, cust_name, num_quotes and avg_quoted_cost
--num_quotes and avg_quoted_cost are not defined in the database, so defined them first as seperate columns

--Tables required for the select statement are QUOTE and CUSTOMER
--Only one main select command can be written with many sub select queries inside

--Referred to Applied 10 Question 2,11 and 12 to create this query
--Referred to Slide 35 Pre-Workshop 10, General Functions page 4 to understand how and why we can use decode
--to display the cust_bname when it is present instead of the customer's full name.

SELECT c.cust_no,
--use of decode(x,a,b,y) if x=a return b else return y
--if cust_bname is null return the cust_name, else return cust_bname
       decode(
           c.cust_bname,
           NULL,
           c.cust_gname
           || ' '
           || c.cust_fname,
           c.cust_bname
       ) AS cust_name,
       COUNT(q.quote_no) AS num_quotes,
--Added to char formatting to have a dollar sign in front and seperate thousands with a comma.
       to_char(
           avg(q.quote_cost),
           '$99,990.00'
       ) AS avg_quoted_cost
  FROM customer c
  JOIN quote q
ON c.cust_no = q.cust_no
 GROUP BY c.cust_no,
          decode(
              c.cust_bname,
              NULL,
              c.cust_gname
              || ' '
              || c.cust_fname,
              c.cust_bname
          )
HAVING AVG(q.quote_cost) > (
    SELECT AVG(quote_cost)
      FROM quote
)
----First order by decreasing avg_quoted_cost and then increasing order of cust_no
 ORDER BY AVG(q.quote_cost) DESC,
          c.cust_no;

/* (b) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

--Purpose of this query is to display how many jobs each employee has scheduled and who their managers are
--Tables to be used in the select statement are JOB and EMPLOYEE
--One main select statement, as many subqueries required

--Referred to Slide 35 Pre-Workshop 10, General Functions page 4 to understand where decode is suitable
--and how they should be written
--All column aliases have been taken from the screenshot of the output form required in the brief

SELECT e.emp_no,
       e.emp_gname
       || ' '
       || e.emp_fname AS emp_name,
--use of decode(x,a1,b1,a2,b2,a3,b3,a4,b4,y)
--if x=a1, return b1 (if e.emp_role = 'B', return 'Manager')
--if x=a2, return b2 (if e.emp_role = 'D', return 'Driver')
--if x=a3, return b3 (if e.emp_role = 'M', return 'Mechanic')
--if x=a4, return b4 (if e.emp_role = 'T', return 'Truck Dispatcher')
--else return y (return e.emp_role)
       decode(
           upper(e.emp_role),
           'B',
           'Manager',
           'D',
           'Driver',
           'M',
           'Mechanic',
           'T',
           'Truck Dispactcher',
           e.emp_role
       ) AS emp_role_full,
--use of decode(x,a,b,y)
--if x=a, return b, else return y
--if emp_no_manager = NULL, return 'No Manager', else return the full name of the manager
       decode(
           e.emp_no_manager,
           NULL,
           'No Manager',
           m.emp_gname
           || ' '
           || m.emp_fname
       ) AS manager_name,
--The FAQ ed post was taken into consideration when creating the jobs_dispatched column
-- where blank means no count displayed or the word (null) displayed
       CASE
           WHEN e.emp_role = 'D'
              AND COUNT(j.job_no) > 0 THEN
               to_char(count(j.job_no))
           ELSE
               '(null)'
       END AS jobs_dispatched
  FROM employee e
  LEFT JOIN employee m
ON e.emp_no_manager = m.emp_no
  LEFT JOIN job j
ON e.emp_no = j.sched_emp_no
 GROUP BY e.emp_no,
          e.emp_gname
          || ' '
          || e.emp_fname,
          e.emp_role,
          e.emp_no_manager,
          m.emp_gname
          || ' '
          || m.emp_fname
 ORDER BY e.emp_no; 

/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

--Purpose of this query is to retrieve and display the total quoted cost for all jobs assigned to
-- every truck along with its trailer purchase cost and then classify these jobs as high, standard or never used, 
--depending on the number of jobs assigned.
--Tables which will be used are JOB, COMBINATION, TRUCK, TRAILER and QUOTE to get the quote_cost
--Referred to Applied 11 Question 5 and 6 to create this query

--First the parent tables of combination were used to retrieve the truck_vin, truck_rego and trailer_code
SELECT tk.truck_vin,
       tk.truck_rego,
       tr.trailer_code,
--to_char used to format the trailer_purchase_cost with a dollar sign in front and necessary commas with 2 dp.
--lpad function, taken from general functions workshop 10 to right align the data in the column 
--and make it exactly 21 characters wide
       lpad(
           to_char(
               tr.trailer_purchase_cost,
               '$99,999,990.00'
           ),
           21
       ) AS trailer_purchase_cost,
       COUNT(j.job_no) AS num_jobs,
       CASE
           WHEN COUNT(j.job_no) = 0 THEN
               lpad(
                   'No jobs',
                   17
               )
           ELSE
--to_char used to format the total_quoted_cost with a dollar sign in front and necessary commas with 2 dp.
--lpad function, taken from general functions workshop 10 to right align the data in the column 
--and make it exactly 21 characters wide
               lpad(
                   to_char(
                       sum(q.quote_cost),
                       '$99,999,990.00'
                   ),
                   17
               )
       END AS total_quoted_cost,
       CASE
           WHEN COUNT(j.job_no) = 0 THEN
               'Never Used'
           WHEN COUNT(j.job_no) > (
               SELECT AVG(COUNT(job_no))
                 FROM job
                WHERE truck_vin IS NOT NULL
                  AND trailer_code IS NOT NULL
                GROUP BY truck_vin,
                         trailer_code
           )                   THEN
               'High Use'
           ELSE
               'Standard Use'
       END AS usage
  FROM combination c
  LEFT OUTER JOIN truck tk
ON c.truck_vin = tk.truck_vin
  LEFT OUTER JOIN trailer tr
ON c.trailer_code = tr.trailer_code
  LEFT OUTER JOIN job j
ON c.truck_vin = j.truck_vin
   AND c.trailer_code = j.trailer_code
  LEFT OUTER JOIN quote q
ON j.quote_no = q.quote_no
 GROUP BY tk.truck_vin,
          tk.truck_rego,
          tr.trailer_code,
          tr.trailer_purchase_cost
 ORDER BY num_jobs DESC,
          tk.truck_vin ASC,
          tr.trailer_code ASC;