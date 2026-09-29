USE company;

-- usuário gerente: enxerga tudo relacionado a employee e department,
-- incluindo as views que cruzam essas informações
CREATE USER IF NOT EXISTS 'usuario_gerente'@'localhost' IDENTIFIED BY 'Gerente#2026';

GRANT SELECT ON company.employee TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.department TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.vw_departamentos_gerentes TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.vw_empregados_por_departamento_localidade TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.vw_projetos_departamentos_gerentes TO 'usuario_gerente'@'localhost';
GRANT SELECT ON company.vw_empregados_dependentes_gerentes TO 'usuario_gerente'@'localhost';

-- usuário funcionario: só pode ver a view de projetos (não tem acesso a nada
-- que envolva employee, department ou gerente)
CREATE USER IF NOT EXISTS 'usuario_funcionario'@'localhost' IDENTIFIED BY 'Func#2026';

GRANT SELECT ON company.vw_projetos_mais_empregados TO 'usuario_funcionario'@'localhost';

-- garantindo que não sobrou nenhuma permissão indevida pra esse usuário
REVOKE ALL PRIVILEGES ON company.employee FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.department FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.vw_departamentos_gerentes FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.vw_empregados_por_departamento_localidade FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.vw_projetos_departamentos_gerentes FROM 'usuario_funcionario'@'localhost';
REVOKE ALL PRIVILEGES ON company.vw_empregados_dependentes_gerentes FROM 'usuario_funcionario'@'localhost';

FLUSH PRIVILEGES;

-- pra conferir depois:
-- SHOW GRANTS FOR 'usuario_gerente'@'localhost';
-- SHOW GRANTS FOR 'usuario_funcionario'@'localhost';
