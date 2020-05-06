#!/bin/bash

line1="$(date +'%A, %B %d')"
line2="$(date +'%H:%M')"
line3="$(date +'Week %W, Day %j')"

notify-send --urgency=normal "It is currently ${line2}"$'\n'"on ${line1}"$'\n'"${line3}"
