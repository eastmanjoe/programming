#!/bin/bash
#
# create copy of image
#

clear

echo "Utility to create SD card from image"
read -e -p "Please enter image filename: " dd_if

filesize=$(stat -c%s $dd_if)
echo -e "\n"

echo "The available drives are:"
lsblk
echo -e "\n"

read -e -p "Please enter location to write file: " dd_of

echo "Please select from dd option or enter your own"
echo "1: bs=32M conv=fsync -- Used for TS-4710 image duplication"
read -e -p "Please enter dd options: " dd_options

if [ $dd_options == "1" ]; then
	dd_options="bs=32M conv=fsync"
fi

echo -e "\n"
echo "Image file is: $dd_if"
echo "Image filesize is: $filesize"
echo "Image is to be copied to: $dd_of"
echo "DD options are: $dd_options"
echo -e "\n"
echo -e "The command to be executed is:\n dd if=$dd_if | pv --size $filesize | dd of=$dd_of $dd_options"
echo -e "\n"

read -p "proceed? (y|n): " proceed

proceed=${proceed,,}

if [[ $proceed == "y" ]] || [[ $proceed == "yes" ]]; then
    read -p "zero card? (y|n): " zero

    if [[ $zero == "y" ]] || [[ $zero == "yes" ]]; then
        dd if=/dev/zero | pv --size $(lsblk -bnido SIZE $dd_if) | dd of=$dd_of bs=32M
    fi

    echo -e "\n"
    dd if=$dd_if | pv --size $filesize | dd of=$dd_of $dd_options
else
    echo "Exiting script"
    exit 0
fi
