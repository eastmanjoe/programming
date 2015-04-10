#!/bin/bash
#
# create copy of image
#

clear

echo "Utility to create SD card from image"
echo "Please enter image filename:"
read dd_if

filesize=$(stat -c%s $dd_if)

lsblk

echo "Please enter drive:"
read drive

echo "Please enter dd options:"
read dd_options

dd if=$dd_if | pv --size $filesize | dd of=$drive $dd_options