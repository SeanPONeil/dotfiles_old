#!/bin/bash

common=(
  "stow ag"
  "stow alacritty"
  "stow bin"
  "stow curl"
  "stow firefox"
  "stow fonts"
  "stow git"
  "stow kitty"
  "stow mitmproxy"
  "stow mopidy"
  "stow neofetch"
  "stow nvim"
  "stow ranger"
  "stow spotifyd"
  "stow ssh"
  "stow tmux"
  "stow wal"
  "stow wallgen"
  "stow wallpapers"
  "stow youtube-dl"
  "stow zsh"
)

linux=(
  "stow autorandr"
  "stow bin-linux"
  "stow bspwm"
  "stow dunst"
  "stow mpv"
  "stow kitty-font-linux"
  "stow picom"
  "stow polybar"
  "stow redshift"
  "stow rofi"
  "stow sxhkd"
  "stow util"
  "stow xinitrc"
#  "sudo stow xorg -t /usr/share/X11/xorg.conf.d"
#  "sudo stow timezone -t /etc/NetworkManager/dispatcher.d"
)

darwin=(
  "stow alfred"
  "stow brewfile"
  "stow karabiner"
  "stow kitty-font-osx"
  "stow skhd"
  "stow spotifyd-plist"
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



