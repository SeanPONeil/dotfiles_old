#!/bin/bash

common=(
  "stow ag"
  "stow bin"
  "stow curl"
  "stow firefox"
  "stow fonts"
  "stow git"
  "stow kitty"
  "stow mitmproxy"
  "stow neofetch"
  "stow nvim"
  "stow ranger"
  "stow spotifyd"
  "stow ssh"
  "stow tmux"
  "stow wal"
  "stow wallgen"
  "stow youtube-dl"
  "stow zsh"
)

linux=(
  "stow bspwm"
  "stow dunst"
  "stow gnome-keyring"
  "stow mpv"
  "stow keychain-systemd"
  "stow picom"
  "stow polybar"
  "stow redshift"
  "stow rofi"
  "stow ssh-agent-systemd"
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



