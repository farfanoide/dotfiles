alias e="emacs"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

_mac_osx && alias ls="ls -h" || alias ls="ls -h --color=auto"
command -v eza >/dev/null 2>&1 && alias l="eza -l" || alias l="ls -lh"
alias la="ls -lA"
alias lg="la | grep -i"
alias lr="ls -R"
alias grep="grep --color=auto"
alias d="dirs -v"
alias up="cd .."
alias c="clear"
alias h="history"
alias f="fg"
alias df="df -h"
alias du="du -hs"
command -v tree >/dev/null 2>&1 && alias tree="tree -C --du -h"
command -v pygmentize >/dev/null 2>&1 && alias hi="pygmentize -g"

alias mv="mv -iv"
alias mkdir="mkdir -p"
alias rmpyc="rm -rf **/*.pyc"
alias dateformat='date "+%d-%m-%Y"'
_linux && alias open="xdg-open"
alias o="open"
alias o.="open ."

if [[ -f "$HOME/.bin/cp" ]]; then
  alias cp="cp -rg"
elif command -v rsync >/dev/null 2>&1; then
  alias cp="rsync --append --progress -azvrE"
fi

if _mac_osx; then
  alias fixcam="sudo killall AppleCameraAssistant; sudo killall VDCAssistant"
  alias optimize="o -a ImageOptim"
  alias optim="optimize"
  command -v brew >/dev/null 2>&1 && alias brup="brew update && brew upgrade && brew cleanup"
  command -v brew >/dev/null 2>&1 && alias sup="brup"
  alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
  alias mf="mdfind"
fi

if _linux; then
  alias sai="sudo apt install -y"
  alias sar="sudo apt purge -y"
  alias sud="sudo apt update"
  alias sup="sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y"
  alias pbcopy="xsel -a"
  alias pbpaste="xsel -o"
fi

alias gs="git status -bs"
alias ga="git add --all"
alias ga.="ga ."
alias gd="git diff"
alias grv="git remote -v"
alias gl="git log --color --graph --pretty=format:'%C(bold blue)%an%Creset on%Cred %h%Creset - %C(yellow)%d%Creset %s %Cgreen(%cr) ' --abbrev-commit --"
alias gfc="git clone"
alias gc="git commit -v"
alias gco="git checkout"
alias gba="git branch -av"

alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tdc="tmux detach-client -t"
alias ys="yat.sh"
alias ysl="ys ls -a"
alias yl="ysl"

alias be="bundle exec"
alias bl="bundle list"
alias bp="bundle package"
alias bo="bundle open"
alias bu="bundle update"
alias bi="bundle check; bundle install"

alias s="ssh"
alias scp="scp -r"

alias dr="docker run -it --rm"
alias dv="docker version"
alias dp="docker ps"
alias dpa="docker ps -a"
