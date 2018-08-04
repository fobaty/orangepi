# orangepi
Air cooling Raspberry pi or Orange pi
Воздушное охлаждение Raspberry pi или Orange pi

cd ~
Создаем файл
touch temp.sh

Добавляем в него код, уплавление через gpio 1
nano temp.sh

#!/bin/bash
        temp="55" # Устанавливаем какую хотим поддерживать температуру
        while true; do
        realtemp=`cat /sys/class/thermal/thermal_zone0/temp`
        str2="${realtemp%???}"
        if [ "$str2" -gt "$temp" ]
        then
        gpio write 1 1 
        #echo "1" > /sys/class/gpio/gpio1/value
        else
        gpio write 1 0
        #echo "0" > /sys/class/gpio/gpio1/value
        fi
        sleep 10 # Устанавливаем как часто будем снимать показания температуры
        done
        
Даем права на выполнение 
chmod 774 /home/pi/temp.sh

Создаем файл
touch gpio.sh

Добавляем в него код
nano gpio.sh

        #!/bin/sh
        echo "1" > /sys/class/gpio/export
        # echo "out" > /sys/class/gpio/gpio1/direction
        gpio mode 1 out
        /home/pi/temp.sh &

Даем права на выполнение 
chmod 774 /home/pi/gpio.sh

Добавляем в автозагрузку пользователь pi

sudo nano /etc/*rc.local
    /home/pi/gpio.sh
    
имейте ввиду, что он должен быть добавлен до строки
exit 0
