SPACESHIP_PROMPT_ORDER=(
  # time          # Time stampts section
  # jobs          # Background jobs indicator
  # line_sep      # Line break
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  # git           # Git section (git_branch + git_status)
  git_branch           # Git branch subsection
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  #battery       # Battery level and status
  #vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  # time          # Time stampts section
  # line_sep      # Line break
  # time          # Time stampts section
  # user          # Username section
  # dir           # Current directory section
  # host          # Hostname section
  # git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  # package       # Package version
  # line_sep      # Line break
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # xcode         # Xcode section
  # swift         # Swift section
  # golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  # docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  # kubecontext   # Kubectl context section
  # exec_time     # Execution time
  # line_sep      # Line break
  # battery       # Battery level and status
  # vi_mode       # Vi-mode indicator
  # jobs          # Background jobs indicator
  # exit_code     # Exit code section
  # char          # Prompt character
)

SPACESHIP_PROMPT_DEFAULT_PREFIX=" "
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false
SPACESHIP_PROMPT_PREFIXES_SHOW=true
SPACESHIP_PROMPT_SUFFIXES_SHOW=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_GIT_BRANCH_ASYNC=true

#SPACESHIP_CHAR_SYMBOL="$"
if [[ $TERM_PROGRAM == "iTerm.app" ]] && (( $+functions[iterm2_prompt_mark] )); then
  SPACESHIP_CHAR_PREFIX="%{$(iterm2_prompt_mark)%}"
fi
SPACESHIP_CHAR_SUFFIX=""

SPACESHIP_EXIT_CODE_SHOW=false

SPACESHIP_TIME_PREFIX="@"
SPACESHIP_TIME_SHOW=true

SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_SUFFIX=""

SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_SHOW_FULL=true
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_COLOR="red"

SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_COLOR="green"
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_TRUNC_REPO=false

SPACESHIP_GIT_PREFIX=""
SPACESHIP_GIT_SUFFIX=" "
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_GIT_BRANCH_SUFFIX=" "
SPACESHIP_GIT_STATUS_SHOW=false

SPACESHIP_PACKAGE_PREFIX=""
SPACESHIP_PACKAGE_SYMBOL="npm "

SPACESHIP_NODE_SHOW=false
SPACESHIP_NODE_PREFIX=""
# SPACESHIP_NODE_DEFAULT_VERSION=$(/usr/local/bin/node --version)
SPACESHIP_NODE_DEFAULT_VERSION=" "
