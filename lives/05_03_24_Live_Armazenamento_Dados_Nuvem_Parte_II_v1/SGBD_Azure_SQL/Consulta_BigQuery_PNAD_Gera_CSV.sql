--
-- Slide 48
--
https://basedosdados.org/dataset/c747a59f-b695-4d19-82e4-fef703e74c17?table=5894e1ac-dc08-465d-91a3-703683da85ba


--
-- Query que exibe por  ano, mes, semana e sigla UF a 
-- quantidade populacional, a quantidade de  população internada,
-- a quantidade que fez teste de covid  e a quantidade da população que pegou covid.
--
--
SELECT  
x1.ano,
x1.mes,
x1.semana,
x1.sigla_uf,
CASE 
          WHEN cast(x1.a003 as int64) = 1 THEN 'Homem'
          WHEN cast(x1.a003 as int64) = 2 THEN 'Mulher'
		    ELSE 'Outros'
		    END AS Sexo_Biologico,
 	count(*) as qtd_populacional,
		SUM( IF(cast(x1.B005 as int64) = 1 , 1, 0)) qtd_populacao_internada,
		SUM( IF(cast(x1.B006 as int64) = 1 , 1, 0)) qtd_populacao_sedada_respiracaoartificial,
    SUM( IF(cast(x1.B008 as int64) = 1 , 1, 0)) qtd_populacao_fez_teste_covid,
    SUM( IF(cast(x1.B009B as int64) = 1 , 1, 0)) qtd_populacao_pegou_covid
FROM `basedosdados.br_ibge_pnad_covid.microdados` x1
GROUP BY
x1.ano,
x1.mes,
x1.semana,
x1.sigla_uf,
CASE 
          WHEN cast(x1.a003 as int64) = 1 THEN 'Homem'
          WHEN cast(x1.a003 as int64) = 2 THEN 'Mulher'
		    ELSE 'Outros'
		    END
