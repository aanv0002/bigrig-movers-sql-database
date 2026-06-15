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


--Purpose of the query is to get the customers whose average quoted cost for all quotes is greater than overall average of the database
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



/* (c) */
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer

