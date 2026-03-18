#!/usr/bin/env bash

set -e

DOTFILES="$HOME/dotfiles"

link() {
    local source=$1
    local target=$2

    echo "Linking $target"

    mkdir -p "$(dirname "$target")"
    ln -sfn "$DOTFILES/$source" "$target"
}

link bash/.bashrc ~/.bashrc
link i3/config ~/.config/i3/config
link vscode/settings.json ~/.config/Code/User/settings.json
link vscode/keybindings.json ~/.config/Code/User/keybindings.json
# link nvim/ ~/.config/nvim/

echo "Dotfiles instalados!"
