#!/bin/bash

# Ícones japoneses para cada workspace
icons=(火 水 風 空 雷)

# Descobre workspace ativo
active=$(hyprctl monitors -j | jq '.[0].activeWorkspace.id')

# Gera saída para Waybar
for i in {1..5}; do
    index=$((i-1))

    if [ "$i" -eq "$active" ]; then
        # Workspace ativo
        printf "{\"icon\":\"<span foreground='#ffffff'>%s</span>\"}\n" "${icons[$index]}"
    else
        # Inativos
        printf "{\"icon\":\"<span foreground='#777777'>%s</span>\"}\n" "${icons[$index]}"
    fi
done
