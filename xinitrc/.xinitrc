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
set +a

# fixes issues with Java GUIs in i3/bspwm
export _JAVA_AWT_WM_NONREPARENTING=1

# include all fonts in /usr/share/fonts
for dir in /usr/share/fonts ; do
  if [ -d "$dir"  ]; then
    pushd $dir
    xset +fp "$PWD"
    #mkfontscale
    #mkfontdir
    popd
  fi
done

xset +fp $HOME/.local/share/fonts/

xset fp rehash
xrdb -merge $HOME/.Xresources
xrdb -merge $XDG_CACHE_HOME/wal/colors.Xresources
xsetroot -cursor_name left_ptr

#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

compton -b
unclutter &
redshift &
#light-locker &
#mopidy &
dunst &
#xbindkeys &
#nitrogen --restore &
#lxpolkit &
#parcellite &
#urxvtd -q -o -f

setxkbmap -option caps:super

#exec herbstluftwm --locked

$HOME/.fehbg &
$HOME/bin/launchPolybar

# bspwm is default desktop environment
session=${1:-bspwm}

case $session in
  bspwm         ) exec bspwm;;
  i3|i3wm       ) exec i3;;
  kde           ) exec startplaxma-x11;;
  xfce|xfce4    ) exec startxfce4;;
  # No known session, try to run it as command
  *             ) exec $1;;
esac
