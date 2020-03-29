#!/bin/bash
pro=$(system76-power graphics)

intel="intel"
hybrid="hybrid"
nvidia="nvidia"
# check current
if [[ $pro  == *"intel"* ]]; then
   intel="${intel} (Current)"
fi
if [[ $pro  == *"hybrid"* ]]; then
   hybrid="${hybrid} (Current)"
fi
if [[ $pro  == *"nvidia"* ]]; then
   nvidia="${nvidia} (Current)"
fi
# select and apply
selection="${intel}\n ${hybrid}\n ${nvidia}"
profile=$(echo -e "$selection" | rofi -dmenu)
newprofile=$(system76-power graphics $profile)
notify-send "$newprofile"