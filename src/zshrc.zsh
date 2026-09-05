if [[ -z "$DOTFILES" ]]; then
  export DOTFILES=~/.dotfiles
fi

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

if [[ -d "$HOME/.local/share/terminfo" && -n "$HOME/.local/share/terminfo"/*(NY1) ]]; then
  TERMINFO_DIRS=$HOME/.local/share/terminfo:$TERMINFO_DIRS
  typeset -aU terminfo_dirs=( ${(s_:_)TERMINFO_DIRS} )
  export TERMINFO_DIRS="${(j|:|)terminfo_dirs}"
  unset terminfo_dirs
fi

ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"
DISABLE_MAGIC_FUNCTIONS=true

# Source Prezto.
# See $HOME/.zpreztorc
if [[ -s "${HOME}/.zprezto/init.zsh" ]]; then
  source "${HOME}/.zprezto/init.zsh"
fi

if (( ! $+commands[fzf] && $+functions[disable-fzf-tab] )); then
  disable-fzf-tab
else
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

if [[ $LC_TERMINAL == "iTerm2" ]]; then
    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

if [[ $LC_TERMINAL == "iTerm2" ]]; then
  # key bindings
  [ -f ~/.zbindings ] && source ~/.zbindings
  bindkey -s '^ ' ' git status --short^M'
  bindkey '^Xh' _complete_help
  bindkey "\e[1~" beginning-of-line
  bindkey "\e[4~" end-of-line
  bindkey "^[[1;3D" backward-word
  bindkey "^[[1;3C" forward-word
fi

setopt NO_BG_NICE # don\'t nice background tasks
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt LONG_LIST_JOBS
setopt CLOBBER
setopt GLOB
setopt NOCOMPLETEALIASES

source $DOTFILES/aliases.zsh
source $DOTFILES/functions.zsh

if [[ -s "$DOTFILES/spaceship.zsh-theme" && $prompt_theme == "spaceship" ]]; then
  source $DOTFILES/spaceship.zsh-theme
fi

(( $+commands[mise] )) && cached-eval mise activate zsh

typeset -Ug path
