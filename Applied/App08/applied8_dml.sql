/*
Applied 8
applied8_dml.sql

student id:
student name:
last modified date:

*/

---==A8-4.1 INSERT==--
/*1. Write SQL INSERT statements to add the data into the ENROLMENT table

AI Prompt used:

Generate 20 insert statements for the enrolment table where:
Some inserted rows must have null grades/marks.
to_date must be used when adding date attributes.
The first unit that students must enrol in and pass is FIT5111; they cannot enrol in any other units unless they have passed this unit.
The inserted rows must have some failed grades, resulting in a repeat attempt.

*/

-- AI Output:

-- Student 11111111 (Fred Bloggs)
-- Chronology: Fails FIT5111 first, repeats and passes it, then enrols in other units. Later fails FIT9999 and repeats it (current).
INSERT INTO enrolment VALUES (1, 11111111, 'FIT5111', to_date('2023', 'YYYY'), '1', 45, 'N');
INSERT INTO enrolment VALUES (2, 11111111, 'FIT5111', to_date('2023', 'YYYY'), '2', 65, 'C');
INSERT INTO enrolment VALUES (3, 11111111, 'FIT9132', to_date('2024', 'YYYY'), '1', 75, 'D');
INSERT INTO enrolment VALUES (4, 11111111, 'FIT9161', to_date('2024', 'YYYY'), '1', 80, 'HD');
INSERT INTO enrolment VALUES (5, 11111111, 'FIT9999', to_date('2024', 'YYYY'), '2', 42, 'N');
INSERT INTO enrolment VALUES (6, 11111111, 'FIT9999', to_date('2025', 'YYYY'), '1', NULL, NULL);

-- Student 11111112 (Nice)
-- Chronology: Passes FIT5111 immediately. Enrols in FIT9132 next semester and fails, then repeats and passes it. Currently enrolled in FIT9999.
INSERT INTO enrolment VALUES (7, 11111112, 'FIT5111', to_date('2023', 'YYYY'), '1', 55, 'P');
INSERT INTO enrolment VALUES (8, 11111112, 'FIT9132', to_date('2023', 'YYYY'), '2', 40, 'N');
INSERT INTO enrolment VALUES (9, 11111112, 'FIT9132', to_date('2024', 'YYYY'), '1', 60, 'C');
INSERT INTO enrolment VALUES (10, 11111112, 'FIT9161', to_date('2024', 'YYYY'), '1', 50, 'P');
INSERT INTO enrolment VALUES (11, 11111112, 'FIT9999', to_date('2024', 'YYYY'), '2', NULL, NULL);

-- Student 11111113 (Wendy Wheat)
-- Chronology: Passes FIT5111 immediately with high marks, completes FIT9132, currently ongoing in two units.
INSERT INTO enrolment VALUES (12, 11111113, 'FIT5111', to_date('2023', 'YYYY'), '2', 85, 'HD');
INSERT INTO enrolment VALUES (13, 11111113, 'FIT9132', to_date('2024', 'YYYY'), '1', 72, 'D');
INSERT INTO enrolment VALUES (14, 11111113, 'FIT9161', to_date('2024', 'YYYY'), '2', NULL, NULL);
INSERT INTO enrolment VALUES (15, 11111113, 'FIT9999', to_date('2024', 'YYYY'), '2', NULL, NULL);

-- Student 11111114 (Cindy Sheen)
-- Chronology: Fails FIT5111 twice in consecutive semesters before finally passing it on the third attempt. Currently ongoing in two subsequent units.
INSERT INTO enrolment VALUES (16, 11111114, 'FIT5111', to_date('2023', 'YYYY'), '1', 30, 'N');
INSERT INTO enrolment VALUES (17, 11111114, 'FIT5111', to_date('2023', 'YYYY'), '2', 48, 'N');
INSERT INTO enrolment VALUES (18, 11111114, 'FIT5111', to_date('2024', 'YYYY'), '1', 52, 'P');
INSERT INTO enrolment VALUES (19, 11111114, 'FIT9132', to_date('2024', 'YYYY'), '2', NULL, NULL);
INSERT INTO enrolment VALUES (20, 11111114, 'FIT9161', to_date('2024', 'YYYY'), '2', NULL, NULL);
COMMIT;
-- Post AI inserts added


---==A8-4.2 INSERT using SEQUENCEs ==--
/*1. Create a sequence for the STUDENT table called STUDENT_SEQ. */
drop sequence STUDENT_SEQ;
create sequence STUDENT_SEQ start with 11111115 increment by 1;

/*2. Create a sequence for the ENROLMENT table called ENROLMENT_SEQ. */
drop sequence ENROLMENT_SEQ;
create sequence ENROLMENT_SEQ start with 500 increment by 1;

/*3. Add a new student (Mickey Mouse) and an enrolment for this student as listed below; 
treat all the data that you add as a single transaction. */
INSERT INTO student VALUES(
    STUDENT_SEQ.nextval,
    'Mouse',
    'Mickey',
    to_date('01-Jan-2003','dd-Mon-yyyy')
);

