source "$HOME/.config/zsh/zshrc"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/farfanoide/.docker/completions $fpath)
autoload -Uz compinit
(( ${+_comps[docker]} )) || compinit
# End of Docker CLI completions
