import pandas as pd

# Coletando o dado
df = pd.read_html(
    "http://www.ipeadata.gov.br/ExibeSerie.aspx?module=m&serid=1650971490&oper=view", 
    decimal=','
)

# Limpando o dataframe
df_new = df[2]
df_new = df_new.drop(index=[0])
df_new = df_new.rename(columns={0:'date', 1:'price'})

# Tratando colunas
df_new['date'] = pd.to_datetime(df_new['date'], format="%d/%m/%Y")
df_new['price'] = df_new['price'].astype('int') / 100

# Salvando csv
df_new.to_csv('fase_4/tech_challenge/ipea.csv', sep=';', index=False)
