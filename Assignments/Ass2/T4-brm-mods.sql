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
    quote_status = 'N',
    quote_status_reason = NULL
 WHERE quote_prepared_date < quote_pref_start_date
    OR quote_pref_start_date > (
    SELECT job_pickup_dt
      FROM job j
      JOIN quote q
    ON j.quote_no = q.quote_no
);
--for above update statement, I referred to ed forum faq post and post 2496 where the lecturer has commented 'for task 4 blank = null' 
--at the very bottom, when asked does blank mean an empty string('') or null, null was given as the answer.
--the same question was asked in post 2212, 'blank means no value added to that column'
--therefore the quote_status_reason column has been set as NULL when the quote status is No/not assigned ('N') since the brief says
--'You may leave the reason as blank for those not assigned'

COMMIT;

SELECT *
  FROM quote;
DESC quote;


--4(b)
DROP table truck_services;

CREATE TABLE truck_services (
    truck_vin        CHAR(17) NOT NULL,
    mech_emp_no      NUMBER(3) NOT NULL,
    tckserv_name     VARCHAR2(15) NOT NULL,
    tckserv_task     VARCHAR2(15) NOT NULL,
    tckserv_note     VARCHAR2(200) NOT NULL,
    tckserv_start_dt DATE NOT NULL,
    tckserv_end_dt   DATE
);

COMMENT ON COLUMN truck_services.truck_vin IS
    'Vehicle Indentification Number (VIN)';

COMMENT ON COLUMN truck_services.mech_emp_no IS
    'Employee number of the mechanic assigned';

COMMENT ON COLUMN truck_services.tckserv_name IS
    'Name of the service';

COMMENT ON COLUMN truck_services.tckserv_task IS
    'Name of the service task';

COMMENT ON COLUMN truck_services.tckserv_note IS
    'Free text note explaining the task in detail';

COMMENT ON COLUMN truck_services.tckserv_start_dt IS
    'Date and time the service started';

COMMENT ON COLUMN truck_services.tckserv_end_dt IS
    'Date and time the service ended';

ALTER TABLE truck_services ADD (
    CONSTRAINT truck_services_pk
        PRIMARY KEY ( truck_vin,
                      mech_emp_no,
                      tckserv_name,
                      tckserv_task,
                      tckserv_start_dt ),
    CONSTRAINT truck_tckserv_fk FOREIGN KEY ( truck_vin )
        REFERENCES truck ( truck_vin ),
    CONSTRAINT emp_tckserv_fk FOREIGN KEY ( mech_emp_no )
        REFERENCES employee ( emp_no )
);

desc truck_services;