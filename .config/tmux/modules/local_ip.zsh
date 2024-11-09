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

    if [[ $interfaces = "all" || $interfaces = "wifi" ]]; then
        if [[ $platform = "Darwin" ]]; then
            wifi=$(ipconfig getifaddr en0)
        elif [[ $platform = "Linux" ]]; then
            wifi=$(ifconfig | grep wl -A1 | grep inet | xargs | cut -d" " -f2)
        fi
    fi
        
    if [[ $interfaces = "all" || $interfaces = "ethernet" ]]; then
        if [[ $platform = "Darwin" ]]; then
            ethernet=$(ipconfig getifaddr en1)
        elif [[ $platform = "Linux" ]]; then
            ethernet=$(ifconfig | grep en -A1 | grep inet | xargs | cut -d" " -f2)
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
    else
        output=$(echo $output | xargs)
        echo "[$output]"
    fi
}

show_local_ip $1 $2
