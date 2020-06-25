#!/usr/bin/env bash
set -e

if ! [ -x "$(command -v antibody)" ]; then
  if command -v brew >/dev/null 2>&1; then
	  brew tap | grep -q 'getantibody/tap' || brew tap getantibody/tap
	  brew install antibody
  else
	  curl -sL https://git.io/antibody | sudo sh -s -- -b /usr/local/bin
  fi
fi

antibody bundle <"$DOTFILES/antibody/bundles.txt" > ~/.zsh_plugins
antibody update
