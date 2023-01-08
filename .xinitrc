#!/bin/sh

setxkbmap -option caps:swapescape
xset r rate 250 50

exec dbus-launch --sh-syntax --exit-with-session bspwm
