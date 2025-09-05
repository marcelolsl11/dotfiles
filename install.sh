#!/bin/bash

echo "==============================================="
echo "==   EXECUTANDO MEU ROBÔ INSTALADOR PESSOAL  =="
echo "==============================================="

# Primeiro, atualizamos a lista de pacotes do sistema
sudo apt-get update

# Agora, instalamos algumas ferramentas úteis e divertidas
# - htop: um visualizador de processos muito melhor que o 'top' padrão
# - figlet: para criar texto grande e estilizado no terminal
# - lolcat: para deixar as saídas do terminal coloridas como um arco-íris
sudo apt-get install -y htop figlet lolcat

echo ""
echo "==============================================="
echo "==      SETUP CONCLUÍDO! BOM TRABALHO!       =="
echo "==============================================="
echo ""
