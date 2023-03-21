#!/bin/bash

echo "Criando diretórios..."

mkdir /publico /adm /ven /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

usuarios_adm=("carlos","maria","joao")
usuarios_ven=("debora","sebastiana","roberto")
usuarios_sec=("josefina","amanda","rogerio")

for usuario in "${usuarios_adm[@]}"
do
  useradd $usuario -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_ADM
done

for usuario in "${usuarios_ven[@]}"
do
	useradd $usuario -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_VEN
done

for usuario in "${usuarios_sec[@]}"
do
	useradd $usuario -m -s /bin/bash -p $(openssl passwd -crypt Senha123) -G GRP_SEC
done

echo "Especificando permissões dos diretórios...."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim....."
