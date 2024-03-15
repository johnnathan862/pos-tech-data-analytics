-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2024-01-31 23:34:26 BRST
--   site:      SQL Server 2012
--   tipo:      SQL Server 2012

CREATE TABLE T_KD_BAIRRO 
    (
     ID_BAIRRO INTEGER NOT NULL , 
     ID_CIDADE INTEGER NOT NULL , 
     NM_BAIRRO VARCHAR (45) NOT NULL , 
     NM_ZONA_BAIRRO VARCHAR (20) NOT NULL 
    )
GO 


ALTER TABLE T_KD_BAIRRO 
    ADD CONSTRAINT UK_T_PKD_BAIRRO_ZONA 
    CHECK ( NM_ZONA_BAIRRO IN ('CENTRO', 'ZONA LESTE', 'ZONA NORTE', 'ZONA OESTE', 'ZONA SUL') ) 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o codigo interno para garantir o cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conte�do � obrigat�rio e �nico ser� preenchido automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_BAIRRO' , 'COLUMN' , 'ID_BAIRRO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o nome do Bairro  pertencente Cidade do Estado Brasileiro. O padr�o de armazenmento �  InitCap e seu conte�do � obrigat�rio. Essa tabela j� ser� preenchida pela �rea respons�vel. Novas inse��es necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_BAIRRO' , 'COLUMN' , 'NM_BAIRRO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber a localiza��o da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_BAIRRO' , 'COLUMN' , 'NM_ZONA_BAIRRO' 
GO

