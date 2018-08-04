#!/bin/sh
    echo "1" > /sys/class/gpio/export
    # echo "out" > /sys/class/gpio/gpio1/direction
    gpio mode 1 out
    /home/pi/temp.sh &
