# ZSH completion
zstyle :compinstall filename $HOME/.zshrc
autoload -Uz compinit
compinit

# Antibody ZSH plugin manager
source <(antibody init)
antibody bundle < $HOME/.zsh_plugins

# setup PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$ANDROID_SDK/platform-tools:$PATH
export PATH=$ANDROID_SDK/tools:$PATH
export PATH=$HOME/.fzf/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=${GOPATH//://bin:}/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH

source $HOME/.aliases
source $HOME/.aliases-`uname`

# PyWal colors
source $XDG_CACHE_HOME/wal/colors.sh

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export VISUAL=nvim
export PAGER=/usr/bin/less

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

source $HOME/.zshrc-`uname`

[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
