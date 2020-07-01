# zmodload zsh/zprof

export DOTFILES="$HOME/dotfiles"

# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

# Pure prompt customization
export PURE_PROMPT_SYMBOL=">"
export PURE_PROMPT_VICMD_SYMBOL="<"

# ZSH completion
# zstyle :compinstall filename $HOME/.zshrc
#autoload -Uz compinit

# Load antibody plugins
export NVM_NO_USE=true
source $HOME/.zsh_plugins

# ZSH completion
autoload -Uz compinit && compinit

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zprof
