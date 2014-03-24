# forradas de mac pa no tener problemas en un ssh a linux
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL=
export PROMPT_DIRTRIM=2
export PGDATA="/Users/farfan/Develop/db/pg/"

# alias para colorcitos y giladas
alias ls="ls -hG"
alias ll="ls -o"
alias la="ll -A"
alias lg="la | grep -i"
alias lr="ls -R "
alias grep="grep --color=auto"
alias up="cd .."
alias h="history"
alias mplayer="mplayer -msgcolor"
alias df="df -h"
alias tree="tree -C"
# requires sudo pip install pygments
alias hi="pygmentize -g"
alias du="du -hs"
# Show me the size of all the things. The bastard child of du and df.
# http://gyaresu.org/hacking/2012/08/02/alias-to-show-the-size-of-files-and-folders/
alias duf='du -sk * | sort -nr | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'''
# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
# folders and archives
alias mv="mv -iv"
alias srm="sudo rm -Rfv"
alias mkdir="mkdir -p"
alias cp="rsync --append --progress -azvrE"

# recurrent directories
alias musik="cd ~/Music/iTunes/iTunes\ Media/Music/"
alias itunes="open -a itunes"
alias utorrent="open -a utorrent"
alias sitez="cd ~/Dropbox/Sites/"
alias fuck="cd ~/Dropbox/compartidas/Facultad/2do/"

# mac specific alias
alias o="open"
alias brup="brew update && brew upgrade"
alias browserstack="java -jar ~/Dropbox/syncPrefs/cmd/BrowserStackTunnel.jar T6rci6PsccWiU9kF2ygq localhost,80,0"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

# Apps and frameworks
alias getwp="wget http://wordpress.org/latest.tar.gz && extract latest.tar.gz && mv wordpress/* . && srm wordpress/ latest.tar.gz"
alias gethtml5="wget https://github.com/h5bp/html5-boilerplate/archive/master.zip && extract master.zip && mv html5-boilerplate-master/* . && rm -rfv master.zip html5-boilerplate-master/"
alias getnormalize="wget https://raw.github.com/necolas/normalize.css/master/normalize.css"
alias runtests="ipython -m unittest "
# Symfony
alias s="./symfony"
alias rmcl="rm -fr cache/* log/*"
alias arreglarengine="vim lib/vendor/symfony/lib/plugins/sfPropelPlugin/lib/vendor/propel-generator/classes/propel/engine/builder/sql/mysql/MysqlDDLBuilder.php"

# SSH
alias casa="ssh casa@casa.local"
alias maia="ssh multimedia@maia.local"
alias hippie="ssh root@199.115.117.193"
alias latinman="ssh latinman@latinmanagers.no-ip.org"
alias latinmanfarfan="ssh farfan@latinmanagers.no-ip.org"
alias farfan="ssh farfan@farfanauta.local"
alias seba="ssh seba@tanya.local"
alias ingenyo="ssh root@192.81.222.195"

# alias for mysql shell commands
#alias mysql="/Applications/MAMP/Library/bin/mysql"
#alias mysqladmin="sudo /Applications/MAMP/Library/bin/mysqladmin"
#alias mysqlstop="sudo /Applications/MAMP/Library/bin/mysqladmin -u root -p shutdown"
#alias mysqlstart="sudo /Applications/MAMP/Library/bin/mysqld_safe"
#alias mysql_config="sudo /Applications/MAMP/Library/bin/mysql_config"
#alias mysqldump="/Applications/MAMP/Library/bin/mysqldump"

alias my="mysql -uroot -p "
alias youtube-dl="youtube-dl --max-quality url"
# git
alias gs="git status -bs"
alias ga="git add --all "
alias gd="git diff "
# http://gyaresu.org/hacking/2012/06/19/a-better-git-log
#alias gl="git log --pretty=oneline --abbrev-commit --graph --decorate"
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

alias gc="git commit -m "
alias gco="git checkout "

# history
export LSCOLORS=ExGxFxDxCxHxHxCbCeEbEb
export HISTSIZE=10000                      # 500 is default
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p '    # using strftime format
export HISTCONTROL=ignoreboth              # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll:cd ; clear:h:gs"

# colors
BASH_NEWLINE="\n"

BASH_GRAY="\[\e[1;30m\]"

GREEN="\[\033[0;32m\]"
GREEN_BOLD="\[\033[01;32m\]"

BASH_WHITE="\[\e[1;0m\]"
BASH_LIGHT_GRAY="\[\e[0;37m\]"

BLACK="\[\033[0;30m\]"
BLACK_BOLD="\[\033[01;30m\]"

MAGENTA="\[\033[0;35m\]"
MAGENTA_BOLD="\[\033[01;35m\]"

RED="\[\033[0;31m\]"
RED_BOLD="\[\033[01;31m\]"

BLUE="\[\033[0;34m\]"
BLUE_BOLD="\[\033[01;34m\]"

YELLOW="\[\033[0;33m\]"
YELLOW_BOLD="\[\033[01;33m\]"

CYAN="\[\033[0;36m\]"
CYAN_BOLD="\[\033[01;36m\]"

# functions
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1    ;;
      *.tar.gz)  tar xvzf $1    ;;
      *.bz2)     bunzip2 $1     ;;
      *.rar)     unrar $1       ;;
      *.gz)      gunzip $1      ;;
      *.tar)     tar xvf $1     ;;
      *.tbz2)    tar xvjf $1    ;;
      *.tgz)     tar xvzf $1    ;;
      *.zip)     unzip $1       ;;
      *.Z)       uncompress $1  ;;
      *.7z)      7z x $1        ;;

      *) echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}
function pvcp()
{
  SOURCE=$1

  if [ -d $2 ]
    then
      DESTINATION=$2/`basename $SOURCE`
  else
    DESTINATION=$2
  fi

  pv ${SOURCE} | > ${DESTINATION}
}


# scm
function parse_git_dirty {
  if [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit"* ]]; then
    echo "*"
  fi
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [git::\1$(parse_git_dirty)]/"
}

parse_svn_branch() {
  parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn::"$1")" }'
}
parse_svn_url() {
  svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
  svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}


# add homebrew shit
PATH="/usr/local/bin:${PATH}"
PATH="/usr/local/sbin:${PATH}"

export PATH=$PATH":${HOME}/.bin"

# python modules
# PATH="/usr/local/share/python:${PATH}"
# # python -> virtualenv(wrapper)
# export WORKON_HOME="$HOME/.virtualenvs"
# source /usr/local/share/python/virtualenvwrapper.sh
# export PROJECT_HOME=$HOME/Dropbox/Sites


# add npm bin folder to PATH
export PATH="/usr/local/share/npm/bin:${PATH}"
# export PATH

# requires brew install most
# export MANPAGER="/usr/local/bin/most -s"

# export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export EDITOR=vim
# add coldfusion
# export PATH="/Applications/Utilities/ColdFusion10/cfusion/bin:${PATH}"
if which rbenv ; then
  eval "$(rbenv init -)"
fi
PS1="$GREEN_BOLD{\h}$BLUE_BOLD [\W]$GREEN_BOLD\$(parse_git_branch)\$(parse_svn_branch) $RED_BOLD-> $BASH_WHITE";
alias mf="mdfind"
alias infcc='cd ~/Dropbox/Sites/infomedica/infomedica-app/ ; s cc ; cd -'
alias pymulator="kivy ~/Develop/src/simuladorHDD/main.py"
