USE ecommerce;

-- tabela de colaboradores da loja (não confundir com cliente, vendedor
-- ou fornecedor, que já existiam no projeto lógico)
CREATE TABLE funcionario (
    id_funcionario  INT AUTO_INCREMENT PRIMARY KEY,
    nome            VARCHAR(150) NOT NULL,
    cargo           VARCHAR(80),
    salario_base    DECIMAL(10,2) NOT NULL,
    data_admissao   DATE NOT NULL DEFAULT (CURRENT_DATE)
);

-- fica registrado sempre que o salário base de alguém mudar
CREATE TABLE salario_historico (
    id_historico        INT AUTO_INCREMENT PRIMARY KEY,
    id_funcionario      INT NOT NULL,
    salario_anterior    DECIMAL(10,2) NOT NULL,
    salario_novo        DECIMAL(10,2) NOT NULL,
    data_alteracao      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

-- guarda os dados do cliente quando ele decide excluir a conta,
-- pra não perder o histórico
CREATE TABLE cliente_excluido (
    id_cliente      INT NOT NULL,
    nome            VARCHAR(150),
    email           VARCHAR(150),
    telefone        VARCHAR(20),
    cpf             VARCHAR(11),
    cnpj            VARCHAR(14),
    data_exclusao   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
