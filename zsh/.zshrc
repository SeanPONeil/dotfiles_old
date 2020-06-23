# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

# Pure prompt customization
export PURE_PROMPT_SYMBOL=">"
export PURE_PROMPT_VICMD_SYMBOL="<"

# ZSH completion
# zstyle :compinstall filename $HOME/.zshrc
autoload -Uz compinit && compinit -i

# Antibody ZSH plugin manager
source <(antibody init)
antibody bundle < $HOME/.zsh_plugins

autoload -Uz compinit && compinit -i

source $HOME/.config/user-dirs.dirs
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
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
export PYTHONUSERBASE=$HOME/.local

export PLATFORM=$(uname)

# setup PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$ANDROID_SDK/platform-tools:$PATH
export PATH=$ANDROID_SDK/cmdline-tools/latest/bin:$PATH
export PATH=$HOME/.fzf/bin:$PATH                        # fzf fuzzy finder
export PATH=$HOME/.cargo/bin:$PATH                      # rust scripts
export PATH=$GOBIN:$PATH                                # go binaries
export PATH="$(yarn global bin)":$PATH                  # yarn global bin
export PATH="$(ruby -e 'puts Gem.user_dir')/bin":$PATH  # RubyGems

source $HOME/.aliases
source $HOME/.aliases-`uname`

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

export EDITOR=nvim
export SYSTEMD_EDITOR=nvim
export VISUAL=nvim
export PAGER=/usr/bin/less

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source $HOME/.zshrc-`uname`

# source extra shell scripts if they exist
if [[ -d "$HOME/.zshrc.d" ]]; then
  for file in $HOME/.zshrc.d/*.zsh; do
    source "$file"
  done
fi


# NVM lazy initialization
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
export PATH="$NVM_DIR/versions/node/$(<$NVM_DIR/alias/default)/bin:$PATH"
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
