# fix <C-h> for vim on mac os
#infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti && tic $TERM.ti

# old installations were on /usr/local while new ones go to /opt/homebrew
# OPT_DIR="/opt/homebrew"
# if [ -d "${OPT_DIR}" ]; then
# 	eval "$(${OPT_DIR}/bin/brew shellenv)"
#   export ZPLUG_HOME="${OPT_DIR}/opt/zplug"
# else 
#   eval "$(/usr/local/bin/brew shellenv)"
#   export ZPLUG_HOME="/usr/local/opt/zplug"
# fi
# # Plugins and such
# PLUGINS_DIR="$HOME/.plugins/"
#
# source $ZPLUG_HOME/init.zsh

# own completions
# fpath=("$HOME/.fpath" ${fpath[*]})
# fpath=("/usr/local/share/zsh/site-functions" ${fpath[*]})
# # compsys initialization
# autoload -U compinit
# compinit -i
# source "${PLUGINS_DIR}farfanoide/zshrc.zsh"
# source "${PLUGINS_DIR}farfanoide/init.sh"

# zplug "mafredri/zsh-async", from:github
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
# zplug "modules/completion", from:prezto
# zplug "zsh-users/zsh-history-substring-search"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions"
# zplug "davidparsson/zsh-pyenv-lazy"
# zplug "bobthecow/git-flow-completion", use:git-flow-completion.zsh
# zplug "clbarnes/zsh-rbenv-lazy"

# # Install plugins if there are plugins that have not been installed
# if ! zplug check --verbose; then
#     printf "Install? [y/N]: "
#     if read -q; then
#         echo; zplug install
#     fi
# fi

# Then, source plugins and add commands to $PATH
# zplug load
#
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# # export VOLTA_HOME="$HOME/.volta"
# # export PATH="$VOLTA_HOME/bin:$PATH"
# # NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#
# # export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
# # MySQL
# export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig"
# export LD_LIBRARY_PATH="/opt/homebrew/opt/mysql-client/lib/libmysqlclient.dylib"
#

source ~/Develop/dotfiles/master/plugins/farfanoide/zshrc.zsh

export LANG=en_US.UTF-8
eval "$(starship init zsh)"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$($(brew --prefix)/bin/rtx activate zsh)"
PATH="${HOME}/.bin:${PATH}"

if type brew &>/dev/null; then
	FPATH="${HOME}:$(brew --prefix)/share/zsh/site-functions:${FPATH}"
	FPATH="$(brew --prefix)/share/zsh-completions:${FPATH}"
	FPATH="${HOME}/.fpath:${FPATH}"

	autoload -Uz compinit
	compinit
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
fi

_mac_osx() { [ $(uname) = 'Darwin' ] ;}
_linux()   { [ $(uname) = 'Linux' ] ;}

source ~/Develop/dotfiles/master/plugins/farfanoide/env.sh
source ~/Develop/dotfiles/master/plugins/farfanoide/alias.sh
source ~/Develop/dotfiles/master/plugins/farfanoide/functions.sh
source ~/Develop/dotfiles/master/plugins/farfanoide/bindings.sh

