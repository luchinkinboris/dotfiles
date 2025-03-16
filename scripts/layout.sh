#!/bin/sh

layout="$(hyprctl devices | grep -A 10 'at-translated-set-2-keyboard' | grep 'active keymap' | awk -F ': ' '{print $2}')"

if [ "$layout" = "Russian" ]; then
    echo "ru"
elif [ "$layout" = "English (US)" ]; then
    echo "us"
fi
