#!/bin/zsh

# You can set the global env with the following:
# export PUBLIC_IP_ADDRESS=$(curl --silent https://checkip.amazonaws.com)

ICON_IP_ADDRESS="󱚻"

function show_public_ip() {
    local show_icon=$1
    local icon=$ICON_IP_ADDRESS

    if [[ -z $PUBLIC_IP_ADDRESS ]]; then
        echo ""
    else
        if [[ -z $show_icon ]]; then
            echo "[$PUBLIC_IP_ADDRESS]"
        else
          echo "[$icon $PUBLIC_IP_ADDRESS]"
        fi
    fi
}

show_public_ip $1
