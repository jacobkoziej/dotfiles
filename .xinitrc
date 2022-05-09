#!/bin/sh

setxkbmap -option caps:swapescape

exec dbus-launch --sh-syntax --exit-with-session bspwm
