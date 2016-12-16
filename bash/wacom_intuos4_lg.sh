#!/bin/bash

if [ -e /home/italic/.intuos_dual ]
then

  xsetwacom --set "Wacom Intuos4 8x13 stylus" MapToOutput "HEAD-0"
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Area 0 2032 65024 38608
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Button 3 2
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Button 2 3
  xsetwacom --set "Wacom Intuos4 8x13 stylus" TabletPCButton on
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Mode Absolute

  xsetwacom --set "Wacom Intuos4 8x13 eraser" MapToOutput "HEAD-0"
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Area 0 2032 65024 38608
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Button 3 2
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Button 2 3
  xsetwacom --set "Wacom Intuos4 8x13 eraser" TabletPCButton on
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Mode Absolute

  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 1 "key super i"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 2 "key ctrl z"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 3 "key ctrl shift z"

  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 8 "key e"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 9 "key x"

  rm /home/italic/.intuos_dual
  touch /home/italic/.intuos_single

  echo "Mapping to Screen 1"

elif [ -e /home/italic/.intuos_single ]
then

  xsetwacom --set "Wacom Intuos4 8x13 stylus" MapToOutput "desktop"
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Area 0 11176 65024 29464
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Button 3 2
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Button 2 3
  xsetwacom --set "Wacom Intuos4 8x13 stylus" TabletPCButton on
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Mode Absolute

  xsetwacom --set "Wacom Intuos4 8x13 eraser" MapToOutput "desktop"
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Area 0 11176 65024 29464
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Button 3 2
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Button 2 3
  xsetwacom --set "Wacom Intuos4 8x13 eraser" TabletPCButton on
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Mode Absolute

  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 1 "key super i"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 2 "key ctrl z"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 3 "key ctrl shift z"

  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 8 "key e"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 9 "key x"

  rm /home/italic/.intuos_single
  touch /home/italic/.intuos_dual

  echo "Mapping to desktop"

else

  xsetwacom --set "Wacom Intuos4 8x13 stylus" MapToOutput "desktop"
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Area 0 11176 65024 29464
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Button 3 2
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Button 2 3
  xsetwacom --set "Wacom Intuos4 8x13 stylus" TabletPCButton on
  xsetwacom --set "Wacom Intuos4 8x13 stylus" Mode Absolute

  xsetwacom --set "Wacom Intuos4 8x13 eraser" MapToOutput "desktop"
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Area 0 11176 65024 29464
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Button 3 2
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Button 2 3
  xsetwacom --set "Wacom Intuos4 8x13 eraser" TabletPCButton on
  xsetwacom --set "Wacom Intuos4 8x13 eraser" Mode Absolute

  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 1 "key super i"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 2 "key ctrl z"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 3 "key ctrl shift z"

  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 8 "key e"
  xsetwacom --set "Wacom Intuos4 8x13 pad" Button 9 "key x"

  touch /home/italic/.intuos_dual

  echo "Mapping to desktop"

fi
