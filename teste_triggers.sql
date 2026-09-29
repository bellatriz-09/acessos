USE ecommerce;

-- contrata dois funcionários pra ter o que testar
INSERT INTO funcionario (nome, cargo, salario_base) VALUES
('Rodrigo Alves', 'Atendente', 1800.00),
('Fernanda Costa', 'Estoquista', 1700.00);

-- atualiza o salário do Rodrigo -> deve disparar a trigger e gravar
-- uma linha em salario_historico
UPDATE funcionario SET salario_base = 2000.00 WHERE nome = 'Rodrigo Alves';

SELECT * FROM salario_historico;

-- cria um cliente novo só pra testar a exclusão (os clientes que já
-- existem na massa de dados do projeto lógico têm endereço/pedido
-- vinculado, então excluir eles direto ia esbarrar nas FKs)
INSERT INTO cliente (nome, email, telefone, cpf, cnpj) VALUES
('Cliente Teste Exclusao', 'teste.exclusao@email.com', '93999998888', '99988877766', NULL);

DELETE FROM cliente WHERE email = 'teste.exclusao@email.com';

SELECT * FROM cliente_excluido;
