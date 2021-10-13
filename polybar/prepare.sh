#!/bin/bash

BATTERY=$(ls -1 /sys/class/power_supply/ | grep BAT)
ADAPTER=$(ls -1 /sys/class/power_supply/ | grep ACADAPTER)
