#!/usr/bin/env bash
# Script to automatically link a directory of config
# files as .files on a user's home directory
# it's meant to ease the mainainance of a centralized repo of configurations

# COLOURS
G="\033[0;32m"
R="\033[0;31m"
B="\033[0;34m"
Y="\033[0;33m"
RESET='\033[0m'

echo -e "$G Updating Submodules $RESET"
git submodule update --init --recursive
git submodule foreach 'git checkout master && git pull'

# Array of filenames to skip, any arguments passed to
# the script will be added here
skip=("README.md", "tools", "backups", "sshconfig", $0, $*)
dotsdir="$(dirname $0)"
bckpdir="${dotsdir}/backups/$(date "+%Y%m%d%H%M%S_backup")"
[ ! -d $bckpdir ] && mkdir -p $bckpdir

for name in $dotsdir/*; do
  if [[ ! ${skip[*]} =~ $name ]]; then
    target="$HOME/.$name"

    if [ -a $target ]; then
      echo -e "$B [+] Backing up $target to $bckpdir/.$name"
      cp -r $target $bckpdir
      echo -e "$R [-] Removing $target"
      rm $target
    fi

    ln -s "$dotsdir/$name" "$target"
    echo -e "$G [>] Linked $dotsdir/$name to $target"
  else
    echo -e "$Y [~] Skipping ${name}"
  fi
done
echo "Gonna install vim plugins, might take a while."
sleep 2
vim +PlugInstall! +PlugClean +qall

echo "All done."
echo "Enjoy the Ride!"