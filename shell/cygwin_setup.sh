#!/bin/bash
#
# create copy of image
#

clear

echo "Script to set-up Cygwin"

if [ "$(uname -s)" == "Linux" ]; then
    echo "You are running Linux, script not setup for that."

elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then

    if [ -e /etc/group ] && [ -e ]


    # download apt-cyg
    lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg

    install apt-cyg /bin

    # install required packages for draker
    apt-cyg install wget
    apt-cyg install bash-completion cygutils git git-completion git-gui
    apt-cyg install inetutils libsqlite3-devel libxml2-devel libxslt-devel make
    apt-cyg install mintty nano ncurses openssh ping rxvt util-linux
    apt-cyg install openssl

    # install ruby
    apt-cyg install ruby

    # curl -#L https://get.rvm.io | bash -s stable --autolibs=3 --ruby=1.9.3 --auto-dotfiles
    wget
    # # set PATH to use windows python instead of cygwin python
    # # PYTHON_DIR="/cygdrive/c/Python27"

    # # if [ -d ${PYTHON_DIR} ] ; then
    # #     PATH=${PYTHON_DIR}:${PATH}
    # # fi

    # # source /cygdrive/c/Python27/Scripts/virtualenvwrapper.sh

    # # set PATH so it includes the campbellsci compilers
    # CS_COMPILE="/cygdrive/c/Campbellsci/Lib/Compilers"

    # if [ -d ${CS_COMPILE} ] ; then
    #     PATH=${CS_COMPILE}:${PATH}
    # fi

    # # set path to include campbell sci 200 compilers
    # CS_COMPILE_200="/cygdrive/c/Campbellsci/Lib/CR200Compilers"

    # if [ -d ${CS_COMPILE_200} ] ; then
    #     PATH=${CS_COMPILE_200}:${PATH}
    # fi
    else
        read -e -p "Please enter location of home (default: /home): " home_folder

        if [ -z "$home_folder"]; then
            home_folder = "/home"
        fi

        mkgroup -d -l > /etc/group
        mkpasswd -d -l -p $home_folder > /etc/password

        exit 0
    fi
fi
