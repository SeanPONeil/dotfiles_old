#!/usr/bin/env bash

os=$(uname)
if [ "$os" = "Darwin" ]
then
  profilePath=$HOME/Library/Application\ Support/Firefox/Profiles/1nd7i2es.default-release
elif [ "$os" = "Linux" ]
then
  profilePath=$HOME/.mozilla/firefox/eacyeyst.default
fi

cat ~/.cache/wal/colors.css ~/.config/firefox/userChrome.css > "$profilePath"/chrome/userChrome.css
cp ~/.config/firefox/userContent.css "$profilePath"/chrome/userContent.css
cp ~/.config/firefox/right-arrow.svg "$profilePath"/chrome/right-arrow.svg
cp ~/.config/firefox/left-arrow.svg "$profilePath"/chrome/left-arrow.svg
