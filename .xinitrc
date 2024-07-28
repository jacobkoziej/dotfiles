#!/bin/sh

xset r rate 250 50

xrdb "-D$(hostname | sed 's/[-\.]/_/g; s/[a-z]/\U&/g')" -merge "$HOME/.Xresources"

exec dbus-launch --sh-syntax --exit-with-session bspwm
