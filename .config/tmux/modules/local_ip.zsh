#!/bin/zsh

# You can set the global env with the following:
# export PUBLIC_IP_ADDRESS=$(curl --silent https://checkip.amazonaws.com)

ICON_WIFI="󱚻"
ICON_ETHERNET="󱞒"

function show_local_ip() {
    local show_icon=$1
    local interfaces=${2:-all}
 
    local wifi=""
    local ethernet=""
    local platform=$(uname)

    if [[ $platform = "Darwin" ]]; then
        if [[ $interfaces = "all" || $interfaces = "wifi" ]]; then
            wifi=$(ipconfig getifaddr en0)
        fi
        
        if [[ $interfaces = "all" || $interfaces = "ethernet" ]]; then
            ethernet=$(ipconfig getifaddr en1)
        fi
    fi

    local output=""

    if [[ ! -z $wifi ]]; then
        if [[ -z $show_icon ]]; then
            output="$wifi "
        else
            output="$ICON_WIFI $wifi "
        fi
    fi

    if [[ ! -z $ethernet ]]; then
         if [[ -z $show_icon ]]; then
            output="$output$ethernet"
        else
            output="$output$ICON_ETHERNET $ethernet"
        fi
    fi

    if [[ -z $output ]]; then
        echo ""
    fi

    output=$(echo $output | xargs)
    echo "[$output]"
}

show_local_ip $1 $2
