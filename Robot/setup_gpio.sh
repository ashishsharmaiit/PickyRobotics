#!/bin/bash

sudo usermod -aG gpio $USER
sudo chown root.gpio /dev/gpiochip0
sudo chown root.gpio /dev/gpiochip1
sudo chmod 660 /dev/gpiochip0
sudo chmod 660 /dev/gpiochip1


