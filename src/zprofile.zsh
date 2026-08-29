if [[ -z "$DOTFILES" ]]; then
  export DOTFILES=~/.dotfiles
fi

if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

if [[ -z "$EDITOR" ]]; then
  export EDITOR='nano'
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL='nano'
fi
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi

if [[ -z "$LANGUAGE" ]]; then
  export LANGUAGE='en_US'
fi
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
if [[ -z "$LC_ALL" ]]; then
 export LC_ALL='en_US.UTF-8'
fi
if [[ -z "$LC_CTYPE" ]]; then
  export LC_CTYPE='C.UTF-8'
fi
if [[ $TERM_PROGRAM == "iTerm.app" ]]; then
  export LC_TERMINAL='iTerm2'
fi

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi
TMPPREFIX="${TMPDIR%/}/zsh"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

fpath=(
  $DOTFILES/functions(N)
  $fpath
)

path=(
  $HOME/{,.}bin(N)
  $HOME/{local,.local}/bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  /usr/{,s}bin(N)
  /{,s}bin(N)
  $path
)

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -z-4'
fi

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -x "$HOME/.lessfilter" ]]; then
  export LESSOPEN='|~/.lessfilter %s'
elif [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

(( $+commands[mise] )) && eval "$(mise activate zsh --shims)"

typeset -Ug path
