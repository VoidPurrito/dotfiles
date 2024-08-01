#!/bin/zsh

# You can set the global env with the following:
# export PUBLIC_IP_ADDRESS=$(curl --silent https://checkip.amazonaws.com)

ICON_DATE_TIME="󰃰"

function show_date_time_utc() {
    local show_icon=$1
    local format=${2:-%Y-%m-%d %H:%M:%SZ}
    local icon=$ICON_DATE_TIME

    local datetime=$(date -u +$format) 

    if [[ -z $show_icon ]]; then
        echo "[$datetime]"
    else
      echo "[$icon $datetime]"
    fi
}

show_date_time_utc $1 $2
