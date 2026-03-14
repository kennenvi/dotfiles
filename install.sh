#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

echo "Instalando pacotes..."
bash scripts/install-packages.sh

echo "Criando symlinks..."
bash scripts/links.sh

echo "Instalando extensões VSCode"
bash scripts/vscode.sh

echo "Ambiente configurado!"
