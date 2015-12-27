#!/bin/bash

server="NIVIDIA_PC_IP" #Have to be replaced

while [ "$game" != "q" ]
do
    clear

    i=1
    output=$(moonlight list "$server")
    while read -r line;
    do
	echo "$line"
    	games[i]=${line##*. }
	i=$(( $i + 1 ))
    done <<< "$output"

    read -p "Please select a game: " selected

    game=${games[selected]}

    echo "Starting \"$game\" on \"$server\"..."
    params="-app \"$game\" $server"

    $(moonlight stream -1080 -60fps -app "$game" "$server")
    $(moonlight quit "$server")
done
