#!/bin/sh
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
xsetroot -cursor_name left_ptr

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
export SSH_AUTH_SOCK

picom --experimental-backends -b -C
unclutter &
#light-locker &
#mopidy &
dunst &
#xbindkeys &
#nitrogen --restore &
#lxpolkit &
#parcellite &
#urxvtd -q -o -f

$HOME/.fehbg &

# bspwm is default desktop environment
session=${2:-bspwm}

case $session in
  bspwm         ) exec bspwm;;
  i3|i3wm       ) exec i3;;
  kde           ) exec startplasma-x11;;
  xfce|xfce4    ) exec startxfce4;;
  # No known session, try to run it as command
  *             ) exec $2;;
esac
