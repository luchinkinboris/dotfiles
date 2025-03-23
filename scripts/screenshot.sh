#!/bin/bash

# Папка для сохранения скриншотов
SCREENSHOT_DIR="$HOME/Images/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Генерация имени файла
FILENAME="$SCREENSHOT_DIR/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

# Выбор области и создание скриншота
grim -g "$(slurp)" "$FILENAME"

# Уведомление о завершении
if [ -f "$FILENAME" ]; then
    notify-send "Скриншот сохранён" "$FILENAME"
else
    notify-send "Скриншот не сделан" "Операция отменена"
fi
