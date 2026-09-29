USE company;

CREATE VIEW vw_empregados_por_departamento_localidade AS
SELECT d.dname AS departamento,
       dl.dlocation AS localidade,
       COUNT(e.ssn) AS total_empregados
FROM department d
JOIN dept_locations dl ON dl.dnumber = d.dnumber
LEFT JOIN employee e ON e.dno = d.dnumber
GROUP BY d.dname, dl.dlocation;

CREATE VIEW vw_departamentos_gerentes AS
SELECT d.dname AS departamento,
       CONCAT(e.fname, ' ', e.lname) AS gerente,
       d.mgr_start_date AS gerente_desde
FROM department d
JOIN employee e ON e.ssn = d.mgr_ssn;

CREATE VIEW vw_projetos_mais_empregados AS
SELECT p.pname AS projeto,
       COUNT(w.essn) AS total_empregados
FROM project p
JOIN works_on w ON w.pno = p.pnumber
GROUP BY p.pname
ORDER BY total_empregados DESC;

CREATE VIEW vw_projetos_departamentos_gerentes AS
SELECT p.pname AS projeto,
       d.dname AS departamento,
       CONCAT(e.fname, ' ', e.lname) AS gerente
FROM project p
JOIN department d ON d.dnumber = p.dnum
JOIN employee e ON e.ssn = d.mgr_ssn;

CREATE VIEW vw_empregados_dependentes_gerentes AS
SELECT DISTINCT
       CONCAT(e.fname, ' ', e.lname) AS empregado,
       CASE WHEN EXISTS (
                SELECT 1 FROM department d WHERE d.mgr_ssn = e.ssn
            ) THEN 'Sim' ELSE 'Não' END AS eh_gerente
FROM employee e
JOIN dependent dep ON dep.essn = e.ssn;
