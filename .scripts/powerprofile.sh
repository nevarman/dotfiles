#!/bin/bash
pro=$(system76-power profile)

battery="battery"
balanced="balanced"
performance="performance"
# check current
if [[ $pro  == *"Battery"* ]]; then
   battery="${battery} (Current)"
fi
if [[ $pro  == *"Balanced"* ]]; then
   balanced="${balanced} (Current)"
fi
if [[ $pro  == *"Performance"* ]]; then
   performance="${performance} (Current)"
fi
# select and apply
selection="${battery}\n ${balanced}\n ${performance}"
profile=$(echo -e "$selection" | rofi -dmenu)
newprofile=$(system76-power profile $profile)
notify-send "$newprofile" -u low