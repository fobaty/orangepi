#!/bin/bash
        temp="55" # Устанавливаем какую хотим поддерживать температуру
        while true; do
        realtemp=`cat /sys/class/thermal/thermal_zone0/temp`
        str2="${realtemp%???}"
        if [ "$str2" -gt "$temp" ]
        then
        #echo "1" > /sys/class/gpio/gpio1/value
        gpio write 1 1 
        else
        #echo "0" > /sys/class/gpio/gpio1/value
        gpio write 1 0
        fi
        sleep 15 # Устанавливаем как часто будем снимать показания температуры
        done
