#!/bin/bash

echo "Criando usuários do sistema...."

for ((i=10; i<=12; i++))
do 
 useradd guest$i -c "Usuário convidado" -s /bin/bash -m -p $(openssl passwd -crypt Senha123)
 passwd guest$i -e
done

echo "Finalizado!!"
