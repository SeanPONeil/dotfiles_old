# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile

setopt histignorealldups sharehistory nomatch autocd

export DOTFILES="$HOME/dotfiles"

# PyWal
source ~/.cache/wal/colors.sh
(cat ~/.cache/wal/sequences &)

# Pure prompt customization
export PURE_PROMPT_SYMBOL=">"
export PURE_PROMPT_VICMD_SYMBOL="<"

# Load antibody plugins
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('yarn')
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source $HOME/.zsh_plugins

# ZSH completion
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


# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$HOME/.zsh_history

unsetopt null_glob

for file in ~/.{zsh_prompt,aliases,path,dockerfunc,extra,exports,functions}; do
  if [[ -f "$file" ]] && [[ -f "$file" ]]; then
    source "$file"
  fi
done
unset file

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zprof
