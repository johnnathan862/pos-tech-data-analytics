from google.cloud import bigquery
from google.cloud.exceptions import NotFound
from pandas import read_csv

class CreateBigqueryTables:
    def __init__(self, bigquery_client):
        self.client = bigquery_client

    # Função para criar um bigquery schema apartir de um pandas dataframe
    def pandas_to_bq_schema(self, df):
        bq_schema = []
        for column_name, dtype in df.dtypes.items():
            if dtype == 'object':
                field_type = 'STRING'
            elif dtype == 'int64':
                field_type = 'INTEGER'
            elif dtype == 'float64':
                field_type = 'FLOAT'
            elif dtype == 'bool':
                field_type = 'BOOLEAN'
            else:
                # Mapeando tipos de dados não suportados
                raise ValueError(f"Unsupported dtype: {dtype}")
            
            bq_schema.append(bigquery.SchemaField(name=column_name, field_type=field_type))

        return bq_schema
    
    # Função para criar o bigquery schema para um arquivo na Cloud Storage 
    def bd_create_schema_to_table(self, gcs_uri):
        credentials = self.client._credentials
        # Carregando o csv em um dataframe pandas
        df_pandas = read_csv(gcs_uri, storage_options={'token':credentials})
        # Criando o bigquery schema
        schema = self.pandas_to_bq_schema(df=df_pandas)

        return schema


    # Função para cria um dataset no Bigquery
    def bq_create_dataset(self, dataset):
        dataset_ref = self.client.dataset(dataset)

        try:
            dataset = self.client.get_dataset(dataset_ref)
            print(f'Dataset {dataset} already exists.')
        except NotFound:
            dataset = bigquery.Dataset(dataset_ref)
            dataset.location = 'US'
            dataset = self.client.create_dataset(dataset)
            print(f'Dataset {dataset.dataset_id} created.')
        return dataset
    
    # Função que cria uma tabela no BigQuery
    def bq_create_table(self, dataset, table_name, schema):
        dataset_ref = self.client.dataset(dataset)

        # Prepares a reference to the table
        table_ref = dataset_ref.table(table_name)

        try:
            table =  self.client.get_table(table_ref)
            print(f'table {table} already exists.')
        except NotFound:
            table = bigquery.Table(table_ref, schema=schema)
            table = self.client.create_table(table)
            print(f'table {table.table_id} created.')
        return table
    
    # Função que cria uma tabela no BigQuery a partir de um arquivo no Storage
    def bq_create_table_from_storage_file(self, gcs_uri, dataset, table_name):
        # Criando schema
        schema = self.bd_create_schema_to_table(gcs_uri)
        # Criando a tabela 
        table = self.bq_create_table(dataset, table_name, schema)

        return table

    # Função que alimenta uma tabela existem no Bigquery
    def load_csv_bq_table(self, gcs_uri, table_id):
        '''Load the CSV file in BigQuery'''
        job_config = bigquery.LoadJobConfig()
        job_config.schema = self.bd_create_schema_to_table(gcs_uri)
        job_config.source_format = bigquery.SourceFormat.CSV
        job_config.skip_leading_rows = 1
        job_config.field_delimiter = ','
        job_config.write_disposition = bigquery.WriteDisposition.WRITE_APPEND
        job_config.null_marker = ''

        load_job = self.client.load_table_from_uri(
            gcs_uri, table_id, job_config=job_config
        )

        load_job.result() # waits for the load job to finish

    # Função que cria tabela no bigquery e alimenta com arquivo CSV salvo Storage
    def create_and_load_table_bigquery(self, gcs_uri, dataset, table_name):
        # Cria o dataset
        data = self.bq_create_dataset(dataset=dataset)
        # Cria a tabela no bigquery
        table = self.bq_create_table_from_storage_file(
            gcs_uri=gcs_uri, 
            dataset=dataset, 
            table_name=table_name
        )
        # Alimenta a tabela cria 
        self.load_csv_bq_table(gcs_uri=gcs_uri, table_id=table)