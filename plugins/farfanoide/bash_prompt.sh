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

# scm
function parse_git_dirty()
{
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit"* ]] && echo "*"
}

function parse_git_branch()
{
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [git::\1$(parse_git_dirty)]/"
}

PS1="$BLUE_BOLD [\W]$GREEN_BOLD\$(parse_git_branch) $RED_BOLD-> $BASH_WHITE";
