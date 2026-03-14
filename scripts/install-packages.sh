#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"
PACKAGES_DIR="$DOTFILES/packages"

install_from_file() {
    local file=$1
    local cmd=$2

    while read -r pkg; do
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
        echo "Instalando $pkg"
        $cmd "$pkg"
    done < "$file"
}

if command -v dnf &> /dev/null; then
    echo "Sistema Fedora detectado"

    install_from_file "$PACKAGES_DIR/fedora.txt" "sudo dnf install -y"

elif command -v apt &> /dev/null; then
    echo "Sistema Ubuntu detectado"

    sudo apt update

    install_from_file "$PACKAGES_DIR/ubuntu.txt" "sudo apt install -y"

else
    echo "Gerenciador de pacotes não suportado"
    exit 1
fi
