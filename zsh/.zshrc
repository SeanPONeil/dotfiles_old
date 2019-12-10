# ZSH completion
zstyle :compinstall filename $HOME/.zshrc
autoload -Uz compinit
compinit

# Antibody ZSH plugin manager
source <(antibody init)
antibody bundle < $HOME/.zsh_plugins

source $HOME/.aliases
source $HOME/.aliases-`uname`

# PyWal colors
source $XDG_CACHE_HOME/wal/colors.sh

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

# helps Android Studio/IntelliJ behave better in tiling window managers
export _JAVA_AWT_WM_NONREPARTENTING=1

export GOPATH=$(go env GOPATH)
# add all $GOPATH/bin directories to PATH
export PATH=$PATH:${GOPATH//://bin:}/bin

export PATH=$HOME/.npm-global/bin:$PATH
export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export VISUAL=nvim
export PAGER=/usr/bin/less

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

source $HOME/.zshrc-`uname`
