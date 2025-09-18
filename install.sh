#!/bin/bash
# -----------------------------------------------------------------------------
# MEU SCRIPT DE INSTALAÇÃO PESSOAL PARA O GITHUB CODESPACES (V2.0)
# -----------------------------------------------------------------------------

echo "🚀 Iniciando a configuração do meu ambiente de dev"

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
# MUDANÇA AQUI: Garante que o SDKMAN inicie em qualquer novo terminal
echo "" >> ~/.bashrc
echo "# SDKMAN" >> ~/.bashrc
echo 'export SDKMAN_DIR="$HOME/.sdkman"' >> ~/.bashrc
echo '[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"' >> ~/.bashrc
# Faz o mesmo para o Zsh
echo "" >> ~/.zshrc
echo "# SDKMAN" >> ~/.zshrc
echo 'export SDKMAN_DIR="$HOME/.sdkman"' >> ~/.zshrc
echo '[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"' >> ~/.zshrc


# --- PYTHON: INSTALANDO O GERENCIADOR DE VERSÕES PYENV ---
echo "🐍 Instalando pyenv para gerenciar múltiplas versões do Python..."
# Instala dependências necessárias para compilar versões do Python
sudo apt-get install -y --no-install-recommends \
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
# Instala o pyenv
curl https://pyenv.run | bash
# MUDANÇA AQUI: Garante que o pyenv inicie no Bash e no Zsh
echo "" >> ~/.bashrc
echo "# PYENV" >> ~/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
# Faz o mesmo para o Zsh
echo "" >> ~/.zshrc
echo "# PYENV" >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# --- HASKELL: A GRANDE AVENTURA COM GHCUP ---
echo "λ Instalando o ecossistema Haskell com GHCup..."
# Define que a instalação não será interativa
export GHCUP_INSTALL_BASE_PREFIX=/home/vscode/.ghcup
# Roda o script de instalação do GHCup
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
# Pega o caminho do executável do ghcup
GHCUP_BIN=$(/home/vscode/.ghcup/bin/ghcup --ghcup-bin)
# Adiciona as linhas de configuração ao .bashrc e .zshrc
echo "" >> ~/.bashrc
echo "# HASKELL GHCUP" >> ~/.bashrc
echo "export PATH=\"/home/vscode/.ghcup/bin:/home/vscode/.cabal/bin:\$PATH\"" >> ~/.bashrc
echo "" >> ~/.zshrc
echo "# HASKELL GHCUP" >> ~/.zshrc
echo "export PATH=\"/home/vscode/.ghcup/bin:/home/vscode/.cabal/bin:\$PATH\"" >> ~/.zshrc


# --- MENSAGEM FINAL ---
echo ""
figlet "Pronto!" | lolcat
echo "Seu ambiente está configurado e pronto para a batalha. Bom código!"
echo "Abra um NOVO terminal para que todas as mudanças tenham efeito!"
