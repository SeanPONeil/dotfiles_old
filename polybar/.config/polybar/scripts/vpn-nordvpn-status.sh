#!/bin/sh

status() {
  echo "$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)"
}

city() {
  echo "$(nordvpn status | grep City | cut -d ':' -f2)"
}

if [ "$(status)" = "Connected" ]; then
    echo "%{A1:nordvpn d:}$(city)%{A}"
else
    echo "%{A1:nordvpn c:}%{A}"
fi
