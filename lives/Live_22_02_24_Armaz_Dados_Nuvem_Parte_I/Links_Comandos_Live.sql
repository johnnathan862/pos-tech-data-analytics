
--
-- Slide 42
--
https://covid19.ibge.gov.br/

--
-- Slide 48
--
https://basedosdados.org/dataset/c747a59f-b695-4d19-82e4-fef703e74c17?table=5894e1ac-dc08-465d-91a3-703683da85ba


--
-- Slide 50
--
SELECT * FROM `basedosdados.br_ibge_pnad_covid.dicionario` LIMIT 100


--
-- Slide 52
--
SELECT * FROM `basedosdados.br_ibge_pnad_covid.dicionario`




Nosso objetivo foi analisar a associação
entre a duração do trabalho remoto e o diagnóstico 
positivo da COVID-19 entre pessoas ocupadas no Brasil.

https://covid19.ibge.gov.br/



--
-- Teste upload CSV no BigQuery
-- +Adicionar => Arquivo Local => CSV

SELECT * FROM `postech-pnad-covid19-ibge.vertopcovid.covid19` LIMIT 1000


--
-- Outra opção
--
https://basedosdados.org/dataset/c747a59f-b695-4d19-82e4-fef703e74c17?table=5894e1ac-dc08-465d-91a3-703683da85ba

--
-- Slide 59
--
SELECT 
    x1.ANO,
    x1.MES,
    COUNT(*) qtd_populacao_entrevistada,
    SUM( IF(cast(x1.B002 as int64) = 1 , 1, 0)) qtd_populacao_internada,
    ROUND( (SUM( IF(cast(x1.B002 as int64) = 1 , 1, 0)) / COUNT(*))*100 ,2) perc_populacao_internada,
    SUM( IF(cast(x1.B002 as int64) = 2 , 1, 0)) qtd_populacao_nao_internada
FROM `basedosdados.br_ibge_pnad_covid.microdados` x1 
WHERE   
(
cast(x1.B0011 as int64) = 1 OR cast(x1.B0012 as int64) = 1 OR
cast(x1.B0013 as int64) = 1 OR cast(x1.B0014 as int64) = 1 OR
cast(x1.B0015 as int64) = 1 OR cast(x1.B0016 as int64) = 1 OR
cast(x1.B0017 as int64) = 1 OR cast(x1.B0018 as int64) = 1 OR
cast(x1.B0019 as int64) = 1 OR cast(x1.B00110 as int64) = 1 OR
cast(x1.B00111 as int64) = 1 OR cast(x1.B00112 as int64) = 1 OR
cast(x1.B00113 as int64) = 1 
)
GROUP BY 
    x1.ANO,
    x1.MES
ORDER BY 1,2



