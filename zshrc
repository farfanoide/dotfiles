#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Plugins and such
PLUGINS_DIR="$HOME/.plugins/"
source "$PLUGINS_DIR/farfanoide/init.sh"

# own completions
fpath=("$HOME/.fpath" ${fpath[*]})
# compsys initialization
autoload -U compinit
compinit

# zaw -> C-r replacement for zsh
source "$PLUGINS_DIR/zaw/zaw.zsh"
zaw_file="$PLUGINS_DIR/zaw.zsh"
[ -e $zaw_file ] && source $zaw_file

unset zaw_file
