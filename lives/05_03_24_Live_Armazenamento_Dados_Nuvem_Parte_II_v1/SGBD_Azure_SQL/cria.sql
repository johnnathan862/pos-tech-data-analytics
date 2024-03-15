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



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o codigo interno para garantir o cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_BAIRRO' , 'COLUMN' , 'ID_BAIRRO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o nome do Bairro  pertencente Cidade do Estado Brasileiro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_BAIRRO' , 'COLUMN' , 'NM_BAIRRO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber a localização da zona onde se encontra o bairro. Alguns exemplos: Zona Norte, Zona Sul, Zona Leste, Zona Oeste, Centro.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_BAIRRO' , 'COLUMN' , 'NM_ZONA_BAIRRO' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o codigo da cidade e seu conteúdo é obrigatório e será preenchido automaticamente pelo sistema.

' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CIDADE' , 'COLUMN' , 'ID_CIDADE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o nome do Cidade pertencente ao Estado Brasileiro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CIDADE' , 'COLUMN' , 'NM_CIDADE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o código do IBGE que fornece informações para geração da NFe.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CIDADE' , 'COLUMN' , 'CD_IBGE' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a chave primária do cliente, ou seja, o número do cliente, com conteúdo numérico e obrigatório. Seu conteúdo será gerado automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CLIENTE' , 'COLUMN' , 'NR_CLIENTE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o nome do cliente, com conteúdo caractere  e obrigatório. Seu conteúdo será preenchido pelo funcionário do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CLIENTE' , 'COLUMN' , 'NM_CLIENTE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o número do CPF do cliente, com conteúdo numérico e obrigatório. O conteúdo será preenchido pelo funcionário do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CLIENTE' , 'COLUMN' , 'NR_CPF' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o número de estrelas do cliente, com conteúdo numérico e obrigatório. Seu conteúdo será gerado automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_CLIENTE' , 'COLUMN' , 'NR_ESTRELAS' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o codigo interno para garantir unicidade dos Estados do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ESTADO' , 'COLUMN' , 'ID_ESTADO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna ira receber a siga do Estado. Esse conteúdo é obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ESTADO' , 'COLUMN' , 'SG_ESTADO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o nome do estado. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ESTADO' , 'COLUMN' , 'NM_ESTADO' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a chave primária do item de pedido, ou seja, o item do número do pedido, com conteúdo numérico e obrigatório. Seu conteúdo será gerado automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ITEM_PEDIDO' , 'COLUMN' , 'NR_ITEM' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a quantidade do produto solictada pelo cliente. com conteúdo numérico e obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ITEM_PEDIDO' , 'COLUMN' , 'QT_PEDIDO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o valor unitário do produto no momento da compra. Seu conteúdo e numérico e possui 2 casas decimais.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_ITEM_PEDIDO' , 'COLUMN' , 'VL_UNITARIO' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o codigo interno para garantir o lograouro, que esta localizado no  cadastro dos  Bairros da Cidade do Estado do Brasil. Seu conteúdo é obrigatório e único será preenchido automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOGRADOURO' , 'COLUMN' , 'ID_LOGRADOURO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o nome do lograoduro. O padrão de armazenmento é  InitCap e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOGRADOURO' , 'COLUMN' , 'NM_LOGRADOURO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esta coluna irá receber o número do CEP do lograoduro. O padrão de armazenmento é  numérico  e seu conteúdo é obrigatório. Essa tabela já será preenchida pela área responsável. Novas inseções necessitam ser avaladas pelos gestores.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOGRADOURO' , 'COLUMN' , 'NR_CEP' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a chave primária da loja, com conteúdo numérico e o seu conteúdo será gerado automaticamente pelo sistema.
' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOJA' , 'COLUMN' , 'NR_LOJA' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a o nome da loja e seu conteúdo é obrigatório e deve ser cadastrado pelo funcionário da Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_LOJA' , 'COLUMN' , 'NM_LOJA' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a chave primária do pedido, ou seja, o número do pedido, com conteúdo numérico e obrigatório. Seu conteúdo será gerado automaticamente pelo sistema.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PEDIDO' , 'COLUMN' , 'NR_PEDIDO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a data do pedido, com conteúdo do tipo data e obrigatório. Seu conteúdo será preenchido automaticamente pelo sistema quando o pedido for gerado.
' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PEDIDO' , 'COLUMN' , 'DT_PEDIDO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o valor total do pedido, com conteúdo numérico com 2 casas de decimais e obrigatório. será preenchido automaticamente pelo sistema quando o pedido for gerado.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PEDIDO' , 'COLUMN' , 'VL_TOTAL_PEDIDO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o status do pedido, com conteúdo caractere  e obrigatório. Os valores possíveis são: Ativo, Inativo ou Cancelado.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PEDIDO' , 'COLUMN' , 'ST_PAGTO' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a chave primária do produto, com conteúdo numérico e obrigatório. Seu conteúdo será gerado automaticamente pelo sistema.
' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'NR_PRODUTO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o nome do produto, com conteúdo caractere  e obrigatório. Seu conteúdo será preenchido pelo funcionário do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'NM_PRODUTO' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a descrição completa  do produto, com conteúdo caractere  e opcional. Seu conteúdo será preenchido pelo funcionário do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'DS_COMPLETA' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber a categoria a qual pertence o produto, com conteúdo caractere  e obrigatório. Seu conteúdo será preenchido pelo funcionário do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'NM_CATEGORIA' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o preço unitário de venda do produto, com conteúdo numérico com 2 casas de decimais e obrigatório. Seu conteúdo será preenchido pelo funcionário do Ki*Delicia.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_PRODUTO' , 'COLUMN' , 'VL_PRECO_UNITARIO' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber a chave primária do telefone. Esse número é sequencial iniciando com 1 a partir do id do paciente e é  gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'ID_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o número do DDI do telefone. Seu conteudo é obrigatório' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'NR_DDI' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber o número do DDD do telefone.  Seu conteúdo é obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'NR_DDD' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber o número do telefone do  DDD do telefone.  Seu conteúdo é obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'NR_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber o tipo do  telefone  do telefone.  Seu conteúdo é obrigatório e os valores possiveis são: Comercial, Residencial, Recado e Celular' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'TP_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber o status do telefone.  Seu conteúdo é obrigatório e deve possuir os seguintes valores: (A)tivo ou (I)nativo.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_CLIENTE' , 'COLUMN' , 'ST_TELEFONE' 
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



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber a chave primária do telefone. Esse número é sequencial iniciando com 1 a partir do id do paciente e é  gerado automaticamente pelo sistema. Seu conteúdo é obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'ID_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Este atributo irá receber o número do DDI do telefone. Seu conteudo é obrigatório' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'NR_DDI' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber o número do DDD do telefone.  Seu conteúdo é obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'NR_DDD' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber o número do telefone do  DDD do telefone.  Seu conteúdo é obrigatório.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'NR_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber o tipo do  telefone  do telefone.  Seu conteúdo é obrigatório e os valores possiveis são: Comercial, Residencial, Recado e Celular' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'TP_TELEFONE' 
GO



EXEC sp_addextendedproperty 'MS_Description' , 'Esse atributo irá receber o status do telefone.  Seu conteúdo é obrigatório e deve possuir os seguintes valores: (A)tivo ou (I)nativo.' , 'USER' , 'dbo' , 'TABLE' , 'T_KD_TELEFONE_LOJA' , 'COLUMN' , 'ST_TELEFONE' 
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



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
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
