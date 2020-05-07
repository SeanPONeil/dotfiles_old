#!/usr/bin/env bash

echo "Setting bspwm config for eDP-1"

bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9 10
bspc config window_gap 10
