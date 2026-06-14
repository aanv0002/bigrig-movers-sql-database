--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-brm-mods.sql

--Student ID: 35737476
--Student Name: Amra Anver

/*
    -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
    In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
*/

--4(a)
ALTER TABLE quote ADD (
    quote_status        CHAR(1),
    quote_status_reason VARCHAR2(20),
    CONSTRAINT chk_quote_status CHECK ( quote_status IN ( 'Y',
                                                          'N' ) )
);

COMMENT ON COLUMN quote.quote_status IS
    'Status of the quote - has it been assigned to a job, (Yes(Y) or No(N))';

COMMENT ON COLUMN quote.quote_status_reason IS
    'Reason the quote was not assigned to a job';

UPDATE quote
   SET
    quote_status = 'Y'
 WHERE quote_pref_start_date IN (
    SELECT job_pickup_dt
      FROM job j
      JOIN quote q
    ON j.quote_no = q.quote_no
);

UPDATE quote
   SET
    quote_status = 'N'
 WHERE quote_prepared_date < quote_pref_start_date
    OR quote_pref_start_date > (
    SELECT job_pickup_dt
      FROM job j
      JOIN quote q
    ON j.quote_no = q.quote_no
);
--for above update statement, I referred to ed forum post 2496 where the lecturer has commented 'for task 4 blank = null' at the very bottom.
--therefore the quote_status_reason column has been left as null where the quote status is No ('N')
COMMIT;

SELECT *
  FROM quote;
DESC quote;


--4(b)

