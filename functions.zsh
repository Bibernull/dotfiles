autoload -U $DOTFILES/functions/*(:t)

ds-store-cleanup () {
  find "${@:-$PWD}" \( \
    -type f -name '.DS_Store' -o \
    -type d -name '__MACOSX' \
  \) -print0 | xargs -0 rm -rf
}

# Better find(1)
ff() {
  find . -iname "*${1:-}*"
}

# Define the function to toggle sudo
sudo-command-line() {
    [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}

# Create the widget and bind it to a key (e.g., Alt-s)
zle -N sudo-command-line
bindkey '\es' sudo-command-line


jqless() {
  args=$1
  shift
  jq --color-output . $args "$@" | less --raw-control-chars
}
