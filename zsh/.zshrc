# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

# Pure prompt customization
export PURE_PROMPT_SYMBOL="$"
export PURE_PROMPT_VICMD_SYMBOL="%"

# Don't lag shell startup with nvm
export NVM_LAZY_LOAD=true

# ZSH completion
# zstyle :compinstall filename $HOME/.zshrc
autoload -Uz compinit && compinit -i

# Antibody ZSH plugin manager
source <(antibody init)
antibody bundle < $HOME/.zsh_plugins

autoload -Uz compinit && compinit -i

setopt null_glob
source $HOME/.exports
for f in ~/.exports.d/*; do
	[[ ! -e $f ]] && continue  # continue, if file does not exist
	source $f;
done

source $HOME/.aliases
source $HOME/.aliases-`uname`
for f in ~/.aliases.d/*; do
	[[ ! -e $f ]] && continue  # continue, if file does not exist
	source $f; 
done

setopt histignorealldups sharehistory nomatch

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
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
# export PATH="$NVM_DIR/versions/node/$(<$NVM_DIR/alias/default)/bin:$PATH"
# alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@"
# export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
