import os
import subprocess

# Get all wallpapers
wallpaper_path = '/home/cusniwtt/.config/wallpapers/'
wallpapers = sorted(os.listdir(wallpaper_path))
wallpapers.insert(len(wallpapers), wallpapers[0])   # Insert first wallpaper to cycle

# get current wallpapers
current = subprocess.run(['hyprctl', 'hyprpaper', 'listactive'], stdout=subprocess.PIPE)
current = current.stdout.decode()
current = current.split('/')[-1]    # Get current wallpaper
os.system('pwd')

# Cycle wallpapers
for i in range(len(wallpapers)):
    if wallpapers[i] in current:
        wall_path = wallpaper_path+wallpapers[i+1]
        os.system('hyprctl hyprpaper unload all')
        os.system(f'hyprctl hyprpaper preload {wall_path}')
        os.system(f'hyprctl hyprpaper wallpaper ",{wall_path}"')
        os.system('hyprctl hyprpaper unload unused')
        break;
