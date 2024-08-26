#!/bin/bash
user=$(eval echo ~$USER)
# Define wallpaper path
wallpaper_exist="/.config/wallpapers/"
wallpaper_path="${user}${wallpaper_exist}"

# Get all wallpapers
wallpapers=($(ls -1 "${wallpaper_path}" | sort))

# Insert first wallpaper to cycle
wallpapers+=(${wallpapers[0]})

# Get current wallpaper
current=$(hyprctl hyprpaper listactive)
current=$(basename "${current}")

# Cycle wallpapers
for (( i=0; i<${#wallpapers[@]}; i++ )); do
    if [[ "${wallpapers[i]}" == "${current}" ]]; then
        wall_path="${wallpaper_path}${wallpapers[i+1]}"
        hyprctl hyprpaper preload "${wall_path}"
        hyprctl hyprpaper wallpaper ",${wall_path}"
        hyprctl hyprpaper unload unused
        break
    fi
done

