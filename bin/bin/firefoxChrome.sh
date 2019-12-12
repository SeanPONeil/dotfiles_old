#!/usr/bin/env bash

os=$(uname)
if [ "$os" = "Darwin" ]
then
  profilePath=$HOME/Library/Application\ Support/Firefox/Profiles/1nd7i2es.default-release
elif [ "$os" = "Linux" ]
then
  profilePath=$HOME/.mozilla/firefox/eacyeyst.default
fi

cat ~/.cache/wal/colors.css ~/.config/firefox/firefoxTheme.css > "$profilePath"/chrome/userChrome.css
