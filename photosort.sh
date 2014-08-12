#!/bin/bash

# Iterate through all files in directory and place images in directory based on date of capture.
for f in *.*
	do
	# Extract image creation date
	d=$(identify.exe -verbose "$f" | grep DateTimeOriginal | awk -F " " '{print $2}')
	if [ -z "$d" ]
		# If original capture date isn't available, get modification date
		then d=$(identify.exe -verbose "$f" | grep "modify" | awk -F " " '{print $2}' | awk -F "T" '{print $1}')
	fi
	# Check that $d is a valid string.
	if [ -n $d ]
		# Create date string, replacing colons for hyphens. I.e. YYYY-MM-DD
		then dir=$(echo $d | sed 's/:/-/g')"/"
		# If not $d not valid, give up and make $dir="unknown/"
		else dir="unknown/"
	fi
	echo $f","$dir
	# Create directory based on capture/modification date.
	mkdir -p $dir
	# Move file to date-based directory
	mv -v "$f" "$dir"
done

# Create directory structure and organised sorted images.
# E.g. ~/PhotoDir/ YYYY / MM / YYYY-MM-DD / *.jpg
# I think this is self-explanatory.
for dir in *-*-*
	do
	year=$(echo $dir | awk -F "-" '{print $1}')"/"
	month=$(echo $dir | awk -F "-" '{print $2}')"/"
	newdir=$year$month
	if [ -n $newdir ]
		then mkdir -p $newdir
	fi
	mv -v "$dir" "$newdir"
done

