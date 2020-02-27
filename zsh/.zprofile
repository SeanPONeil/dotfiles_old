export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
source $HOME/.config/user-dirs.dirs

export ANDROID_SDK=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_HOME=$ANDROID_SDK

unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)   export JAVA_HOME=/usr/lib/jvm/default;;
  Darwin*)  export JAVA_HOME="$(/usr/libexec/java_home -v 1.8.0_242)";;
  *)        export JAVA_HOME=JAVA_HOME
esac

export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin

export N_PREFIX=$XDG_DATA_HOME/n

# Make `pip3 install --user` install packages to .local on os x`
export PYTHONUSERBASE=~/.local

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source $HOME/.zprofile-`uname`
