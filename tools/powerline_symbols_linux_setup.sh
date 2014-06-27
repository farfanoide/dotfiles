#!/usr/bin/env bash

[ ! $(uname) = "Linux" ] && exit 1

mkdir -p "$HOME/.fonts"
cd "$HOME/.fonts"
wget 'https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf'
cd
fc-cache -vf ~/.fonts
mkdir "$HOME/.fonts.conf.d"
cd "$HOME/.fonts.conf.d"
wget 'https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf'
