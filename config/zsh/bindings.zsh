bindkey -v

bindkey "^R" history-incremental-search-backward
bindkey "^E" end-of-line
bindkey "^A" beginning-of-line
bindkey "^U" kill-whole-line

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
