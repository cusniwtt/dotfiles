#!/bin/bash

pos="-2000"
current=$(hyprctl -j monitors | jq '.[1].x')

if [[ "$current" == "$pos" ]];
  then
    hyprctl keyword monitor DP-3,1920x1080@60,-1080x-200,1,transform,1
    echo "Attach Monitor"
  else
    hyprctl keyword monitor DP-3,1920x1080@60,-2000x-200,1,transform,1
    echo "Detach Monitor"
fi
