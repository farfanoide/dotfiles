#!/usr/bin/env bash

# helpers
_mac_osx() { [[ $(uname) == 'Darwin' ]] ;}
_linux() { [[ $(uname) == 'Linux' ]] ;}

# directory from which the plugins is being invoked
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
func_file="$dir/functions"
if [[ -a $func_file ]]; then
  source $func_file
fi

func_file="$dir/path"
if [[ -a $path_file ]]; then
  source path
fi

zaw_file="$dir/zaw.zsh"
if [[ -a $zaw_file ]]; then
  source $zaw_file
fi

# clean up after ourselves
unset dir func_file alias_file prompt_file env_file zaw_file path_file

