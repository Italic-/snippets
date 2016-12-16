#!/bin/bash

if [ -e /home/italic/.cintiq_dual ]
then

  xsetwacom --set "Wacom Cintiq 13HD stylus" MapToOutput "HEAD-1"
  xsetwacom --set "Wacom Cintiq 13HD stylus" Area 700 400 58752 33748
  xsetwacom --set "Wacom Cintiq 13HD stylus" Button 3 2
  xsetwacom --set "Wacom Cintiq 13HD stylus" Button 2 3
  xsetwacom --set "Wacom Cintiq 13HD stylus" TabletPCButton on
  xsetwacom --set "Wacom Cintiq 13HD stylus" Mode Absolute
  xsetwacom --set "Wacom Cintiq 13HD stylus" Suppress 8
  xsetwacom --set "Wacom Cintiq 13HD stylus" RawSample 6

  xsetwacom --set "Wacom Cintiq 13HD eraser" MapToOutput "HEAD-1"
  xsetwacom --set "Wacom Cintiq 13HD eraser" Area 700 400 58752 33748
  xsetwacom --set "Wacom Cintiq 13HD eraser" Button 3 2
  xsetwacom --set "Wacom Cintiq 13HD eraser" Button 2 3
  xsetwacom --set "Wacom Cintiq 13HD eraser" TabletPCButton on
  xsetwacom --set "Wacom Cintiq 13HD eraser" Mode Absolute
  xsetwacom --set "Wacom Cintiq 13HD eraser" Suppress 8
  xsetwacom --set "Wacom Cintiq 13HD eraser" RawSample 6

  xsetwacom --set "Wacom Cintiq 13HD pad" Button 1 "key super c"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 2 "key ctrl z"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 3 "key ctrl shift z"

  xsetwacom --set "Wacom Cintiq 13HD pad" Button 8 "key e"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 9 "key x"

  rm /home/italic/.cintiq_dual
  touch /home/italic/.cintiq_single

  echo "Mapping to Screen 2 and 13HD"

elif [ -e /home/italic/.cintiq_single ]
then

  xsetwacom --set "Wacom Cintiq 13HD stylus" MapToOutput "desktop"
  xsetwacom --set "Wacom Cintiq 13HD stylus" Area 800 8981 58752 24867
  xsetwacom --set "Wacom Cintiq 13HD stylus" Button 3 2
  xsetwacom --set "Wacom Cintiq 13HD stylus" Button 2 3
  xsetwacom --set "Wacom Cintiq 13HD stylus" TabletPCButton on
  xsetwacom --set "Wacom Cintiq 13HD stylus" Mode Absolute
  xsetwacom --set "Wacom Cintiq 13HD stylus" Suppress 8
  xsetwacom --set "Wacom Cintiq 13HD stylus" RawSample 6

  xsetwacom --set "Wacom Cintiq 13HD eraser" MapToOutput "desktop"
  xsetwacom --set "Wacom Cintiq 13HD eraser" Area 800 8981 58752 24867
  xsetwacom --set "Wacom Cintiq 13HD eraser" Button 3 2
  xsetwacom --set "Wacom Cintiq 13HD eraser" Button 2 3
  xsetwacom --set "Wacom Cintiq 13HD eraser" TabletPCButton on
  xsetwacom --set "Wacom Cintiq 13HD eraser" Mode Absolute
  xsetwacom --set "Wacom Cintiq 13HD eraser" Suppress 8
  xsetwacom --set "Wacom Cintiq 13HD eraser" RawSample 6

  xsetwacom --set "Wacom Cintiq 13HD pad" Button 1 "key super c"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 2 "key ctrl z"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 3 "key ctrl shift z"

  xsetwacom --set "Wacom Cintiq 13HD pad" Button 8 "key e"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 9 "key x"

  rm /home/italic/.cintiq_single
  touch /home/italic/.cintiq_dual

  echo "Mapping to desktop"

else

  xsetwacom --set "Wacom Cintiq 13HD stylus" MapToOutput "desktop"
  xsetwacom --set "Wacom Cintiq 13HD stylus" Area 800 8981 58752 24867
  xsetwacom --set "Wacom Cintiq 13HD stylus" Button 3 2
  xsetwacom --set "Wacom Cintiq 13HD stylus" Button 2 3
  xsetwacom --set "Wacom Cintiq 13HD stylus" TabletPCButton on
  xsetwacom --set "Wacom Cintiq 13HD stylus" Mode Absolute
  xsetwacom --set "Wacom Cintiq 13HD stylus" Suppress 8
  xsetwacom --set "Wacom Cintiq 13HD stylus" RawSample 6

  xsetwacom --set "Wacom Cintiq 13HD eraser" MapToOutput "desktop"
  xsetwacom --set "Wacom Cintiq 13HD eraser" Area 800 8981 58752 24867
  xsetwacom --set "Wacom Cintiq 13HD eraser" Button 3 2
  xsetwacom --set "Wacom Cintiq 13HD eraser" Button 2 3
  xsetwacom --set "Wacom Cintiq 13HD eraser" TabletPCButton on
  xsetwacom --set "Wacom Cintiq 13HD eraser" Mode Absolute
  xsetwacom --set "Wacom Cintiq 13HD eraser" Suppress 8
  xsetwacom --set "Wacom Cintiq 13HD eraser" RawSample 6

  xsetwacom --set "Wacom Cintiq 13HD pad" Button 1 "key super c"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 2 "key ctrl z"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 3 "key ctrl shift z"

  xsetwacom --set "Wacom Cintiq 13HD pad" Button 8 "key e"
  xsetwacom --set "Wacom Cintiq 13HD pad" Button 9 "key x"

  touch /home/italic/.cintiq_dual

  echo "Mapping to desktop"

fi
