# orangepi
Air cooling Raspberry pi or Orange pi 
<br>Воздушное охлаждение Raspberry pi или Orange pi

<br>cd ~
<br>Создаем файл<
<br>touch temp.sh

<br>Добавляем в него код, уплавление через gpio 1

<br>nano temp.sh

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
        
<br>Даем права на выполнение 
<br>chmod 774 /home/pi/temp.sh

<br>Создаем файл
<br>touch gpio.sh

<br>Добавляем в него код
<br>nano gpio.sh

        #!/bin/sh
        echo "1" > /sys/class/gpio/export
        # echo "out" > /sys/class/gpio/gpio1/direction
        gpio mode 1 out
        /home/pi/temp.sh &

<br>Даем права на выполнение 
<br>chmod 774 /home/pi/gpio.sh

<br>Добавляем в автозагрузку пользователь pi

<br>sudo nano /etc/*rc.local
  <br>  /home/pi/gpio.sh
    
<br>имейте ввиду, что он должен быть добавлен до строки
<br>exit 0
