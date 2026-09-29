# Gatilhos (triggers) — e-commerce

Duas triggers em cima do banco de e-commerce que já vínhamos usando nos desafios anteriores.

## Arquivos

`schema_extra.sql` cria três tabelas que ainda não existiam no projeto lógico: `funcionario` (colaboradores da loja, separado de cliente/vendedor/fornecedor), `salario_historico` (log de mudança de salário) e `cliente_excluido` (guarda os dados de quem apagou a conta). `triggers.sql` tem as duas triggers. `teste_triggers.sql` mostra elas disparando.

## trg_cliente_before_delete

Roda antes de um DELETE em `cliente`. Copia os dados da linha (nome, email, telefone, cpf/cnpj) pra `cliente_excluido` antes dela ser removida de verdade — assim, se o cliente decidir excluir a conta, a loja não perde o histórico dele.

No teste eu criei um cliente novo só pra isso, porque os clientes que já estavam na massa de dados do projeto lógico têm endereço e pedido vinculados, e a exclusão ia travar por causa da FK.

## trg_funcionario_before_update

Roda antes de um UPDATE em `funcionario`. Compara o salário antigo (`OLD.salario_base`) com o novo (`NEW.salario_base`) — se for diferente, grava os dois valores em `salario_historico`. Se o UPDATE for só pra mudar cargo ou nome, sem mexer no salário, não grava nada (por isso o IF).

## Rodando

```
mysql -u root -p < schema_extra.sql
mysql -u root -p < triggers.sql
mysql -u root -p < teste_triggers.sql
```

(assume que o banco `ecommerce` e a tabela `cliente` já existem, do desafio do projeto lógico)
