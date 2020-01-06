#!/bin/bash

common=(
  "stow ag"
  "stow bin"
  "stow firefox"
  "stow fonts"
  "stow git"
  "stow kitty"
  "stow nvim"
  "stow ssh"
  "stow wal"
  "stow wallpaper"
  "stow zsh"
)

linux=(
  "stow bspwm"
  "stow compton"
  "stow dunst"
  "stow fehbg"
  "stow mpv"
  "stow polybar"
  "stow rofi"
  "stow sxhkd"
  "stow xinitrc"
#  "sudo stow xorg -t /usr/share/X11/xorg.conf.d"
#  "sudo stow timezone -t /etc/NetworkManager/dispatcher.d"
)

darwin=(
  "stow karabiner"
  "stow skhd"
  "stow yabai"
)

echo "Installing common dotfiles..."

for dotfiles in "${common[@]}"
do
  echo "$dotfiles"
  eval "$dotfiles"
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
  echo "$dotfiles"
  eval "$dotfiles"
done



