#!/bin/zsh

ICON_UPTIME="󰔟"

function show_uptime() {
    local show_icon=$1
    local icon=$ICON_UPTIME

    local up=$(uptime | cut -f 4-6 -d ' ' | cut -d',' -f1) 

    if [[ -z $show_icon ]]; then
        echo "[$up]"
    else
      echo "[$icon $up]"
    fi
}

show_uptime $1
