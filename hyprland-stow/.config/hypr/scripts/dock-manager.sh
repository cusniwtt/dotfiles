#!/bin/sh

# Init dock
nwg-dock-hyprland -i 36 -w 5 -nolauncher -p right -r -mr 10 &
# Init Status dock
DOCK=true

check_active() {
    CURRENT_STATE=$(hyprctl activewindow -j | jq ".fullscreen")    # 0=Not, 2=Full
    # Dock is ON
    if [ "$DOCK" = true ]; then
        if [ "$CURRENT_STATE" = "2" ]; then
            nwg-dock-hyprland  # ON -> OFF
            DOCK=false
        fi
    # Dock is OFF
    else
        if [ "$CURRENT_STATE" = "0" ] || [ "$CURRENT_STATE" = "null" ]; then
            nwg-dock-hyprland  # OFF -> ON
            DOCK=true
        fi
    fi
}

handle() {
    case $1 in
        activewindowv2*) check_active;;
        fullscreen*) check_active;;
        workspacev2*) check_active;;
    esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do 
    handle "$line"; 
done

# Exit dock
pkill -f nwg-dock-hyprland
