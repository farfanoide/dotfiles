ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# make sure we're using homebrew
PATH="/usr/local/bin:${PATH}"
PATH="/usr/local/sbin:${PATH}"

echo "Installing scm tools:"
echo "*-----------------------------------------------------------------------------*"
# brew install git git-flow mercurial
brew install git
# TODO: check installation of subversion

echo "Installing shell stuff:"
echo "*-----------------------------------------------------------------------------*"
brew install bash bash-completion zsh zsh-syntax-highlighting zsh-completions reattach-to-user-namespace tmux tree

echo "Adding zsh to /etc/shells so we can set it as default later"
echo "*-----------------------------------------------------------------------------*"
echo `which zsh` | sudo tee -a /etc/shells

# alternative would be sudo bash -c "echo `which zsh` >> /etc/shells"
# curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh




# echo "Installing editors:"
# echo "*-----------------------------------------------------------------------------*"

# brew install macvim emacs vim
brew install vim --override-system-vi
# echo "Installing db's:"
# echo "*-----------------------------------------------------------------------------*"



# brew install mysql postgresql

#brew install git zsh most python rbenv rbenv-rehash openssh youtube-dl bash-completion apachetop bash bash-completion cmatrix composer node emacs ruby-build vim



# echo "Installing  GUI Stuf"
# echo "*-----------------------------------------------------------------------------*"
# brew tap phinze/homebrew-cask
# brew install brew-cask

# echo "Installing Browsers"
# echo "*-----------------------------------------------------------------------------*"

# brew cask install google-chrome google-chrome-canary firefox

# echo "Installing Multimedia apps"
# echo "*-----------------------------------------------------------------------------*"
# brew install mplayer youtube-dl
# brew cask install vlc handbrake  dropbox

# echo "Installing some Dev apps: "
# echo "*-----------------------------------------------------------------------------*"
# brew cask install vagrant


# echo "Installing php dev stuff: "
# echo "*-----------------------------------------------------------------------------*"
# brew tap josegonzalez/homebrew-php
# brew tap homebrew/dupes
# brew install php55

echo "Installing ruby dev stuff: "
echo "*-----------------------------------------------------------------------------*"

brew install rbenv rbenv-gem-rehash ruby-build

echo "Installing python dev stuff: "
echo "*-----------------------------------------------------------------------------*"

brew install python
pip install --upgrade setuptools
pip install --upgrade pip
pip install virtualenvwrapper pygments powerline

echo "Downloading your config files: "
echo "*-----------------------------------------------------------------------------*"

git clone https://farfanoide@bitbucket.org/farfanoide/dots.git 'dotfiles'

if [[ -d dotfiles ]]; then
    cd dotfiles
    git submodule update --init
    echo "Overwriting all your configuration files, muahaha!!!"
    ./link.sh
fi
