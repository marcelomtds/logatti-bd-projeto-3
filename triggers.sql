-- Trigger reponsável por inserir o valor total da locação
CREATE TRIGGER tgr_inserir_atualizar_valor_locacao
ON locacao
AFTER INSERT, UPDATE
AS 
BEGIN
    DECLARE
    @diaria INT,
    @valor_diaria NUMERIC (8, 2),
	@id BIGINT
 
    SELECT 
		@id = i.id,
		@diaria = DATEDIFF (DAY, i.data_locacao, i.data_devolucao),
		@valor_diaria = a.valor_locacao
	FROM inserted AS i
	    INNER JOIN automovel AS a ON a.id = i.id_automovel
 
    UPDATE locacao SET valor = @diaria * @valor_diaria WHERE id = @id
END
GO

-- Trigger reponsável por inserir a pontuação do cliente
CREATE TRIGGER tgr_inserir_pontuacao_cliente
ON locacao
AFTER INSERT
AS 
BEGIN
    DECLARE
    @diaria INT,
	@id_cliente BIGINT
 
    SELECT 
		@id_cliente = c.id,
		@diaria = DATEDIFF (DAY, i.data_locacao, i.data_devolucao)
	FROM inserted AS i
	    INNER JOIN cliente AS c ON c.id = i.id_cliente
 
    UPDATE cliente SET pontuacao = (@diaria * 100) + pontuacao WHERE id = @id_cliente
END
GO

-- Trigger reponsável por remover a pontuação do cliente
CREATE TRIGGER tgr_remover_pontuacao_cliente
ON locacao
AFTER DELETE
AS 
BEGIN
    DECLARE
    @diaria INT,
	@id_cliente BIGINT
 
    SELECT 
		@id_cliente = c.id,
		@diaria = DATEDIFF (DAY, d.data_locacao, d.data_devolucao)
	FROM deleted AS d
	    INNER JOIN cliente AS c ON c.id = d.id_cliente
 
    UPDATE cliente SET pontuacao = pontuacao - (@diaria * 100) WHERE id = @id_cliente
END
GO

-- Trigger reponsável por alterar a pontuação do cliente
CREATE TRIGGER tgr_alterar_pontuacao_cliente
ON locacao
AFTER UPDATE
AS 
BEGIN
    DECLARE
    @diaria_antes INT,
	@diaria_depois INT,
	@id_cliente BIGINT
 
    SELECT 
		@id_cliente = c.id,
		@diaria_antes = DATEDIFF (DAY, d.data_locacao, d.data_devolucao)
	FROM deleted AS d
	    INNER JOIN cliente AS c ON c.id = d.id_cliente

	SELECT
		@diaria_depois = DATEDIFF (DAY, i.data_locacao, i.data_devolucao)
	FROM inserted AS i
	    INNER JOIN cliente AS c ON c.id = i.id_cliente
 
    UPDATE cliente SET pontuacao = (@diaria_depois * 100) - (@diaria_antes * 100) + pontuacao  WHERE id = @id_cliente
END
GO