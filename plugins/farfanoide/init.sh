# helpers
_mac_osx() { [ $(uname) = 'Darwin' ] ;}
_linux()   { [ $(uname) = 'Linux' ] ;}

# directory from which the plugins is being invoked
dir="$PLUGINS_DIR/farfanoide"

alias_file="$dir/alias"
[ -e $alias_file ] && source $alias_file

# load functions after alias so that they can be inherited
func_file="$dir/functions"
[ -e $func_file ] && source $func_file

# load env vars after functions too use them
env_file="$dir/env"
[ -e $env_file ] && source $env_file

path_file="$dir/path"
[ -e $path_file ] && source $path_file

bindings_file="$dir/bindings"
[ -e $bindings_file ] && source $bindings_file

# clean up after ourselves
unset dir env_file alias_file func_file path_file

# enable virtualenv custom function
enable_virtualenv

chpwd () { [ $(ls -l | wc -l) -gt 30 ] && ls || ls -l ;}
