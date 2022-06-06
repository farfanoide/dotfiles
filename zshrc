# old installations were on /usr/local while new ones go to /opt/homebrew
OPT_DIR="/opt/homebrew"
if [ -d "${OPT_DIR}" ]; then
	eval "$(${OPT_DIR}/bin/brew shellenv)"
  export ZPLUG_HOME="${OPT_DIR}/opt/zplug"
else 
  eval "$(/usr/local/bin/brew shellenv)"
  export ZPLUG_HOME="/usr/local/opt/zplug"
fi
# Plugins and such
PLUGINS_DIR="$HOME/.plugins/"

source $ZPLUG_HOME/init.zsh

# own completions
fpath=("$HOME/.fpath" ${fpath[*]})
fpath=("/usr/local/share/zsh/site-functions" ${fpath[*]})
# compsys initialization
autoload -U compinit
compinit -i
source "${PLUGINS_DIR}farfanoide/zshrc.zsh"
source "${PLUGINS_DIR}farfanoide/init.sh"

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "modules/completion", from:prezto
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "davidparsson/zsh-pyenv-lazy"
zplug "bobthecow/git-flow-completion", use:git-flow-completion.zsh
# zplug "clbarnes/zsh-rbenv-lazy"

# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
zplug load
