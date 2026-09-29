USE ecommerce;

INSERT INTO funcionario (nome, cargo, salario_base) VALUES
('Rodrigo Alves', 'Atendente', 1800.00),
('Fernanda Costa', 'Estoquista', 1700.00);

UPDATE funcionario SET salario_base = 2000.00 WHERE nome = 'Rodrigo Alves';

SELECT * FROM salario_historico;

INSERT INTO cliente (nome, email, telefone, cpf, cnpj) VALUES
('Cliente Teste Exclusao', 'teste.exclusao@email.com', '93999998888', '99988877766', NULL);

DELETE FROM cliente WHERE email = 'teste.exclusao@email.com';

SELECT * FROM cliente_excluido;
