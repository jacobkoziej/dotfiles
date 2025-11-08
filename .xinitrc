#!/bin/sh

xset r rate 250 50

xrdb -merge "$HOME/.Xresources"

exec bspwm
