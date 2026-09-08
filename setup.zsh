#!/usr/bin/env zsh

if ! command -v mise >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/mise" ]; then
    echo "Installing mise..."
    curl -sSL https://mise.run | sh >/dev/null 2>&1
fi
export PATH="$HOME/.local/bin:$PATH"

eval "$(${HOME}/.local/bin/mise activate zsh)"

mise trust -y
mise use -y -g usage bat-extras

if (( EUID == 0 )) && command -v dpkg-query >/dev/null 2>&1 && ! dpkg-query -p eza >/dev/null 2>&1; then
    apt update
    apt install -y gpg

    mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | tee /etc/apt/sources.list.d/gierens.list
    chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    apt update
fi

mise bootstrap -y
