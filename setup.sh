#!/bin/bash

# General
sudo apt-get install git
sudo apt-get install tmux

# I2C
./setup_i2c.sh

# Pi OLED
sudo apt-get install build-essential python-dev python-pip
sudo pip install RPi.GPIO
sudo apt-get install python-imaging python-smbus
git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git ~/bin
sudo python ~/bin/Adafruit_Python_SSD1306/setup.py install
sudo python ~/bin/Adafruit_Python_SSD1306/examples/stats.py

# Add cron job to run Pi OLED in Tmux session after every reboot
( crontab -l 2>/dev/null | grep -Fv ntpdate ; printf -- "@reboot ~/bin/piinit/pioled_tmux" ) | crontab
