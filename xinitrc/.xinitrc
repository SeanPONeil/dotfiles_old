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

#xset +fp /usr/share/fonts/local
#xset +fp /usr/share/fonts/woff
#xset +fp /usr/share/fonts/opentype
#xset +fp /usr/share/fonts/svg
#xset +fp /usr/share/fonts/eot
#xset +fp /usr/share/fonts/truetype
xset +fp $XDG_DATA_HOME/fonts
xset +fp $XDG_DATA_HOME/fonts/NerdFonts
xset fp rehash
xrdb -merge $HOME/.Xresources
xrdb -merge $XDG_CACHE_HOME/wal/colors.Xresources
xsetroot -cursor_name left_ptr

compton -b
numlockx &
unclutter &
#light-locker &
mopidy &
#xbindkeys &
#nitrogen --restore &
#lxpolkit &
#parcellite &
#urxvtd -q -o -f

#exec herbstluftwm --locked

$HOME/.fehbg &
sxhkd &
$XDG_CONFIG_HOME/polybar/launch.sh
exec ssh-agent bspwm
