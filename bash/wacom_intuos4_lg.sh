#!/bin/bash

# Screen dimensions: 1920 x 1080 (16:9)
# Tablet dimensions: 65024 x 40640 (16:10)
# XY: 0 2032 65024 38608

# Screen: 3840 x 1080 (3.5556) horizontal side-by-side
# Tablet: 65024 x 18288 (3.5556)
# XY: 0 11176 65024 29464

# Screen: 3000 x 1920 (1.5625) horizontal + vertical
# Tablet: 63500 x 40640 (1.5625)
# XY: 762 0 64262 40640


AREA_SINGLE="0 2032 65024 38608"
AREA_HH="0 11176 65024 38608"
AREA_HV="762 0 64262 40640"

_set() {
	xsetwacom --set "Wacom Intuos4 8x13 stylus" Button 3 2
	xsetwacom --set "Wacom Intuos4 8x13 stylus" Button 2 3
	xsetwacom --set "Wacom Intuos4 8x13 stylus" TabletPCButton on
	xsetwacom --set "Wacom Intuos4 8x13 stylus" Mode Absolute

	xsetwacom --set "Wacom Intuos4 8x13 eraser" Button 3 2
	xsetwacom --set "Wacom Intuos4 8x13 eraser" Button 2 3
	xsetwacom --set "Wacom Intuos4 8x13 eraser" TabletPCButton on
	xsetwacom --set "Wacom Intuos4 8x13 eraser" Mode Absolute

	xsetwacom --set "Wacom Intuos4 8x13 pad" Button 1 "key super i"
	xsetwacom --set "Wacom Intuos4 8x13 pad" Button 2 "key ctrl z"
	xsetwacom --set "Wacom Intuos4 8x13 pad" Button 3 "key ctrl shift z"

	xsetwacom --set "Wacom Intuos4 8x13 pad" Button 8 "key e"
	xsetwacom --set "Wacom Intuos4 8x13 pad" Button 9 "key x"
}

set_to_single() {
	xsetwacom --set "Wacom Intuos4 8x13 stylus" MapToOutput "HEAD-0"
	xsetwacom --set "Wacom Intuos4 8x13 stylus" Area ${AREA_SINGLE}

	xsetwacom --set "Wacom Intuos4 8x13 eraser" MapToOutput "HEAD-0"
	xsetwacom --set "Wacom Intuos4 8x13 eraser" Area ${AREA_SINGLE}

	_set

	rm /home/italic/.intuos_dual
	touch /home/italic/.intuos_single
}

set_to_desktop() {
	xsetwacom --set "Wacom Intuos4 8x13 stylus" MapToOutput "desktop"
	xsetwacom --set "Wacom Intuos4 8x13 stylus" Area ${AREA_HV}

	xsetwacom --set "Wacom Intuos4 8x13 eraser" MapToOutput "desktop"
	xsetwacom --set "Wacom Intuos4 8x13 eraser" Area ${AREA_HV}

	_set

	rm /home/italic/.intuos_single
	touch /home/italic/.intuos_dual
}

if [ -e /home/italic/.intuos_dual ]; then
	set_to_single
else
	set_to_desktop
fi
