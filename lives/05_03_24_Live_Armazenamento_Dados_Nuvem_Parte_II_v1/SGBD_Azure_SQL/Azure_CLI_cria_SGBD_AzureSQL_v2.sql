
#--
#-- Cria o grupo de recurso gr-kidelicia
#--
az group create --name gr-kidelicia<id_aluno> --location brazilsouth

#--
#-- Cria o SGBD Azure SQL chamado sqlserver-kidelicia
#--
az sql server create -l brazilsouth -g gr-kidelicia<id_aluno> -n sqlserver-kidelicia<id_aluno> -u admsql -p kd@FIAP24 --enable-public-network true

#--
#-- Cria o banco de dados chamado kideliciadb
#--
az sql db create -g gr-kidelicia<id_aluno> -s sqlserver-kidelicia<id_aluno> -n kideliciadb<id_aluno> --service-objective Basic --backup-storage-redundancy Local --zone-redundant false

#--
#-- Libera o acesso para qualquer endereço IP da rede (*somente para testes iniciais)
#--
az sql server firewall-rule create -g gr-kidelicia<id_aluno> -s sqlserver-kidelicia<id_aluno> -n AllowAll --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

--
-- Usuário BD: admsql  
-- Senha BD: kd@FIAP24
--







