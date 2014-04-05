# diretory from which the plugins is being invoked
dir=$(dirname $0)

env_file="$dir/env"
if [[ -a $env_file ]]; then
  source $env_file
fi

alias_file="$dir/alias"
if [[ -a $alias_file ]]; then
  source $alias_file
fi

# load functions after alias so that they can be inherited
func_file="$dir/functions.zsh"
if [[ -a $func_file ]]; then
  source $func_file
fi

func_file="$dir/prompt"
if [[ -a $prompt_file ]]; then
  source prompt
fi

# clean up after ourselves
unset dir func_file alias_file prompt_file env_file

# Apps and frameworks
function getwp(){
    wget http://wordpress.org/latest.tar.gz
    tar -xvf latest.tar.gz
    if [[ $# -gt 0 ]]; then
        mv wordpress/* $1
        rm -rf wordpress
    fi
    rm -rf latest.tar.gz
}
function gethtml5(){
    wget https://github.com/h5bp/html5-boilerplate/archive/master.zip
    tar -xvf master.zip
    if [[ $# -gt 0 ]]; then
        mv html5-boilerplate-master/* $1
        rm -rf html5-boilerplate-master/
    fi
    rm -rfv master.zip
}
alias getnormalize="wget https://raw.github.com/necolas/normalize.css/master/normalize.css"

PATH="${HOME}/.bin:${PATH}"
