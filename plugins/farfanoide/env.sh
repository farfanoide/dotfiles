
# forradas mac (aporta para powerline)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Directories
export MUSIC_DIR="$HOME/Music/iTunes/iTunes Media/Music/"
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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
# pyenv virtualenv
eval "$(pyenv virtualenv-init -)"
# export PATH="$PYENV_ROOT/bin:$PATH"
gpip()
{
  PIP_REQUIRE_VIRTUALENV=false pip $*;
}

pyenv_install_env ()
{
  # about zlib
  export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"
  export CPPFLAGS="-I$(brew --prefix zlib)/include"
  # about readline
  export CFLAGS="-I$(brew --prefix readline)/include $CFLAGS"
  export LDFLAGS="-L$(brew --prefix readline)/lib $LDFLAGS"
  # about openssl
  export CFLAGS="-I$(brew --prefix openssl)/include $CFLAGS"
  export LDFLAGS="-L$(brew --prefix openssl)/lib $LDFLAGS"
  # about SQLite (maybe not necessary)
  export CFLAGS="-I$(brew --prefix sqlite)/include $CFLAGS"
  export LDFLAGS="-L$(brew --prefix sqlite)/lib $LDFLAGS"
}

# # For compilers to find zlib you may need to set:
# export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
# export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
# export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# end Python stuff -----------}}}

# ls options
# if _mac_osx; then
#   export CLICOLOR=1
# fi

export GREP_OPTIONS='--color=auto --exclude=*.pyc --exclude-dir=.git'


export HOMEBREW_NO_AUTO_UPDATE=1
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore .hg -g ""'
export BONITA_INSTALL_DIR=~/Develop/apps/bonita/current
