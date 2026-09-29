# Views e controle de acesso — cenário company

Esse projeto usa o banco "company" (employee, department, dept_locations, project, works_on, dependent) pra criar 5 views e depois restringir quem pode ver o quê.

## O que tem em cada arquivo

`schema.sql` monta as tabelas na ordem certa (department e employee se referenciam, então algumas FKs só entram depois via ALTER TABLE). `dados.sql` popula com uma empresa pequena: 3 departamentos, 6 funcionários, 3 projetos e alguns dependentes. `views.sql` tem as 5 views pedidas. `usuarios_permissoes.sql` cria os dois usuários e dá/tira permissão nas views.

## As views

1. **vw_empregados_por_departamento_localidade** — quantos empregados tem em cada departamento, cruzado com a(s) localidade(s) dele. Vale reparar que localidade é um dado do departamento, não do empregado, então quando um departamento tem duas localidades (fiz a Pesquisa assim de propósito) o total de empregados repete pras duas — não é bug, é assim que a consulta funciona nesse modelo.
2. **vw_departamentos_gerentes** — nome do departamento e quem é o gerente.
3. **vw_projetos_mais_empregados** — projetos ordenados pelo número de pessoas alocadas, do que tem mais gente pro que tem menos.
4. **vw_projetos_departamentos_gerentes** — junta projeto, departamento responsável e o gerente desse departamento.
5. **vw_empregados_dependentes_gerentes** — só aparecem quem tem dependente cadastrado, com uma coluna dizendo se essa pessoa também é gerente de algum departamento.

## Sobre as permissões

O desafio pede um usuário gerente com acesso a employee e department, e um usuário funcionário sem acesso a nada disso. Fiz assim:

- `usuario_gerente` recebe SELECT nas tabelas `employee` e `department` direto, além das views que envolvem departamento/gerente.
- `usuario_funcionario` só recebe SELECT na view de projetos (`vw_projetos_mais_empregados`). Coloquei uns REVOKE explícitos nas outras views também, só pra deixar registrado que esse usuário não deveria ter acesso a nada relacionado a employee/department, mesmo que no fim das contas ele nunca tenha recebido esse GRANT.

As senhas no script são só de exemplo (`Gerente#2026` e `Func#2026`) — pra rodar de verdade, troca por uma senha própria.

## Rodando

```
mysql -u root -p < schema.sql
mysql -u root -p < dados.sql
mysql -u root -p < views.sql
mysql -u root -p < usuarios_permissoes.sql
```
