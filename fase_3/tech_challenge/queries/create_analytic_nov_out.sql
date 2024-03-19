CREATE OR REPLACE VIEW `pos-tech-project.pnad.view_analytic_nov_out` AS (
  SELECT 
    Ano,
    11 as mes,
    UF,
    CAPITAL,
    A002,
    A003,
    -- A006B,
    B0011,
    B0012,
    B0013,
    B0014,
    B0015,
    B0016,
    B0017,
    B0018,
    B0019,
    B00110,
    B00111,
    B00112,
    B00113,
    B002,
    B0031,
    B0032,
    B0033,
    B0034,
    B0035,
    B0036,
    B0037,
    B0041,
    B0042,
    B0043,
    B0044,
    B0045,
    B0046,
    B005,
    B006,
    B009B,
    B009D,
    B009F,
    B011,
    C007,
    C007C,
    C007D,
    C010,
    C013,
    E001,
    F001
  FROM `pos-tech-project.pnad.pnad_covid_112020`
  UNION ALL (
    SELECT 
      Ano,
      10 as mes,
      UF,
      CAPITAL,
      A002,
      A003,
      -- A006B,
      B0011,
      B0012,
      B0013,
      B0014,
      B0015,
      B0016,
      B0017,
      B0018,
      B0019,
      B00110,
      B00111,
      B00112,
      B00113,
      B002,
      B0031,
      B0032,
      B0033,
      B0034,
      B0035,
      B0036,
      B0037,
      B0041,
      B0042,
      B0043,
      B0044,
      B0045,
      B0046,
      B005,
      B006,
      B009B,
      B009D,
      B009F,
      B011,
      C007,
      C007C,
      C007D,
      C010,
      C013,
      E001,
      F001
    FROM `pos-tech-project.pnad.pnad_covid_102020`
  )
);

