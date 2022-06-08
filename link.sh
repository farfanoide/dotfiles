#!/usr/bin/env bash
# Script to automatically link a directory of config
# files as .files on a user's home directory
# it's meant to ease the mainainance of a centralized repo of configurations

# # COLOURS
# G="\033[0;32m"
# R="\033[0;31m"
# B="\033[0;34m"
# Y="\033[0;33m"
# RESET='\033[0m'

# update path
ln -s "${PWD}/bin" "${HOME}/.bin"

mkdir -p $HOME/.config

echo -e "$G Alacritty Setup $RESET"
ln -s "${PWD}/alacritty" "${HOME}/.config/alacritty"

echo -e "$G Git Setup $RESET"
ln -s "${PWD}/gitignore_global" "${HOME}/.gitignore_global"
ln -s "${PWD}/gitconfig" "${HOME}/.gitconfig"

echo -e "$G Tmux Setup $RESET"
ln -s "${PWD}/tmux" "${HOME}/.tmux"
ln -s "${PWD}/tmux.conf" "${HOME}/.tmux.conf"

echo -e "$G ctags Setup $RESET"
ln -s "${PWD}/ctags" "${HOME}/.ctags"
ln -s "${PWD}/ctagsignore" "${HOME}/.ctagsignore"

echo -e "$G NeoVim Setup $RESET"
ln -s "${PWD}/nvim" "${HOME}/.config/nvim"

# shell setup
echo -e "$G Shell Setup $RESET"
ln -s "${PWD}/plugins" "${HOME}/.plugins"
ln -s "${PWD}/fpath" "${HOME}/.plugins"
ln -s "${PWD}/zshrc" "${HOME}/.zshrc"
# input rules
ln -s "${PWD}/inputrc" "${HOME}/.inputrc"
# eslint
ln -s "${PWD}/eslintrc.json" "${HOME}/.eslintrc.json"
