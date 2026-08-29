alias reload="exec $SHELL -l"
alias l='"ls" -AlFh --color --group-directories-first'

(( $+commands[batcat] )) && alias bat='batcat'
(( $+commands[batcat] )) && alias cat='batcat'

if (( $+commands[bat] )); then
    alias cat='bat -pp'
    alias less='bat --style=full'
    export PAGER='bat -f'
    export NULLCMD='bat'
    export READNULLCMD='cat'

    alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
    alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

    (( $+commands[batgrep] )) && alias rg='batgrep --color=auto --paging=never'
    (( $+commands[batwatch] )) && alias watch='batwatch --color=auto'
    (( $+commands[batdiff] )) && alias diff='batdiff --color=auto --paging=never'
    if (( $+commands[batman] )); then
        export MANPAGER=env\ BATMAN_IS_BEING_MANPAGER=yes\ batman
        export MANROFFOPT=-c
    fi
fi

(( $+commands[eza] )) && alias l='eza -alF --icons=auto --tree --level=1 --group-directories-first'
(( $+commands[systemctl] )) && alias systemctl='sudo systemctl'
(( $+commands[apt] )) && alias apt='sudo apt'
(( $+commands[apt-get] )) && alias apt-get='sudo apt-get'
(( $+commands[fdfind] )) && alias fd='fdfind'
(( $+commands[duf] )) && alias df='duf'
