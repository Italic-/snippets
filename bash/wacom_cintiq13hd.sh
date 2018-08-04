#!/bin/bash

# Screen/Cintiq dimensions: 1920 x 1080 (1.7778)
# Tablet dimensions: 58052 x 33348 (1.7408)
# XY: 700 400 58752 33748

# Screen: 3840 x 1080 (3.5556) horizontal side-by-side
# Tablet: 65024 x 18288 (3.5556)
# XY: 800 8981 58752 24867

# Screen: 3000 x 1920 (1.5625) horizontal + vertical
# Tablet: 52106 x 33348 (1.5625)
# XY: 800 400 52906 33348


AREA_SINGLE="700 400 58752 33748"
AREA_HH="800 8981 58752 24867"
AREA_HV="800 400 52906 33348"

_set() {
	xsetwacom --set "Wacom Cintiq 13HD stylus" Button 3 2
	xsetwacom --set "Wacom Cintiq 13HD stylus" Button 2 3
	xsetwacom --set "Wacom Cintiq 13HD stylus" TabletPCButton on
	xsetwacom --set "Wacom Cintiq 13HD stylus" Mode Absolute
	xsetwacom --set "Wacom Cintiq 13HD stylus" Suppress 8
	xsetwacom --set "Wacom Cintiq 13HD stylus" RawSample 6

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
}

set_to_desktop() {
	xsetwacom --set "Wacom Cintiq 13HD stylus" MapToOutput "desktop"
	xsetwacom --set "Wacom Cintiq 13HD stylus" Area ${AREA_HV}

	xsetwacom --set "Wacom Cintiq 13HD eraser" MapToOutput "desktop"
	xsetwacom --set "Wacom Cintiq 13HD eraser" Area ${AREA_HV}

	_set

	rm $HOME/.cintiq_single
	touch $HOME/.cintiq_dual
}

set_to_single() {
	xsetwacom --set "Wacom Cintiq 13HD stylus" MapToOutput "HEAD-1"
	xsetwacom --set "Wacom Cintiq 13HD stylus" Area ${AREA_SINGLE}

	xsetwacom --set "Wacom Cintiq 13HD eraser" MapToOutput "HEAD-1"
	xsetwacom --set "Wacom Cintiq 13HD eraser" Area ${AREA_SINGLE}

	_set

	rm $HOME/.cintiq_dual
	touch $HOME/.cintiq_single
}

if [ -e $HOME/.cintiq_dual ]; then
	set_to_single
else
	set_to_desktop
fi
