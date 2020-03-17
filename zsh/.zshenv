source $HOME/.config/user-dirs.dirs
XDG_DATA_HOME="$HOME/.local/share"
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"

if [ -n "$DISPLAY" ]; then
  eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
  export SSH_AUTH_SOCK
fi
