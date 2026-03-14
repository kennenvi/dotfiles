#!/usr/bin/env bash

set -e

if command -v code &> /dev/null; then
    cat vscode/extensions.txt | xargs -L 1 code --install-extension
fi

echo "Extensões do VSCode instaladas"

