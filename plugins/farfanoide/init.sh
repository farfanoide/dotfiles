# helpers
_mac_osx() { [ $(uname) = 'Darwin' ] ;}
_linux()   { [ $(uname) = 'Linux' ] ;}

# directory from which the plugins is being invoked
# dir="${PLUGINS_DIR}/farfanoide"
#
# source "${dir}/alias.sh"
# source "${dir}/functions.sh" # load functions after alias so that they can be inherited
# # source "${dir}/env.sh"       # load env vars after functions too use them
# # source "${dir}/path.sh"
# source "${dir}/bindings.sh"

source ./plugins/farfanoide/alias.sh
source ./plugins/farfanoide/functions.sh
source ./plugins/farfanoide/bindings.sh

# [[ $(current_shell) =~ "zsh" ]] && source "$dir/zsh"

unset dir # clean up after ourselves

# chpwd ()
# {
#   # If all files can be listed in the available rows, do so with item details,
#   # otherwise do a normal `ls` splitting into columns
#   [ $(ls -l | wc -l) -gt $(tput lines) ] && ls || ls -l
# }
#
# initialize_rbenv ()
# {
#     if type rbenv 2>&1 > /dev/null; then
#         eval "$(rbenv init - --no-rehash zsh)"
#     else
#         echo "rbenv not found"
#     fi
# }
