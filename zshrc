# forradas mac (aporta para powerline)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="cloud"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(farfan gem rails3 rbenv vagrant heroku npm osx pip postgres svn symfony brew tmux tmuxinator git git-flow bundler)

# fix this shite!
# virtualenv virtualenvwrapper


source $ZSH/oh-my-zsh.sh

# Disable auto-correct
unsetopt correct_all

export EDITOR=vim
# load personal completions
# fpath=($HOME/.zsh/completion ${fpath})
autoload -U compinit
compinit

# Homebrew paths
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

# npm packages
PATH="/usr/local/share/npm/bin:${PATH}"

# python modules
PATH="/usr/local/share/python:${PATH}"

# python -> virtualenv(wrapper)
export WORKON_HOME="$HOME/.virtualenvs"
source /usr/local/share/python/virtualenvwrapper.sh
export PROJECT_HOME=$HOME/Dropbox/Sites

# Pear Packages
PATH="$(brew --prefix php54)/bin:$PATH"

# rbenv initialization
eval "$(rbenv init -)"
