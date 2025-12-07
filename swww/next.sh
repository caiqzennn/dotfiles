#!/bin/bash

WALL_DIR="$HOME/Imagens/wallpapers"
STATE_DIR="$HOME/.cache/swww"
LAST="$STATE_DIR/last_wall.txt"
HISTORY="$STATE_DIR/history.txt"

mkdir -p "$STATE_DIR"

# Escolhe um wallpaper aleatório
WALL=$(ls "$WALL_DIR" | shuf -n 1)

# Salva o atual no histórico e como último
echo "$WALL" >> "$HISTORY"
echo "$WALL" > "$LAST"

# Aplica o wallpaper
swww img "$WALL_DIR/$WALL" \
    --transition-type fade \
    --transition-duration 1 \
    --transition-fps 60
