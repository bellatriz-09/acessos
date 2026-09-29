USE company;

CREATE USER IF NOT EXISTS 'usuario_gerente'@'localhost' IDENTIFIED BY 'Gerente#2026';

GRANT SELECT ON company.employee TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.department TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.vw_departamentos_gerentes TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.vw_empregados_por_departamento_localidade TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.vw_projetos_departamentos_gerentes TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.vw_empregados_dependentes_gerentes TO 'usuario_gerente'@'localhost';

CREATE USER IF NOT EXISTS 'usuario_funcionario'@'localhost' IDENTIFIED BY 'Func#2026';

GRANT SELECT ON company.vw_projetos_mais_empregados TO 'usuario_funcionario'@'localhost';

REVOKE ALL PRIVILEGES ON company.employee FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.department FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.vw_departamentos_gerentes FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.vw_empregados_por_departamento_localidade FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.vw_projetos_departamentos_gerentes FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.vw_empregados_dependentes_gerentes FROM 'usuario_funcionario'@'localhost';

FLUSH PRIVILEGES;
