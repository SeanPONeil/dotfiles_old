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

export JAVA_HOME=$HOME/.sdkman/candidates/java

export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin

export N_PREFIX=$XDG_DATA_HOME/n

export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# helps Android Studio/IntelliJ behave better in tiling window managers
export _JAVA_AWT_WM_NONREPARENTTING=1

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
