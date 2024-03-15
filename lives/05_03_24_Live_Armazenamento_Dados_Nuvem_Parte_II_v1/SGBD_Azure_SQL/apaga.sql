-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2024-01-31 23:34:26 BRST
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012



ALTER TABLE T_KD_LOGRADOURO 
    DROP CONSTRAINT FK_KD_BAIRRO_LOGRADOURO 
GO

DROP TABLE T_KD_BAIRRO
GO

ALTER TABLE T_KD_BAIRRO 
    DROP CONSTRAINT FK_KD_CIDADE_BAIRRO 
GO

DROP TABLE T_KD_CIDADE
GO

ALTER TABLE T_KD_PEDIDO 
    DROP CONSTRAINT FK_KD_CLIENTE_PEDIDO 
GO

ALTER TABLE T_KD_TELEFONE_CLIENTE 
    DROP CONSTRAINT FK_KD_CLIENTE_TELEF 
GO

DROP TABLE T_KD_CLIENTE
GO

ALTER TABLE T_KD_CIDADE 
    DROP CONSTRAINT FK_KD_ESTADO_CIDADE 
GO

DROP TABLE T_KD_ESTADO
GO

DROP TABLE T_KD_ITEM_PEDIDO
GO

ALTER TABLE T_KD_LOJA 
    DROP CONSTRAINT FK_KD_LOGRAD_LOJA 
GO

DROP TABLE T_KD_LOGRADOURO
GO

ALTER TABLE T_KD_PEDIDO 
    DROP CONSTRAINT FK_KD_LOJA_PEDIDO 
GO

ALTER TABLE T_KD_TELEFONE_LOJA 
    DROP CONSTRAINT FK_KD_LOJA_TELEFONE 
GO

DROP TABLE T_KD_LOJA
GO

ALTER TABLE T_KD_ITEM_PEDIDO 
    DROP CONSTRAINT FK_KD_PEDIDO_ITEM 
GO

DROP TABLE T_KD_PEDIDO
GO

ALTER TABLE T_KD_ITEM_PEDIDO 
    DROP CONSTRAINT FK_KD_PROD_ITEM_PED 
GO

DROP TABLE T_KD_PRODUTO
GO

DROP TABLE T_KD_TELEFONE_CLIENTE
GO

DROP TABLE T_KD_TELEFONE_LOJA
GO