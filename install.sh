#!/bin/bash

common=(
  "stow ag"
  "stow bin"
  "stow fonts"
  "stow git"
  "stow kitty"
  "stow nvim"
  "stow wallpaper"
  "stow zsh"
)

linux=(
  "stow bspwm"
  "stow compton"
  "stow fehbg"
  "stow polybar"
  "stow rofi"
  "stow sxhkd"
  "stow xinitrc"
  "sudo stow xorg -t /usr/share/X11/xorg.conf.d"
)

darwin=(
  "stow karabiner"
  "stow skhd"
  "stow yabai"
)

echo "Installing common dotfiles..."

for dotfiles in "${common[@]}"
do
  echo $dotfiles
  eval $dotfiles
done

os=$(uname)

if [ "$os" = "Darwin" ]
then
  echo "Installing dotfiles for OS X..."
  osDotfiles=("${darwin[@]}")
elif [ "$os" = "Linux" ]
then
  echo "Installing dotfiles for Linux..."
  osDotfiles=("${linux[@]}")
else
  echo "No dotfiles for operating system $os"
  exit 0
fi

for dotfiles in "${osDotfiles[@]}"
do
  echo $dotfiles
  eval $dotfiles
done



