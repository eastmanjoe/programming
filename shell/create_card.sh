#!/bin/bash
#
# create copy of image
#

clear

echo "Utility to create SD card from image"
read -e -p "Please enter image filename: " dd_if

filesize=$(stat -c%s $dd_if)

lsblk

read -e -p "Please enter drive: " drive

read -e -p "Please enter dd options: " dd_options

echo "Image file is: $dd_if"
echo "Image filesize is: $filesize"
echo "Image is to be copied to: $drive"
echo "DD options are: $dd_options"

read -p "proceed? (y|n): " proceed

if [[ ${proceed,,} = "y" -o ${proceed,,} = "yes" ]]; then
    dd if=$dd_if | pv --size $filesize | dd of=$drive $dd_options
else
    echo "Exiting script"
    exit 0
fi
