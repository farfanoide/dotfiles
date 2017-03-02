# forradas mac (aporta para powerline)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Directories
export MUSIC_DIR="$HOME/Music/iTunes/iTunes\ Media/Music/"
export DOWN_DIR="$HOME/Downloads"
export SRC_DIR="$HOME/Develop/src"
export APPS_DIR="$HOME/Develop/apps"
export YATSH_DIR="$HOME/.tmux/yat.sh"

export VISUAL='nvim'
export EDITOR='nvim'

# make vim and tmux play nicely regarding colors
# [ $TERM = xterm ] && export TERM=xterm-256color

export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Python stuff --------------{{{
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PIP_REQUIRE_VIRTUALENV=true # Only run pip from within a virtualenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export CFLAGS='-O2'
eval "$(pyenv init -)"
# end Python stuff -----------}}}

# ls options
if _mac_osx; then
  export CLICOLOR=1
fi


export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .hg -g ""'
export BONITA_INSTALL_DIR=~/Develop/apps/bonita/current
