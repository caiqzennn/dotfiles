#!/bin/bash

WALL_DIR="$HOME/Imagens/wallpapers"
STATE_DIR="$HOME/.cache/swww"
LAST="$STATE_DIR/last_wall.txt"
HISTORY="$STATE_DIR/history.txt"

# Se não existir histórico suficiente, sair
[ ! -f "$HISTORY" ] && exit 0

# Remove a última linha e pega o anterior
PREV=$(sed -e '$d' "$HISTORY" | tail -n 1)

# Se vazio, sair
[ -z "$PREV" ] && exit 0

# Atualiza o arquivo HISTORY removendo a última linha
sed -i '$d' "$HISTORY"

# Atualiza o último wallpaper
echo "$PREV" > "$LAST"

# Troca o wallpaper
swww img "$WALL_DIR/$PREV" \
    --transition-type fade \
    --transition-duration 1 \
    --transition-fps 60
