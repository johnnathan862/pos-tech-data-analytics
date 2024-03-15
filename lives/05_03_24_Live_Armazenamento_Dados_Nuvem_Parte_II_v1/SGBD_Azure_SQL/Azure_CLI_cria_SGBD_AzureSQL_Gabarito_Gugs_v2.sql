
#--
#-- Cria o grupo de recurso gr-kidelicia
#--
az group create --name gr-kidelicia --location brazilsouth

#--
#-- Cria o SGBD Azure SQL chamado sqlserver-kidelicia
#--
az sql server create -l brazilsouth -g gr-kidelicia -n sqlserver-kideliciapf0110 -u admsql -p kd@FIAP24 --enable-public-network true

#--
#-- Cria o banco de dados chamado kideliciadb
#--
az sql db create -g gr-kidelicia -s sqlserver-kideliciapf0110 -n kideliciadbpf0110 --service-objective Basic --backup-storage-redundancy Local --zone-redundant false

#--
#-- Libera o acesso para qualquer endereço IP da rede (*somente para testes iniciais)
#--
az sql server firewall-rule create -g gr-kidelicia -s sqlserver-kideliciapf0110 -n AllowAll --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

--
-- Usuário BD: admsql  
-- Senha BD: kd@FIAP24
--







