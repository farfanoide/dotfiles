function update_kivy() {
  workon kivy
  cd ~/Develop/apps/Kivy.app/Contents/Resources/kivy
  git pull
  make
  deactivate
  cd -
}

function repo_root() { git rev-parse --show-toplevel }

function grt() { cd $(repo_root) }

function mystart() { [[ $(mysql.server status) =~ "ERROR"* ]] && mysql.server start }

function myexec() { mysql -uroot -p -e "$*;" }

function lg() { ls -lA . | grep -i $1 }

#function check_shell(){
#  $(ps -p $$ | tail -1) =~ "zsh"*
#}

function md(){ mkdir -p $1 && cd $1 }

function cr() {
  if [[ $# -ge 2 ]]; then
    cp $1 $2
    echo "Removing $1"
    rm -f $1
  else
    echo "2 arguments needed."
  fi
}

function enable_virtualenv(){
  # python -> virtualenv(wrapper)
  export WORKON_HOME="$HOME/.virtualenvs"
  source /usr/local/bin/virtualenvwrapper.sh
  export PROJECT_HOME=$HOME/Develop/sites
}

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

function reloadshell() { exec $SHELL -l }

function githubrepo(){
  if [[ $# -ge 1 ]]; then
    repo_name=$1
    repo_url=$(curl -u 'farfanoide' https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}" | grep ssh_url | cut -d\"  -f4 )
    if [[ ! -z repo_url ]]; then
      git remote add origin $repo_url
    fi
    unset repo_name repo_url
  else
    echo 'need a repo name at least'
  fi
}