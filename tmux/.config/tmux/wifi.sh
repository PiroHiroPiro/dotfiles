#!/bin/zsh
#
# @(#) wifi v0.2.0 2015-09-24
#
# usage:
#   wifi [-h|--help]
#
# description:
#   show the wifi information (strength, bandwidth, SSID)
#
######################################################################

# Use: Put something this in your .tmux.conf file
# set-option -g status-right: '#(wifi -c tmux)'
#
# ▁▂▃▅▇

# if ! is_osx; then
#     echo "wifi: require OS X" 1>&2
#     exit 1
# fi

# airport command is executable file
#
# Usage:
#   Search information about Wi-Fi by using airport command
#   airport command has this options
#    -c[<arg>] --channel=[<arg>]    Set arbitrary channel on the card
#    -z        --disassociate       Disassociate from any network
#    -I        --getinfo            Print current wireless status, e.g. signal info, BSSID, port type etc.
#    -s[<arg>] --scan=[<arg>]       Perform a wireless broadcast scan.
#                                      Will perform a directed scan if the optional <arg> is provided
#    -x        --xml                Print info as XML
#    -P        --psk                Create PSK from specified pass phrase and SSID.
#                                      The following additional arguments must be specified with this command:
#                                     --password=<arg>  Specify a WPA password
#                                     --ssid=<arg>      Specify SSID when creating a PSK
#    -h        --help               Show this help
#

# The Unicode Block Elements
# | Unicode | Block |           Name             |    Note    |
# |:-------:|:-----:|:--------------------------:|:----------:|
# |  2580   |  ▀    | UPPER HALF BLOCK           |            |
# |  2581   |  ▁    | LOWER ONE EIGHTH BLOCK     |            |
# |  2582   |  ▂    | LOWER ONE QUARTER BLOCK    |            |
# |  2583   |  ▃    | LOWER THREE EIGHTHS BLOCK  |            |
# |  2584   |  ▄    | LOWER HALF BLOCK           |            |
# |  2585   |  ▅    | LOWER FIVE EIGHTHS BLOCK   |            |
# |  2586   |  ▆    | LOWER THREE QUARTERS BLOCK |            |
# |  2587   |  ▇    | LOWER SEVEN EIGHTHS BLOCK  |            |
# |  2588   |  █    | FULL BLOCK                 | →25A0(■)   |
# |  2589   |  ▉    | LEFT SEVEN EIGHTHS BLOCK   |            |
# |  258A   |  ▊    | LEFT THREE QUARTERS BLOCK  |            |
# |  258B   |  ▋    | LEFT FIVE EIGHTHS BLOCK    |            |
# |  258C   |  ▌    | LEFT HALF BLOCK            |            |
# |  258D   |  ▍    | LEFT THREE EIGHTHS BLOCK   |            |
# |  258E   |  ▎    | LEFT ONE QUARTER BLOCK     |            |
# |  258F   |  ▏    | LEFT ONE EIGHTH BLOCK      |            |
# |  2590   |  ▐    | RIGHT HALF BLOCK           |            |
#
signals=(▂ ▅ ▇)

# Get the wifi information
info=$(system_profiler SPAirPortDataType)
if [[ ${#info[@]} -eq 0 ]]; then
    echo "offline"
    exit 1
fi

# cut out a needed information from the info
ssid=$(echo $info | awk '/Current Network Information:/{getline; gsub(/^ +|:$/, ""); print $0; exit}')   # wifi ssid name
rssi=$(echo $info | awk '/Signal \/ Noise:/{gsub(/ dBm/, ""); print $4; exit}')                          # strength of wifi wave
rate=$(echo $info | awk '/Transmit/' | sed 's/[^0-9]//g')                                                # bandwidth of wifi wave

# Determine the signal from rssi of wifi
signal=""
j=1
# for ((j = 1; j <= "${#signals[@]}"; j++))
while (( $j <= $#signals ))
do
    # reference of strength (rssi)
    #  -20　Excellent
    #  -30　Excellent
    #  -40　Excellent
    #  -50　Excellent
    #  -60　better
    #  -70　good
    #  -80　not good
    #  -90　bad
    # -100　bad
    if ((  $j == 1 && $rssi > -100 )) ||
        (( $j == 2 && $rssi > -80  )) ||
        (( $j == 3 && $rssi > -50  )); then
        # make signal
        signal="${signal}${signals[$j]} "
    else
        signal="${signal}  "
    fi
    (( j++ ))
done

# If the wifi rate (wifi bandwidth) is unavailable,
if [ "$rate" = 0 ]; then
    echo "no_wifi"
    exit 1
fi

# Outputs wifi
#   example: "fun-wifi 351Mbs ▂ ▅   "
print "${ssid} ${rate}Mbs ${signal}"
