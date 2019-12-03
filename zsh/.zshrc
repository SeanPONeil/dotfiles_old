# Antibody ZSH plugin manager
source <(antibody init)
antibody bundle < $HOME/.zsh_plugins

# ZSH completion
autoload -Uz compinit
compinit

source $HOME/.aliases
source $HOME/.aliases-`uname`

# PyWal colors
source $XDG_CACHE_HOME/wal/colors.sh

# set JAVA_HOME via asdf
source $HOME/.asdf/plugins/java/set-java-home.sh

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

# start autojump
source /usr/share/autojump/autojump.sh

# helps Android Studio/IntelliJ behave better in tiling window managers
export _JAVA_AWT_WM_NONREPARTENTING=1

export GOPATH=$(go env GOPATH)
# add all $GOPATH/bin directories to PATH
export PATH=$PATH:${GOPATH//://bin:}/bin

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin
export PATH=$HOME/.npm-global/bin:$PATH
export EDITOR=nvim
export SYSTEMD_EDITOR=mvim
export VISUAL=nvim
export PAGER=/bin/less

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

source $HOME/.zshrc-`uname`
