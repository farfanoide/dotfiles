# Directories: -------------------------------------------------------------{{{

setopt CDABLEVARS
setopt AUTONAMEDIRS
setopt COMPLETE_IN_WORD # Complete from both ends of a word.
setopt ALWAYS_TO_END    # Move cursor to the end of a completed word.
setopt PATH_DIRS        # Perform path search even on command names with slashes.
setopt AUTO_MENU        # Show completion menu on a successive tab press.
setopt AUTO_LIST        # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE  # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL   # Disable start/stop characters in shell editor.

# --------------------------------------------------------------------------}}}

# History: -----------------------------------------------------------------{{{

HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"       # The path to the history file.
HISTSIZE=10000                   # The maximum number of events to save in the internal history.
SAVEHIST=10000                   # The maximum number of events to save in the history file.

setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS       # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a previously found event.
setopt HIST_IGNORE_SPACE      # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS      # Do not write a duplicate event to the history file.
setopt HIST_VERIFY            # Do not execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing non-existent history.

# --------------------------------------------------------------------------}}}

# Autocompletion Styles: ---------------------------------------------------{{{
# --------------------------------------------------------------------------}}}

# Prompt: ------------------------------------------------------------------{{{
# parse_git_dirty()
# {
#     command git diff-index --quiet HEAD 2> /dev/null || echo "*"
# }

# export PROMPT_EOL_MARK='' # remove trailing %
# setopt prompt_subst
# autoload -Uz vcs_info
#
#
# zstyle ':vcs_info:*' actionformats \
#     '%F{8}(%f%s%F{8})%F{3}-%F{8}[%F{2}%b%F{3}|%F{1}%a%F{8}]%f '
# zstyle ':vcs_info:*' formats       \
#     '%F{8}[%F{7}%s%F{8}%F{4}::%F{8}%F{7}%b%F{8}]%f '
# zstyle ':vcs_info:*' enable git hg

# zstyle ':vcs_info:*:*' check-for-changes true # this enables %u and %c
# zstyle ':vcs_info:*:*' use-simple true

# or use pre_cmd, see man zshcontrib
# vcs_info_wrapper()
# {
#     vcs_info
#     if [ -n "$vcs_info_msg_0_" ]; then
#         echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}${del}$(parse_git_dirty)"
#     fi
# }
#
# virtualenv_info()
# {
#     [ $VIRTUAL_ENV ] && echo "( : ${VIRTUAL_ENV##*/}) "
# }

# RPROMPT=$'$(virtualenv_info)$(vcs_info_wrapper)'

#= Segments
# 
# directory_segment='%F{6} %~'
# ssh_segment='%F{2}($(whoami)@$(hostname -s))'
# last_command='%(?.%F{6}.%F{red}) ❯ %f'

# PROMPT="${directory_segment} "

# [ $SSH_CONNECTION ] && PROMPT+="${ssh_segment} "

# PROMPT+="${last_command} "

# PROMPT='%F{6}:%~:%(?.%F{6}.%F{red}) ❯ %f '
# Simple clock at right side
# export RPROMPT=$'%F{cyan}%*%f'

# --------------------------------------------------------------------------}}}
