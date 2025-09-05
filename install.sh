#!/bin/bash
# -----------------------------------------------------------------------------
# MEU SCRIPT DE INSTALAÇÃO PESSOAL PARA O GITHUB CODESPACES
# -----------------------------------------------------------------------------

echo "🚀 Iniciando a configuração do meu ambiente de dev supremo!"

# --- ATUALIZAÇÃO BÁSICA E FERRAMENTAS GERAIS ---
sudo apt-get update
sudo apt-get install -y \
    htop \
    figlet \
    lolcat \
    zsh

# --- C/C++: FERRAMENTAS DE QUALIDADE E DEBUG ---
echo "🛠️  Instalando ferramentas para C/C++..."
sudo apt-get install -y \
    gdb \
    valgrind \
    clang

# --- JAVA: INSTALANDO O GERENCIADOR DE VERSÕES SDKMAN! ---
echo "☕ Instalando SDKMAN! para gerenciar Java, Maven e Gradle..."
# O comando abaixo instala e já configura o shell para usar o SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
# Exemplo de como instalar uma versão específica (opcional, pode fazer manualmente depois)
# sdk install java 17.0.10-tem

# --- PYTHON: INSTALANDO O GERENCIADOR DE VERSÕES PYENV ---
echo "🐍 Instalando pyenv para gerenciar múltiplas versões do Python..."
# Instala dependências necessárias para compilar versões do Python
sudo apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev
# Instala o pyenv e configura o shell para usá-lo
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# --- HASKELL: A GRANDE AVENTURA COM GHCUP ---
echo "λ Instalando o ecossistema Haskell com GHCup..."
# Define que a instalação não será interativa
export GHCUP_INSTALL_BASE_PREFIX=/home/vscode/.ghcup
# Roda o script de instalação do GHCup
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# --- MENSAGEM FINAL ---
echo ""
figlet "Pronto!" | lolcat
echo "Seu ambiente está configurado e pronto para a batalha. Bom código!"
echo "Lembre-se de recarregar o terminal ou abrir um novo para que pyenv e sdkman funcionem!"
