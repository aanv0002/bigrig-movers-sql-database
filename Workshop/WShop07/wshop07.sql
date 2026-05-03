/*
This file is used within workshop 7 for creating and insert table
*/
   set echo on
DROP TABLE member CASCADE CONSTRAINTS PURGE;
CREATE TABLE member (
    mem_id               NUMBER(8) NOT NULL,
    mem_fname            VARCHAR2(30),
    mem_lname            VARCHAR2(30),
    mem_phone            CHAR(10) NOT NULL,
    mem_joined_date      DATE NOT NULL,
    mem_last_attend_date DATE
);


COMMENT ON COLUMN member.mem_id IS
    'member identifier (unique)';
COMMENT ON COLUMN member.mem_fname IS
    'member first name';
COMMENT ON COLUMN member.mem_lname IS
    'member last name';
COMMENT ON COLUMN member.mem_phone IS
    'member phone number';
COMMENT ON COLUMN member.mem_joined_date IS
    'date that member joined';
COMMENT ON COLUMN member.mem_last_attend_date IS
    'last date that member attended';

ALTER TABLE member ADD CONSTRAINT member_pk PRIMARY KEY ( mem_id );

INSERT INTO member (
    mem_id,
    mem_fname,
    mem_phone,
    mem_joined_date
) VALUES ( 100,
           'Amra',
           '0462271312',
           TO_DATE('18/04/2026','dd/mm/yyyy') );

SELECT *
  FROM member;

ROLLBACK; /*undoes the changes*/
SELECT *
  FROM member;

insert into member
VALUES(100,'Amra', null, '0462271312',
to_date('18/04/2026', ' dd/mm/yyyy'));

select * from member;
commit;