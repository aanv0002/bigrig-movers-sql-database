/*****PLEASE ENTER YOUR DETAILS BELOW*****/
--T6-brm-json.sql

--Student ID: 35737476
--Student Name: Amra Anver

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

SET PAGESIZE 100
SET WRAP ON
SET HEADING OFF

-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
--used applied 12 task 2 to help create the following create statement
SELECT
    JSON_OBJECT(
        '_id' VALUE cu.cust_no,
        'customer_name' VALUE cu.cust_gname
                                      || ' '
                                      || cu.cust_fname,
        'customer_business' VALUE nvl(cu.cust_bname,'-'),
        'customer_address' VALUE cu.cust_street || ', ' || cu.cust_town || ' ' || cu.cust_pcode,
        'customer_phone' VALUE cu.cust_contact_no,
        'customer_stats' VALUE JSON_OBJECT(
                'number_of_quotes' VALUE COUNT(DISTINCT q.quote_no),
                'number_of_jobs' VALUE COUNT(DISTINCT j.job_no),
--added a prefix '$' to total paid job cost if rows exit, else '-'
                 'total_paid_jobcost' VALUE nvl(to_char(sum(CASE WHEN j.job_payment_made = 'Y' THEN j.job_cost
                            END),'FM$999990.00' ), '-'),
                'total_unpaid_jobcost' VALUE nvl(to_char(sum(CASE WHEN j.job_payment_made = 'N' THEN j.job_cost
                            END),'FM$999990.00'), '-')),
                'quotes' VALUE JSON_ARRAYAGG(JSON_OBJECT(
                'quote_no' VALUE q.quote_no,
                'quote_prepared_on' VALUE to_char(q.quote_prepared_date,'dd-Mon-yyyy'),
                'start_location' VALUE q.quote_start_location,
                'end_location' VALUE q.quote_end_location,
                'quote_cost' VALUE to_char(q.quote_cost,'$999990.00'),
                'assigned_to_job' VALUE CASE WHEN j.job_no IS NOT NULL THEN 'Y'ELSE 'N'
                    END,
                'job_cost' VALUE CASE
                        WHEN j.job_no IS NULL THEN
                            '-'
                        WHEN j.job_cost = q.quote_cost THEN
                            to_char(
                                q.quote_cost,
                                '$999990.00'
                            )
                        ELSE
                            to_char(
                                j.job_cost,
                                '$999990.00'
                            )
                    END
            )
        )
    FORMAT JSON )
    || ','
  FROM customer cu
  LEFT OUTER JOIN quote q ON cu.cust_no = q.cust_no
  LEFT OUTER JOIN job j ON q.quote_no = j.quote_no
 GROUP BY cu.cust_no,
          cu.cust_gname,
          cu.cust_fname,
          cu.cust_bname,
          cu.cust_street,
          cu.cust_town,
          cu.cust_pcode,
          cu.cust_contact_no
ORDER BY cu.cust_no;