ALTER TABLE T_KD_BAIRRO ADD CONSTRAINT PK_KD_BAIRRO PRIMARY KEY CLUSTERED (ID_BAIRRO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_CIDADE 
    (
     ID_CIDADE INTEGER NOT NULL , 
     ID_ESTADO INTEGER NOT NULL , 
     NM_CIDADE VARCHAR (60) NOT NULL , 
     CD_IBGE NUMERIC (8) NOT NULL , 
     NR_DDD NUMERIC (3) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o codigo da cidade e seu conte�do � obrigat�rio e ser� preenchido automaticamente pelo sistema.

' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CIDADE' , 'COLUMN' , 'ID_CIDADE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o nome do Cidade pertencente ao Estado Brasileiro. O padr�o de armazenmento �  InitCap e seu conte�do � obrigat�rio. Essa tabela j� ser� preenchida pela �rea respons�vel. Novas inse��es necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CIDADE' , 'COLUMN' , 'NM_CIDADE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o c�digo do IBGE que fornece informa��es para gera��o da NFe.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CIDADE' , 'COLUMN' , 'CD_IBGE' 
GO

ALTER TABLE T_KD_CIDADE ADD CONSTRAINT PK_KD_CIDADE PRIMARY KEY CLUSTERED (ID_CIDADE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_CLIENTE 
    (
     NR_CLIENTE INTEGER NOT NULL , 
     NM_CLIENTE VARCHAR (80) NOT NULL , 
     NR_CPF INTEGER , 
     NR_ESTRELAS INTEGER NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a chave prim�ria do cliente, ou seja, o n�mero do cliente, com conte�do num�rico e obrigat�rio. Seu conte�do ser� gerado automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CLIENTE' , 'COLUMN' , 'NR_CLIENTE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o nome do cliente, com conte�do caractere  e obrigat�rio. Seu conte�do ser� preenchido pelo funcion�rio do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CLIENTE' , 'COLUMN' , 'NM_CLIENTE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o n�mero do CPF do cliente, com conte�do num�rico e obrigat�rio. O conte�do ser� preenchido pelo funcion�rio do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CLIENTE' , 'COLUMN' , 'NR_CPF' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o n�mero de estrelas do cliente, com conte�do num�rico e obrigat�rio. Seu conte�do ser� gerado automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CLIENTE' , 'COLUMN' , 'NR_ESTRELAS' 
GO

ALTER TABLE T_KD_CLIENTE ADD CONSTRAINT PK_KD_CLIENTE PRIMARY KEY CLUSTERED (NR_CLIENTE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_ESTADO 
    (
     ID_ESTADO INTEGER NOT NULL , 
     SG_ESTADO CHAR (2) NOT NULL , 
     NM_ESTADO VARCHAR (30) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o codigo interno para garantir unicidade dos Estados do Brasil. Seu conte�do � obrigat�rio e �nico ser� preenchido automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ESTADO' , 'COLUMN' , 'ID_ESTADO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ira receber a siga do Estado. Esse conte�do � obrigat�rio.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ESTADO' , 'COLUMN' , 'SG_ESTADO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o nome do estado. O padr�o de armazenmento �  InitCap e seu conte�do � obrigat�rio. Essa tabela j� ser� preenchida pela �rea respons�vel. Novas inse��es necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ESTADO' , 'COLUMN' , 'NM_ESTADO' 
GO

ALTER TABLE T_KD_ESTADO ADD CONSTRAINT PK_KD_ESTADO PRIMARY KEY CLUSTERED (ID_ESTADO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_ITEM_PEDIDO 
    (
     NR_PEDIDO INTEGER NOT NULL , 
     NR_ITEM INTEGER NOT NULL , 
     NR_PRODUTO INTEGER NOT NULL , 
     QT_PEDIDO INTEGER NOT NULL , 
     VL_UNITARIO NUMERIC (10,2) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a chave prim�ria do item de pedido, ou seja, o item do n�mero do pedido, com conte�do num�rico e obrigat�rio. Seu conte�do ser� gerado automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ITEM_PEDIDO' , 'COLUMN' , 'NR_ITEM' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a quantidade do produto solictada pelo cliente. com conte�do num�rico e obrigat�rio.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ITEM_PEDIDO' , 'COLUMN' , 'QT_PEDIDO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o valor unit�rio do produto no momento da compra. Seu conte�do e num�rico e possui 2 casas decimais.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ITEM_PEDIDO' , 'COLUMN' , 'VL_UNITARIO' 
GO

ALTER TABLE T_KD_ITEM_PEDIDO ADD CONSTRAINT PK_KD_ITEM_PEDIDO PRIMARY KEY CLUSTERED (NR_PEDIDO, NR_ITEM)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_LOGRADOURO 
    (
     ID_LOGRADOURO INTEGER NOT NULL , 
     ID_BAIRRO INTEGER NOT NULL , 
     NM_LOGRADOURO VARCHAR (100) NOT NULL , 
     NR_CEP NUMERIC (8) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o codigo interno para garantir o lograouro, que esta localizado no  cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conte�do � obrigat�rio e �nico ser� preenchido automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOGRADOURO' , 'COLUMN' , 'ID_LOGRADOURO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o nome do lograoduro. O padr�o de armazenmento �  InitCap e seu conte�do � obrigat�rio. Essa tabela j� ser� preenchida pela �rea respons�vel. Novas inse��es necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOGRADOURO' , 'COLUMN' , 'NM_LOGRADOURO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ir� receber o n�mero do CEP do lograoduro. O padr�o de armazenmento �  num�rico  e seu conte�do � obrigat�rio. Essa tabela j� ser� preenchida pela �rea respons�vel. Novas inse��es necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOGRADOURO' , 'COLUMN' , 'NR_CEP' 
GO

ALTER TABLE T_KD_LOGRADOURO ADD CONSTRAINT PK_KD_LOGRADOURO PRIMARY KEY CLUSTERED (ID_LOGRADOURO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_LOJA 
    (
     NR_LOJA INTEGER NOT NULL , 
     ID_LOGRADOURO INTEGER NOT NULL , 
     NM_LOJA VARCHAR (70) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a chave prim�ria da loja, com conte�do num�rico e o seu conte�do ser� gerado automaticamente pelo sistema.
' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOJA' , 'COLUMN' , 'NR_LOJA' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a o nome da loja e seu conte�do � obrigat�rio e deve ser cadastrado pelo funcion�rio da Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOJA' , 'COLUMN' , 'NM_LOJA' 
GO

ALTER TABLE T_KD_LOJA ADD CONSTRAINT PK_KD_LOJA PRIMARY KEY CLUSTERED (NR_LOJA)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_PEDIDO 
    (
     NR_PEDIDO INTEGER NOT NULL , 
     NR_LOJA INTEGER NOT NULL , 
     NR_CLIENTE INTEGER NOT NULL , 
     DT_PEDIDO DATE NOT NULL , 
     VL_TOTAL_PEDIDO NUMERIC (10,2) NOT NULL , 
     ST_PAGTO VARCHAR (15) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a chave prim�ria do pedido, ou seja, o n�mero do pedido, com conte�do num�rico e obrigat�rio. Seu conte�do ser� gerado automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PEDIDO' , 'COLUMN' , 'NR_PEDIDO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a data do pedido, com conte�do do tipo data e obrigat�rio. Seu conte�do ser� preenchido automaticamente pelo sistema quando o pedido for gerado.
' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PEDIDO' , 'COLUMN' , 'DT_PEDIDO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o valor total do pedido, com conte�do num�rico com 2 casas de decimais e obrigat�rio. ser� preenchido automaticamente pelo sistema quando o pedido for gerado.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PEDIDO' , 'COLUMN' , 'VL_TOTAL_PEDIDO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o status do pedido, com conte�do caractere  e obrigat�rio. Os valores poss�veis s�o: Ativo, Inativo ou Cancelado.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PEDIDO' , 'COLUMN' , 'ST_PAGTO' 
GO

ALTER TABLE T_KD_PEDIDO ADD CONSTRAINT PK_KD_PEDIDO PRIMARY KEY CLUSTERED (NR_PEDIDO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_PRODUTO 
    (
     NR_PRODUTO INTEGER NOT NULL , 
     NM_PRODUTO VARCHAR (80) NOT NULL , 
     DS_COMPLETA VARCHAR (150) , 
     NM_CATEGORIA VARCHAR (40) NOT NULL , 
     VL_PRECO_UNITARIO NUMERIC (10,2) NOT NULL 
    )
GO 



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a chave prim�ria do produto, com conte�do num�rico e obrigat�rio. Seu conte�do ser� gerado automaticamente pelo sistema.
' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'NR_PRODUTO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o nome do produto, com conte�do caractere  e obrigat�rio. Seu conte�do ser� preenchido pelo funcion�rio do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'NM_PRODUTO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a descri��o completa  do produto, com conte�do caractere  e opcional. Seu conte�do ser� preenchido pelo funcion�rio do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'DS_COMPLETA' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber a categoria a qual pertence o produto, com conte�do caractere  e obrigat�rio. Seu conte�do ser� preenchido pelo funcion�rio do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'NM_CATEGORIA' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o pre�o unit�rio de venda do produto, com conte�do num�rico com 2 casas de decimais e obrigat�rio. Seu conte�do ser� preenchido pelo funcion�rio do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'VL_PRECO_UNITARIO' 
GO

ALTER TABLE T_KD_PRODUTO ADD CONSTRAINT PK_KD_PRODUTO PRIMARY KEY CLUSTERED (NR_PRODUTO)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_TELEFONE_CLIENTE 
    (
     ID_TELEFONE INTEGER NOT NULL , 
     NR_CLIENTE INTEGER NOT NULL , 
     NR_DDI NUMERIC (3) NOT NULL , 
     NR_DDD NUMERIC (3) NOT NULL , 
     NR_TELEFONE NUMERIC (10) NOT NULL , 
     TP_TELEFONE VARCHAR (20) NOT NULL , 
     ST_TELEFONE CHAR (1) NOT NULL 
    )
GO 


ALTER TABLE T_KD_TELEFONE_CLIENTE 
    ADD 
    CHECK ( ST_TELEFONE IN ('A', 'I') ) 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber a chave prim�ria do telefone. Esse n�mero � sequencial iniciando com 1 a partir do id do paciente e �  gerado automaticamente pelo sistema. Seu conte�do � obrigat�rio.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'ID_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o n�mero do DDI do telefone. Seu conteudo � obrigat�rio' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'NR_DDI' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber o n�mero do DDD do telefone.  Seu conte�do � obrigat�rio.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'NR_DDD' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber o n�mero do telefone do  DDD do telefone.  Seu conte�do � obrigat�rio.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'NR_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber o tipo do  telefone  do telefone.  Seu conte�do � obrigat�rio e os valores possiveis s�o: Comercial, Residencial, Recado e Celular' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'TP_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber o status do telefone.  Seu conte�do � obrigat�rio e deve possuir os seguintes valores: (A)tivo ou (I)nativo.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'ST_TELEFONE' 
GO

ALTER TABLE T_KD_TELEFONE_CLIENTE ADD CONSTRAINT PK_KD_TELEFONE_CLI PRIMARY KEY CLUSTERED (ID_TELEFONE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE T_KD_TELEFONE_LOJA 
    (
     ID_TELEFONE INTEGER NOT NULL , 
     NR_LOJA INTEGER NOT NULL , 
     NR_DDI NUMERIC (3) NOT NULL , 
     NR_DDD NUMERIC (3) NOT NULL , 
     NR_TELEFONE NUMERIC (10) NOT NULL , 
     TP_TELEFONE VARCHAR (20) NOT NULL , 
     ST_TELEFONE CHAR (1) NOT NULL 
    )
GO 


ALTER TABLE T_KD_TELEFONE_LOJA 
    ADD CONSTRAINT UK_RHSTU_STATUS_TELEF_PACIENTE 
    CHECK ( ST_TELEFONE IN ('A', 'I') ) 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber a chave prim�ria do telefone. Esse n�mero � sequencial iniciando com 1 a partir do id do paciente e �  gerado automaticamente pelo sistema. Seu conte�do � obrigat�rio.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'ID_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo ir� receber o n�mero do DDI do telefone. Seu conteudo � obrigat�rio' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'NR_DDI' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber o n�mero do DDD do telefone.  Seu conte�do � obrigat�rio.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'NR_DDD' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber o n�mero do telefone do  DDD do telefone.  Seu conte�do � obrigat�rio.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'NR_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber o tipo do  telefone  do telefone.  Seu conte�do � obrigat�rio e os valores possiveis s�o: Comercial, Residencial, Recado e Celular' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'TP_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo ir� receber o status do telefone.  Seu conte�do � obrigat�rio e deve possuir os seguintes valores: (A)tivo ou (I)nativo.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'ST_TELEFONE' 
GO

ALTER TABLE T_KD_TELEFONE_LOJA ADD CONSTRAINT PK_KD_TELEFONE_LOJA PRIMARY KEY CLUSTERED (ID_TELEFONE)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE T_KD_LOGRADOURO 
    ADD CONSTRAINT FK_KD_BAIRRO_LOGRADOURO FOREIGN KEY 
    ( 
     ID_BAIRRO
    ) 
    REFERENCES T_KD_BAIRRO 
    ( 
     ID_BAIRRO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_BAIRRO 
    ADD CONSTRAINT FK_KD_CIDADE_BAIRRO FOREIGN KEY 
    ( 
     ID_CIDADE
    ) 
    REFERENCES T_KD_CIDADE 
    ( 
     ID_CIDADE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_PEDIDO 
    ADD CONSTRAINT FK_KD_CLIENTE_PEDIDO FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES T_KD_CLIENTE 
    ( 
     NR_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_TELEFONE_CLIENTE 
    ADD CONSTRAINT FK_KD_CLIENTE_TELEF FOREIGN KEY 
    ( 
     NR_CLIENTE
    ) 
    REFERENCES T_KD_CLIENTE 
    ( 
     NR_CLIENTE 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_CIDADE 
    ADD CONSTRAINT FK_KD_ESTADO_CIDADE FOREIGN KEY 
    ( 
     ID_ESTADO
    ) 
    REFERENCES T_KD_ESTADO 
    ( 
     ID_ESTADO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_LOJA 
    ADD CONSTRAINT FK_KD_LOGRAD_LOJA FOREIGN KEY 
    ( 
     ID_LOGRADOURO
    ) 
    REFERENCES T_KD_LOGRADOURO 
    ( 
     ID_LOGRADOURO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_PEDIDO 
    ADD CONSTRAINT FK_KD_LOJA_PEDIDO FOREIGN KEY 
    ( 
     NR_LOJA
    ) 
    REFERENCES T_KD_LOJA 
    ( 
     NR_LOJA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_TELEFONE_LOJA 
    ADD CONSTRAINT FK_KD_LOJA_TELEFONE FOREIGN KEY 
    ( 
     NR_LOJA
    ) 
    REFERENCES T_KD_LOJA 
    ( 
     NR_LOJA 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_ITEM_PEDIDO 
    ADD CONSTRAINT FK_KD_PEDIDO_ITEM FOREIGN KEY 
    ( 
     NR_PEDIDO
    ) 
    REFERENCES T_KD_PEDIDO 
    ( 
     NR_PEDIDO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE T_KD_ITEM_PEDIDO 
    ADD CONSTRAINT FK_KD_PROD_ITEM_PED FOREIGN KEY 
    ( 
     NR_PRODUTO
    ) 
    REFERENCES T_KD_PRODUTO 
    ( 
     NR_PRODUTO 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Relat�rio do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             34
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