CREATE OR REPLACE TABLE `pos-tech-project.pnad.analytic_nov_out` AS (
  SELECT 
    an.*,
    CASE UF
      WHEN 11 THEN 'Rondônia'
      WHEN 12 THEN 'Acre'
      WHEN 13 THEN 'Amazonas'
      WHEN 14 THEN 'Roraima'
      WHEN 15 THEN 'Pará'
      WHEN 16 THEN 'Amapá'
      WHEN 17 THEN 'Tocantins'
      WHEN 21 THEN 'Maranhão'
      WHEN 22 THEN 'Piauí'
      WHEN 23 THEN 'Ceará'
      WHEN 24 THEN 'Rio Grande do Norte'
      WHEN 25 THEN 'Paraíba'
      WHEN 26 THEN 'Pernambuco'
      WHEN 27 THEN 'Alagoas'
      WHEN 28 THEN 'Sergipe'
      WHEN 29 THEN 'Bahia'
      WHEN 31 THEN 'Minas Gerais'
      WHEN 32 THEN 'Espírito Santo'
      WHEN 33 THEN 'Rio de Janeiro'
      WHEN 35 THEN 'São Paulo'
      WHEN 41 THEN 'Paraná'
      WHEN 42 THEN 'Santa Catarina'
      WHEN 43 THEN 'Rio Grande do Sul'
      WHEN 50 THEN 'Mato Grosso do Sul'
      WHEN 51 THEN 'Mato Grosso'
      WHEN 52 THEN 'Goiás'
      WHEN 53 THEN 'Distrito Federal'
      ELSE 'Unknown'
    END AS UF_desc,
    d2.valor AS CAPITAL_desc,
    d3.valor AS A003_desc,
    d4.valor AS B0011_desc,
    d5.valor AS B0012_desc,
    d6.valor AS B0013_desc,
    d7.valor AS B0014_desc,
    d8.valor AS B0015_desc,
    d9.valor AS B0016_desc,
    d10.valor AS B0017_desc,
    d11.valor AS B0018_desc,
    d12.valor AS B0019_desc,
    d13.valor AS B00110_desc,
    d14.valor AS B00111_desc,
    d15.valor AS B00112_desc,
    d16.valor AS B00113_desc,
    d17.valor AS B002_desc,
    d18.valor AS B0031_desc,
    d19.valor AS B0032_desc,
    d20.valor AS B0033_desc,
    d21.valor AS B0034_desc,
    d22.valor AS B0035_desc,
    d23.valor AS B0036_desc,
    d24.valor AS B0037_desc,
    d25.valor AS B0041_desc,
    d26.valor AS B0042_desc,
    d27.valor AS B0043_desc,
    d28.valor AS B0044_desc,
    d29.valor AS B0045_desc,
    d30.valor AS B0046_desc,
    d31.valor AS B005_desc,
    d32.valor AS B006_desc,
    d33.valor AS B009B_desc,
    d34.valor AS B009D_desc,
    d35.valor AS B009F_desc,
    d36.valor AS B011_desc,
    d37.valor AS C007_desc,
    d38.valor AS C007C_desc,
    d39.valor AS C007D_desc,
    d40.valor AS C010_desc,
    d41.valor AS C013_desc,
    d42.valor AS E001_desc,
    d43.valor AS F001_desc
  FROM `pos-tech-project.pnad.view_analytic_nov_out` AS an
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d2 ON an.CAPITAL = CAST(d2.chave AS INT64) AND d2.nome_coluna = 'capital'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d3 ON an.A003 = CAST(d3.chave AS INT64) AND d3.nome_coluna = 'a003'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d4 ON an.B0011 = CAST(d4.chave AS INT64) AND d4.nome_coluna = 'b0011'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d5 ON an.B0012 = CAST(d5.chave AS INT64) AND d5.nome_coluna = 'b0012'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d6 ON an.B0013 = CAST(d6.chave AS INT64) AND d6.nome_coluna = 'b0013'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d7 ON an.B0014 = CAST(d7.chave AS INT64) AND d7.nome_coluna = 'b0014'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d8 ON an.B0015 = CAST(d8.chave AS INT64) AND d8.nome_coluna = 'b0015'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d9 ON an.B0016 = CAST(d9.chave AS INT64) AND d9.nome_coluna = 'b0016'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d10 ON an.B0017 = CAST(d10.chave AS INT64) AND d10.nome_coluna = 'b0017'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d11 ON an.B0018 = CAST(d11.chave AS INT64) AND d11.nome_coluna = 'b0018'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d12 ON an.B0019 = CAST(d12.chave AS INT64) AND d12.nome_coluna = 'b0019'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d13 ON an.B00110 = CAST(d13.chave AS INT64) AND d13.nome_coluna = 'b00110'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d14 ON an.B00111 = CAST(d14.chave AS INT64) AND d14.nome_coluna = 'b00111'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d15 ON an.B00112 = CAST(d15.chave AS INT64) AND d15.nome_coluna = 'b00112'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d16 ON an.B00113 = CAST(d16.chave AS INT64) AND d16.nome_coluna = 'b00113'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d17 ON an.B002 = CAST(d17.chave AS INT64) AND d17.nome_coluna = 'b002'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d18 ON an.B0031 = CAST(d18.chave AS INT64) AND d18.nome_coluna = 'b0031'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d19 ON an.B0032 = CAST(d19.chave AS INT64) AND d19.nome_coluna = 'b0032'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d20 ON an.B0033 = CAST(d20.chave AS INT64) AND d20.nome_coluna = 'b0033'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d21 ON an.B0034 = CAST(d21.chave AS INT64) AND d21.nome_coluna = 'b0034'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d22 ON an.B0035 = CAST(d22.chave AS INT64) AND d22.nome_coluna = 'b0035'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d23 ON an.B0036 = CAST(d23.chave AS INT64) AND d23.nome_coluna = 'b0036'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d24 ON an.B0037 = CAST(d24.chave AS INT64) AND d24.nome_coluna = 'b0037'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d25 ON an.B0041 = CAST(d25.chave AS INT64) AND d25.nome_coluna = 'b0041'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d26 ON an.B0042 = CAST(d26.chave AS INT64) AND d26.nome_coluna = 'b0042'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d27 ON an.B0043 = CAST(d27.chave AS INT64) AND d27.nome_coluna = 'b0043'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d28 ON an.B0044 = CAST(d28.chave AS INT64) AND d28.nome_coluna = 'b0044'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d29 ON an.B0045 = CAST(d29.chave AS INT64) AND d29.nome_coluna = 'b0045'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d30 ON an.B0046 = CAST(d30.chave AS INT64) AND d30.nome_coluna = 'b0046'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d31 ON an.B005 = CAST(d31.chave AS INT64) AND d31.nome_coluna = 'b005'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d32 ON an.B006 = CAST(d32.chave AS INT64) AND d32.nome_coluna = 'b006'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d33 ON an.B009B = CAST(d33.chave AS INT64) AND d33.nome_coluna = 'b009b'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d34 ON an.B009D = CAST(d34.chave AS INT64) AND d34.nome_coluna = 'b009d'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d35 ON an.B009F = CAST(d35.chave AS INT64) AND d35.nome_coluna = 'b009f'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d36 ON an.B011 = CAST(d36.chave AS INT64) AND d36.nome_coluna = 'b011'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d37 ON an.C007 = CAST(d37.chave AS INT64) AND d37.nome_coluna = 'c007'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d38 ON an.C007C = CAST(d38.chave AS INT64) AND d38.nome_coluna = 'c007c'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d39 ON an.C007D = CAST(d39.chave AS INT64) AND d39.nome_coluna = 'c007d'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d40 ON an.C010 = CAST(d40.chave AS INT64) AND d40.nome_coluna = 'c010'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d41 ON an.C013 = CAST(d41.chave AS INT64) AND d41.nome_coluna = 'c013'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d42 ON an.E001 = CAST(d42.chave AS INT64) AND d42.nome_coluna = 'e001'
  LEFT JOIN `basedosdados.br_ibge_pnad_covid.dicionario` AS d43 ON an.F001 = CAST(d43.chave AS INT64) AND d43.nome_coluna = 'f001'
)
