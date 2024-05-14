#!/bin/zsh

autoload -Uz colors
colors

# get_battery returns remaining battery
get_battery() {
    local current_bat percentage
    local _battery_info _max_cap _cur_cap

    if (( $+commands[pmset] )); then
        current_bat="$(pmset -g ps | grep -o '[0-9]\+%' | tr -d '%')"
    elif (( $+commands[ioreg] )); then
        _battery_info="$(ioreg -n AppleSmartBattery)"
        _max_cap="$(echo "$_battery_info" | awk '/MaxCapacity/{print $5}')"
        _cur_cap="$(echo "$_battery_info" | awk '/CurrentCapacity/{print $5}')"
        current_bat="$(awk -v cur="$_cur_cap" -v max="$_max_cap" 'BEGIN{ printf("%.2f\n", cur/max*100) }')"
    fi

    # trim dot (e.g., 79.61 -> 79)
    percentage="${current_bat%%.*}"
    if [[ -n $percentage ]]; then
        echo "$percentage%"
    fi
}

# is_charging returns true if the battery is charging
is_charging() {
    if (( $+commands[pmset] )); then
        pmset -g ps | grep -E "Battery Power|charged" &>/dev/null
        return $status
    elif (( $+commands[ioreg] )); then
        ioreg -c AppleSmartBattery | grep "IsCharging" | grep -q "Yes"
        return $status
    else
        return 1
    fi
}

# battery_color_ansi colourizes the battery level for the terminal
battery_color_ansi() {
    local percentage
    percentage="${1:-$(get_battery)}"

    if is_charging; then
        if [[ -n $percentage ]]; then
            print "$fg[green]$percentage$reset_color"
        fi
    else
        # percentage > BATTERY_DANGER
        if [[ "${percentage%%%*}" -ge "$BATTERY_DANGER" ]]; then
        # if (( ${percentage%%%*} >= $BATTERY_DANGER )); then
            print "$fg[blue]$percentage$reset_color"
        else
            print "$fg[red]$percentage$reset_color"
        fi
    fi
}

# battery_color_tmux colourizes the battery level for tmux
battery_color_tmux() {
    local percentage
    percentage="${1:-$(get_battery)}"

    if is_charging; then
        [[ -n $percentage ]] && echo -e "#[fg=colour46]${percentage}#[default]"
    else
        # percentage > BATTERY_DANGER
        # if [ "${percentage%%%*}" -ge "$BATTERY_DANGER" ]; then
        # if (( ${percentage%%%*} >= $BATTERY_DANGER )); then
        if [[ "${percentage%%%*}" -ge "$BATTERY_DANGER" ]]; then
            echo -e "#[fg=blue]${percentage}#[default]"
        else
            echo -e "#[fg=red]${percentage}#[default]"
        fi
    fi
}

get_remain() {
    local time_remain itte
    local -i ret=0

    if (( $+commands[pmset] )); then
        time_remain="$(pmset -g ps | grep -o '[0-9]\+:[0-9]\+')"
        if [ -z "$time_remain" ]; then
            time_remain="no estimate"
            ret=1
        fi
    elif (( $+commands[ioreg] )); then
        itte="$(ioreg -n AppleSmartBattery | awk '/InstantTimeToEmpty/{print $5}')"
        time_remain="$(awk -v remain="$itte" 'BEGIN{ printf("%dh%dm\n", remain/60, remain%60) }')"
        if [ -z "$time_remain" ] || [ "${time_remain%%h*}" -gt 10 ]; then
            time_remain="no estimate"
            ret=1
        fi
    else
        time_remain="no estimate"
        ret=1
    fi

    echo "$time_remain"
    return $ret
}

while (( $#argv > 0 ))
do
    case "$argv[1]" in
        -h|--help)
            ;;
        --ansi)
            battery_color_ansi "$(get_battery)"
            ;;
        --tmux)
            battery_color_tmux "$(get_battery)"
            ;;
        --remain)
            get_remain
            ;;
        --level)
            # If the current_bat is less than the BATTERY_DANGER,
            # output color will be red
            BATTERY_DANGER=${argv[2]:?}
            if [[ $BATTERY_DANGER != <-> ]]; then
                BATTERY_DANGER=20
            fi
            shift
            ;;
        -*|--*)
            echo "$argv[1]: unknown option" >&2
            return 1
            ;;
        *)
            get_battery
    esac
    shift
done

return $status
