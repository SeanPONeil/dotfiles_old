export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
source $HOME/.config/user-dirs.dirs

# LinuxBrew
if [ -d "/home/linuxbrew" ] ; then
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
export ANDROID_SDK=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_HOME=$ANDROID_SDK

export GOPATH=$(go env GOPATH)

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# helps Android Studio/IntelliJ behave better in tiling window managers
export _JAVA_AWT_WM_NONREPARENTTING=1

# Nix Installer
source $HOME/.nix-profile/etc/profile.d/nix.sh
