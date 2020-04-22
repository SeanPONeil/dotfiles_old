#!/usr/bin/env bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

set -a
. $HOME/.config/user-dirs.dirs
_JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_AWT_WM_NONREPARENTING
set +a

# include all fonts in /usr/share/fonts
for dir in /usr/share/fonts ; do
  if [ -d "$dir"  ]; then
    pushd $dir
    xset +fp "$PWD"
    popd
  fi
done

xset +fp $HOME/.local/share/fonts/

xset fp rehash
xrdb -merge $HOME/.Xresources
xrdb -merge $XDG_CACHE_HOME/wal/colors.Xresources

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK

picom -b -C
unclutter &
dunst &
mopidy &
$HOME/.fehbg &
wal -R

exec bspwm 
