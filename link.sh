#!/usr/bin/env bash
# Script to automatically link a directory of config
# files as .files on a user's home directory
# it's meant to ease the mainainance of a centralized repo of configurations

# COLOURS
G="\033[0;32m"
R="\033[0;31m"
B="\033[0;34m"
Y="\033[0;33m"


# Array of filenames to skip, any arguments passed to
# the script will be added here
skip=("README.md", "tools", "backups", "sshconfig", $0, $*)
bckpdir="${PWD}/backups/$(date "+%Y%m%d%H%M%S_backup")"
for name in *; do
  if [[ ! ${skip[*]} =~ $name ]]; then
    target="$HOME/.$name"

    if [ -a $target ]; then
      if [[ ! -d $bckpdir ]]; then
        mkdir $bckpdir
      fi
      echo -e "$B >> Backing up $target to $bckpdir"
      cp -r $target $bckpdir
      echo -e "$R >> Removing $target"
      rm $target
    fi

    ln -s "$PWD/$name" "$target"
    echo -e "$G >> Linked $PWD/$name to $target"
  else
    echo -e "$Y >> Skipping ${name}"
  fi
done