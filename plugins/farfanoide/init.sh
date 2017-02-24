# helpers
_mac_osx() { [ $(uname) = 'Darwin' ] ;}
_linux()   { [ $(uname) = 'Linux' ] ;}

# directory from which the plugins is being invoked
dir="${PLUGINS_DIR}/farfanoide"

source "${dir}/alias"
source "${dir}/functions" # load functions after alias so that they can be inherited
source "${dir}/env"       # load env vars after functions too use them
source "${dir}/path"
source "${dir}/bindings"

# [[ $(current_shell) =~ "zsh" ]] && source "$dir/zsh"

unset dir # clean up after ourselves

chpwd ()
{
  # If all files can be listed in the available rows, do so with item details,
  # otherwise do a normal `ls` splitting into columns
  [ $(ls -l | wc -l) -gt $(tput lines) ] && ls || ls -l
}

if rbenv --version > /dev/null; then
  eval "$(rbenv init - --no-rehash zsh)"
fi

# allow <c-h> mappings in nvim -> https://github.com/neovim/neovim/wiki/Troubleshooting#my-ctrl-h-mapping-doesnt-work
[ ! -e /tmp/$TERM.ti ] && infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > /tmp/$TERM.ti && tic /tmp/$TERM.ti
