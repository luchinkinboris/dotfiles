
#!/bin/sh

layout="$(~/.config/scripts/layout.sh)"

if [ "$layout" = "ru" ]; then
    echo "🇷🇺"
elif [ "$layout" = "us" ]; then
    echo "🇺🇸"
fi
