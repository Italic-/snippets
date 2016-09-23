#!/bin/bash

ls > list.txt

grep "\.mkv" list.txt | while read line
do
	echo "$line" | ffmpeg -i $line -c:v libx264 -preset veryslow -c:a copy -c:s copy c-$line
done
