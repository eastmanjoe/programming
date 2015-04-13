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

read -e -p "Please enter dd options: " dd_options

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

# simplifies the check below
# if [[ $proceed == "yes" ]]; then
#     proceed="y"
# fi

if [[ $proceed == "y" ]] || [[ $proceed == "yes" ]]; then
    read -p "zero card? (y|n): " zero

    if [[ $zero == "y" ]] || [[ $zero == "yes" ]]; then
        dd if=/dev/zero | pv --size $filesize | dd of=$dd_of $dd_options
    fi

    echo -e "\n"
    dd if=$dd_if | pv --size $filesize | dd of=$dd_of $dd_options
else
    echo "Exiting script"
    exit 0
fi
