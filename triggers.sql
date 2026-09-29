USE ecommerce;

DELIMITER $$

-- quando um cliente exclui a conta, guarda os dados dele antes
-- de a linha sumir de verdade da tabela cliente
CREATE TRIGGER trg_cliente_before_delete
BEFORE DELETE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO cliente_excluido (id_cliente, nome, email, telefone, cpf, cnpj)
    VALUES (OLD.id_cliente, OLD.nome, OLD.email, OLD.telefone, OLD.cpf, OLD.cnpj);
END$$

-- toda vez que o salário base de um funcionário mudar, registra
-- o valor antigo e o novo no histórico
CREATE TRIGGER trg_funcionario_before_update
BEFORE UPDATE ON funcionario
FOR EACH ROW
BEGIN
    IF OLD.salario_base <> NEW.salario_base THEN
        INSERT INTO salario_historico (id_funcionario, salario_anterior, salario_novo)
        VALUES (OLD.id_funcionario, OLD.salario_base, NEW.salario_base);
    END IF;
END$$

DELIMITER ;
