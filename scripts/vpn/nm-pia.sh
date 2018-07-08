#!/bin/bash

while true
do
    if ! [[ `ifconfig tun0 2>/dev/null | grep RUNNING` ]]
    then
        nmcli conn up "$@"
    fi
    nmcli conn show --active
    sleep 1
done
