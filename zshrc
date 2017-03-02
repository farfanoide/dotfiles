# Plugins and such
PLUGINS_DIR="$HOME/.plugins/"

# own completions
fpath=("$HOME/.fpath" ${fpath[*]})
# compsys initialization
autoload -U compinit
compinit
source "${PLUGINS_DIR}farfanoide/zshrc.zsh"
source "${PLUGINS_DIR}farfanoide/init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
