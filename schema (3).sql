-- esquema da empresa (o clássico employee/department/project que a gente viu
-- no módulo de DDL). criando na ordem certa pra não dar erro de FK

CREATE DATABASE IF NOT EXISTS company;
USE company;

CREATE TABLE employee (
    fname       VARCHAR(15) NOT NULL,
    minit       CHAR(1),
    lname       VARCHAR(15) NOT NULL,
    ssn         CHAR(9) PRIMARY KEY,
    bdate       DATE,
    address     VARCHAR(30),
    sex         CHAR(1),
    salary      DECIMAL(10,2),
    super_ssn   CHAR(9),
    dno         INT NOT NULL
);

CREATE TABLE department (
    dname           VARCHAR(30) NOT NULL,
    dnumber         INT PRIMARY KEY,
    mgr_ssn         CHAR(9) NOT NULL,
    mgr_start_date  DATE,
    FOREIGN KEY (mgr_ssn) REFERENCES employee(ssn)
);

-- só depois que department existe dá pra fechar as FKs que faltaram no employee
ALTER TABLE employee ADD FOREIGN KEY (dno) REFERENCES department(dnumber);
ALTER TABLE employee ADD FOREIGN KEY (super_ssn) REFERENCES employee(ssn);

CREATE TABLE dept_locations (
    dnumber     INT NOT NULL,
    dlocation   VARCHAR(30) NOT NULL,
    PRIMARY KEY (dnumber, dlocation),
    FOREIGN KEY (dnumber) REFERENCES department(dnumber)
);

CREATE TABLE project (
    pname       VARCHAR(30) NOT NULL,
    pnumber     INT PRIMARY KEY,
    plocation   VARCHAR(30),
    dnum        INT NOT NULL,
    FOREIGN KEY (dnum) REFERENCES department(dnumber)
);

CREATE TABLE works_on (
    essn    CHAR(9) NOT NULL,
    pno     INT NOT NULL,
    hours   DECIMAL(3,1),
    PRIMARY KEY (essn, pno),
    FOREIGN KEY (essn) REFERENCES employee(ssn),
    FOREIGN KEY (pno) REFERENCES project(pnumber)
);

CREATE TABLE dependent (
    essn            CHAR(9) NOT NULL,
    dependent_name  VARCHAR(30) NOT NULL,
    sex             CHAR(1),
    bdate           DATE,
    relationship    VARCHAR(15),
    PRIMARY KEY (essn, dependent_name),
    FOREIGN KEY (essn) REFERENCES employee(ssn)
);
