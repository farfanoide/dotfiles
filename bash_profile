# This loads in the configuration in .bashrc
# Put all configuration there!
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
if [ $(uname) == "Darwin" ]; then
  source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# [ -s "/home/farfan/.nvm/nvm.sh" ] && . "/home/farfan/.nvm/nvm.sh" # This loads nvm
