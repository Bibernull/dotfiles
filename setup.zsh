#!/usr/bin/env zsh

if ! command -v mise >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/mise" ]; then
    echo "Installing mise..."
    curl -sSL https://mise.run | sh >/dev/null 2>&1
fi
export PATH="$HOME/.local/bin:$PATH"

eval "$(${HOME}/.local/bin/mise activate zsh)"

mise use -g usage

mise bootstrap
