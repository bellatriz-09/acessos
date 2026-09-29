USE company;

INSERT INTO employee (fname, minit, lname, ssn, bdate, address, sex, salary, super_ssn, dno) VALUES
('James',    'E', 'Borg',     '111111111', '1965-11-10', 'Belém-PA',    'M', 55000, NULL,        1),
('Jennifer', 'S', 'Wallace',  '222222222', '1978-06-20', 'Santarém-PA', 'F', 43000, '111111111', 4),
('Franklin', 'T', 'Wong',     '333333333', '1975-08-02', 'Santarém-PA', 'M', 41000, '111111111', 5),
('Ana',      NULL,'Souza',    '444444444', '1990-01-15', 'Santarém-PA', 'F', 33000, '333333333', 5),
('Carlos',   NULL,'Lima',     '555555555', '1988-05-22', 'Belém-PA',    'M', 32000, '333333333', 5),
('Beatriz',  NULL,'Prado',    '666666666', '1995-03-30', 'Santarém-PA', 'F', 30000, '222222222', 4);

INSERT INTO department (dname, dnumber, mgr_ssn, mgr_start_date) VALUES
('Diretoria',      1, '111111111', '2020-01-01'),
('Administração',  4, '222222222', '2021-03-01'),
('Pesquisa',       5, '333333333', '2019-06-15');

INSERT INTO dept_locations (dnumber, dlocation) VALUES
(1, 'Belém'),
(4, 'Santarém'),
(5, 'Santarém'),
(5, 'Belém');

INSERT INTO project (pname, pnumber, plocation, dnum) VALUES
('Projeto Alfa', 10, 'Santarém', 5),
('Projeto Beta', 20, 'Belém',    5),
('Projeto Gama', 30, 'Santarém', 4);

INSERT INTO works_on (essn, pno, hours) VALUES
('444444444', 10, 20.0),
('555555555', 10, 15.0),
('333333333', 10, 10.0),
('333333333', 20, 10.0),
('444444444', 20, 5.0),
('666666666', 30, 30.0),
('222222222', 30, 10.0);

INSERT INTO dependent (essn, dependent_name, sex, bdate, relationship) VALUES
('111111111', 'Maria Borg',      'F', '1975-01-01', 'Esposa'),
('333333333', 'Pedro Wong',      'M', '2005-05-05', 'Filho'),
('333333333', 'Julia Wong',      'F', '2008-09-09', 'Filha'),
('222222222', 'Rafael Wallace',  'M', '1998-02-02', 'Filho');
