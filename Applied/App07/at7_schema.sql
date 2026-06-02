set echo on
spool at7_schema_output.txt

DROP TABLE salesrep CASCADE CONSTRAINTS PURGE;
DROP TABLE drug CASCADE CONSTRAINTS PURGE;
DROP TABLE salesrep_drug CASCADE CONSTRAINTS PURGE;

CREATE TABLE salesrep(
    slsrep_id NUMBER(3) NOT NULL,
    slsrep_name VARCHAR2(50) NOT NULL,
    slsrep_mobile CHAR(10) NOT NULL
);

COMMENT ON COLUMN salesrep.slsrep_id IS 'Salesrep ID';
COMMENT ON COLUMN salesrep.slsrep_name IS 'Salesrep Name';
COMMENT ON COLUMN salesrep.slsrep_mobile IS 'Salesrep Mobile';

ALTER TABLE salesrep ADD CONSTRAINT salesrep_pk PRIMARY KEY ( slsrep_id );
ALTER TABLE salesrep ADD CONSTRAINT slsrep_mobile_uq UNIQUE (slsrep_mobile);

CREATE TABLE drug(
    drug_code CHAR(6) NOT NULL,
    drug_name VARCHAR2(50) NOT NULL,
    drug_pbs CHAR(1) NOT NULL
);

COMMENT ON COLUMN drug.drug_code IS 'Drug Code';
COMMENT ON COLUMN drug.drug_name IS 'Drug Name';
COMMENT ON COLUMN drug.drug_pbs IS 'Drug PBS Status';

ALTER TABLE drug ADD CONSTRAINT drug_pk PRIMARY KEY ( drug_code );
ALTER TABLE drug ADD CONSTRAINT chk_drug_pbs CHECK ( drug_pbs IN ('Y', 'N'));

CREATE TABLE salesrep_drug(
    drug_code CHAR(6) NOT NULL,
    slsrep_id NUMBER(3) NOT NULL,
    sd_date_assigned Date NOT NULL
);

COMMENT ON COLUMN salesrep_drug.slsrep_id IS 'Salesrep ID';
COMMENT ON COLUMN salesrep_drug.drug_code IS 'Drug Code';


ALTER TABLE salesrep_drug ADD CONSTRAINT slsrep_drug_pk PRIMARY KEY (drug_code, slsrep_id);
ALTER TABLE salesrep_drug ADD CONSTRAINT drug_fk FOREIGN KEY(drug_code) REFERENCES drug(drug_code);
ALTER TABLE salesrep_drug ADD CONSTRAINT slsrep_fk FOREIGN KEY(slsrep_id) REFERENCES salesrep(slsrep_id);

spool off
set echo off