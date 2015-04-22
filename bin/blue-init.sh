#!/usr/bin/bash

sudo hciconfig hci0 up
sudo systemctl start bluetooth.service

#sudo bluetoothctl

bluetooth-sendto

