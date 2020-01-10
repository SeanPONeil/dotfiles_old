#!/bin/sh

STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
    echo "%{A1:nordvpn d:}$(nordvpn status | grep City | cut -d ':' -f2)%{A}"
else
    echo "%{A1:nordvpn c:}no vpn%{A}"
fi
