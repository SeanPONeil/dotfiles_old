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

# fixes issue where Android Studio/IntelliJ won't start in bspwm
export _JAVA_AWT_WM_NONREPARENTING=

xset +fp /usr/share/fonts/opentype/
xset +fp /usr/share/fonts/truetype/
xset +fp /usr/share/fonts/
xset +fp $HOME/.local/share/fonts/

xset fp rehash
xrdb -merge $HOME/.Xresources
xrdb -merge $XDG_CACHE_HOME/wal/colors.Xresources
xsetroot -cursor_name left_ptr

compton -b
numlockx &
unclutter &
#light-locker &
mopidy &
dunst &
#xbindkeys &
#nitrogen --restore &
#lxpolkit &
#parcellite &
#urxvtd -q -o -f

#exec herbstluftwm --locked

$HOME/.fehbg &
sxhkd &
$HOME/bin/launchPolybar
exec ssh-agent bspwm