INSERT INTO enrolment VALUES(
    ENROLMENT_SEQ.nextval,
    STUDENT_SEQ.currval,
    'FIT5111',
    to_date('2025','yyyy'),
    '1',
    NULL,
    NULL
);

COMMIT;

---==A8-4.3 Advanced INSERT==--
/*1. A new student has started a course. 
Subsequently this new student needs to enrol into the unit named Student's Life. 
Enter the new student's details, then insert his/her enrollment to the database 
using the sequence in combination with a SELECT statement. 
You can make up details of the new student and when they will attempt Student's Life 
- you may assume there is only one student with such a name in the system.

You must not do a manual lookup to find the unit code of the Student's Life
and the student number.
 */
INSERT INTO student VALUES (
    STUDENT_SEQ.nextval,
    'Mouse',
    'Minnie',
    to_date('01-Jan-2003','dd-Mon-yyyy')
);

COMMIT;

INSERT INTO enrolment VALUES (
    ENROLMENT_SEQ.nextval,
    (SELECT stu_nbr from student where upper(stu_lname)=upper('Mouse') and upper(stu_fname)=upper('Minnie')),
    (SELECT unit_code from unit where upper(unit_name)=upper('Student''s Life')),
    to_date('2025','yyyy'),
    '1',
    NULL,
    NULL
);

COMMIT;

---=A8-4.4 Creating a table and inserting data as a single SQL statement==--
/*1. Create a table called FIT5111_STUDENT. The table should contain all enrolments for the
unit FIT5111 */
DROP table FIT5111_STUDENT CASCADE CONSTRAINTS;
CREATE TABLE FIT5111_STUDENT AS 
(
    SELECT * FROM ENROLMENT where upper(unit_code)='FIT5111'
);

COMMENT ON COLUMN FIT5111_STUDENT.enrol_id IS
    'Enrolment identifier - surrogate key added';

COMMENT ON COLUMN FIT5111_STUDENT.stu_nbr IS
    'Student number';

COMMENT ON COLUMN FIT5111_STUDENT.unit_code IS
    'Unit code';

COMMENT ON COLUMN FIT5111_STUDENT.enrol_year IS
    'Enrolment year';

COMMENT ON COLUMN FIT5111_STUDENT.enrol_semester IS
    'Enrolment semester';

COMMENT ON COLUMN FIT5111_STUDENT.enrol_mark IS
    'Enrolment mark (real)';

COMMENT ON COLUMN FIT5111_STUDENT.enrol_grade IS
    'Enrolment grade (letter)';

/*2. Check the table exists */
SELECT * FROM cat;

/*3. List the contents of the table */
SELECT * FROM FIT5111_STUDENT;

---==A8-4.5 UPDATE==--
/*1. Update the unit name of FIT9999 from 'FIT Last Unit' to 'place holder unit'.*/
UPDATE unit set unit_name='place holder unit' where upper(unit_code)='FIT9999';
COMMIT;

/*2. Enter the mark and grade for the enrolment of Mickey Mouse in the Student's Life unit 
in semester 1 of 2025. The mark is 75, and the grade is D.*/
UPDATE enrolment set enrol_mark=75, enrol_grade='D'
where stu_nbr = (SELECT stu_nbr from student where upper(stu_lname)=upper('Mouse') and upper(stu_fname)=upper('Minnie'))
and unit_code = (SELECT unit_code from unit where upper(unit_name)=upper('Student''s Life'))
and to_char(enrol_year, 'yyyy') = '2025'
and enrol_semester = '1';
COMMIT;

/*3. The university introduced a new grade classification scale.
The new classification are:
0 - 44 is N
45 - 54 is P1
55 - 64 is P2
65 - 74 is C
75 - 84 is D
85 - 100 is HD
Change the database to reflect the new grade classification scale.
*/
update enrolment set enrol_grade='N' where enrol_mark between 0 and 44;
update enrolment set enrol_grade='P1'where enrol_mark between 45 and 54;
update enrolment set enrol_grade='P2' where enrol_mark between 55 and 64;
update enrolment set enrol_grade='C' where enrol_mark between 65 and 74;
update enrolment set enrol_grade='D' where enrol_mark between 75 and 84;
update enrolment set enrol_grade='HD' where enrol_mark between 85 and 100;
commit;

--==8-4.6 DELETE==--
/*1. A student with student number 11111114 has taken intermission in semester 1 2023,
hence all the enrolment of this student for semester 1 2023 should be removed.
Change the database to reflect this situation.*/
delete from enrolment where stu_nbr = '11111114' and to_char(enrol_year, 'yyyy') = '2023' and enrol_semester = '1';
commit;

/*2. The faculty decided to remove all Student's Life unit's enrolments.
Change the database to reflect this situation.
Note: unit names are unique in the database.*/
delete from enrolment where unit_code = (SELECT unit_code from unit where upper(unit_name)=upper('Student''s Life'));
commit;

/*3. Assume that Wendy Wheat (student number 11111113) has withdrawn from the university.
Remove her details from the database.*/
delete from enrolment where stu_nbr = '11111113';
delete from student where stu_nbr = '11111113';
commit;

