#!/bin/sh

status() {
  echo "$($HOME/go/bin/nordvpn-status)"
}

city() {
  echo "$($HOME/go/bin/nordvpn-status city)"
}

if [ "$(status)" = "Connected" ]; then
    echo "%{A1:nordvpn d:} $(city)%{A}"
else
    echo "%{A1:nordvpn c:}%{A}"
fi
