# ---------------------[ General Stuff ]----------------------------------------{{{
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
_mac_osx && alias ls='ls -h' || alias ls='ls -h --color=auto'
alias d='dirs -v'
# alias para colorcitos y giladas
alias l='ls -o'
alias la='ls -lA'
alias lg='la | grep -i'
alias lr='ls -R '
alias grep='grep --color=auto'
alias up='cd ..'
alias c='clear'
alias h='history'
alias f='fg'
alias mplayer='mplayer -msgcolor'
alias m='mplayer'
alias df='df -h'
alias tree='tree -C --du -h'
# requires sudo pip install pygments
alias hi='pygmentize -g'
alias du='du -hs'
# Show me the size of all the things. The bastard child of du and df ->  http://gyaresu.org/hacking/2012/08/02/alias-to-show-the-size-of-files-and-folders/
alias duf='du -sk * | sort -nr | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'''
# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
# folders and archives
alias mv='mv -iv'
alias srm='sudo rm -Rfv'
alias mkdir='mkdir -p'
# requires brew install grc
alias ctail='\grc tail'
alias dateformat='date "+%d-%m-%Y"'
_linux && alias open='xdg-open'
alias o='open'
alias o.='open .'

# override cp with advanced copy http://beatex.org/web/advancedcopy.html#compile
if [[ -f "$HOME/.bin/cp" ]] ; then
  alias cp='cp -rg'
else
  alias cp='rsync --append --progress -azvrE'
fi

# }}}

# ---------------------[ Mac stuff ]----------------------------------------{{{
if _mac_osx ; then
  alias fixcam='sudo killall AppleCameraAssistant;sudo killall VDCAssistant'
  alias optimize='o -a ImageOptim'
  alias optim='optimize'
  alias brup='brew update && brew upgrade && brew cleanup'
  alias sup=brup
  alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
  alias mf='mdfind'
  alias wt='wifi_toggle'
  alias bt='bluetooth_toggle'
fi
# }}}

# ---------------------[ Linux stuff ]----------------------------------------{{{
if _linux ; then
  alias sai='sudo apt-get install -y '
  alias sar='sudo apt-get purge -y '
  alias sud='sudo apt-get update'
  alias sup='sudo apt-get update && \
             sudo apt-get -y dist-upgrade && \
             sudo apt-get -y autoremove && \
             sudo apt-get -y autoclean'
  alias pbcopy='xsel -a'
  alias pbpaste='xsel -o'
fi
# }}}

# ---------------------[ Misc ]-----------------------------------------{{{
alias musik='cd $MUSIC_DIR'
alias fuck='cd ~/Dropbox/compartidas/Facultad/'
alias shut='sudo shutdown -h now'
# }}}

# ---------------------[ MySQL ]----------------------------------------{{{
alias my='mysql -uroot -p '
alias mydump='mysqldump -uroot -p'
alias mystart='mysql.server start'
# }}}

# ---------------------[ Git ]----------------------------------------{{{
alias gs='git status -bs'
alias ga='git add --all '
alias ga.='ga .'
alias gd='git diff '
alias grv='git remote -v'
alias gcm='git commit -m'
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset - %C(bold blue)%an%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) ' --abbrev-commit --"
alias gfc='git clone'
alias gc='git commit -v'
alias gco='git checkout '
alias gba='git branch -av'
grt()
{
    # Requires `repo_root` shell script which basically asks the scm executable
    # the root path for the current repository
    cd "$(repo_root)"
}
# }}}

# ---------------------[ Tmux ]----------------------------------------{{{
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
alias tdc='tmux detach-client -t'
# Yat.sh shortcuts (https://github.com/farfanoide/yat.sh)
alias ys='yat.sh'
alias ysl='ys ls -a'
alias yl='ysl'
# }}}

# ---------------------[ Bundler ]----------------------------------------{{{
alias be='bundle exec'
alias bl='bundle list'
alias bp='bundle package'
alias bo='bundle open'
alias bu='bundle update'
alias bi='bundle check; bundle install'
# }}}

# ---------------------[ Heroku ]-----------------------------------------{{{
herokup()
{
  local dotenv="$(repo_root)/.env"
  git push heroku master && [ -e $dotenv ] && heroku config:set $(cat $dotenv) && heroku apps:open
}
alias hup=herokup
alias ho='heroku open'
alias hl='heroku logs -t'
hr()
{
    heroku run $*
}
# }}}

# ---------------------[ Ruby/Rails/Rake ]----------------------------------------{{{
bes()
{
    bundle exec rails server $* 2> /dev/null || bundle exec rackup $*
}
bec()
{
    bundle exec rails console $* 2> /dev/null || (grt 2> /dev/null ; bundle exec racksh)
}
alias ber='bundle exec rake'
alias bem='bundle exec rake db:migrate'
alias bemr='bundle exec rake db:rollback'
alias bed='bundle exec rails db'
alias beg='be guard'
# get development db name from database.yml
devdb()
{
    cat $(repo_root)/config/database.yml | grep _development | tr -d ' ' | cut -d':' -f2
}
getdevdb()
{
    echo "$(devdb)" | pbcopy
}
# }}}

# ---------------------[ Vagrant ]----------------------------------------{{{
alias vup='vagrant up'
alias vsh='vagrant ssh'
alias vst='vagrant status'
alias vsg='vagrant global-status'
alias vgs='vsg'
alias vre='vagrant resume'
alias vha='vagrant halt'
alias vsu='vagrant suspend'
alias vpr='vagrant provision'
# }}}

# ---------------------[ SSH ]----------------------------------------{{{
alias s='ssh'
alias scp='scp -r'
alias sshfixpermissions='chmod -R 700 "$HOME/.ssh" && chmod 600 "$HOME/.ssh/*rsa" && chmod 644 "$HOME/.ssh/*pub"'
# }}}

# ---------------------[ Docker ]-------------------------------------{{{
alias dm='docker-machine'
alias dr='docker run -it --rm'
alias dv='docker version'
alias dp='docker ps'
alias dpa='docker ps -a'
name_this()
{
  echo "$(whoami)/$(basename $(pwd))"
}
# }}}
