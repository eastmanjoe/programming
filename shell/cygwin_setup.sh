#!/bin/bash
#
# create copy of image
#

clear

echo "Script to set-up Cygwin"
read -e -p "Please enter location of home (~): " home_folder

if [ "$(uname -s)" == "Linux" ]; then
    echo "You are running Linux, script not setup for that."

elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then

    # mkgroup -d -l > /etc/group
    # mkpasswd -d -l -p $home_folder > /etc/password


    lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg

    install apt-cyg /bin

    apt-cyg install wget

    apt-cyg install bash-completion cygutils git git-completion git-gui \
            inetutils libsqlite3-devel libxml2-devel libxslt-devel make \
            mintty nano ncurses openssh ping rxvt screen util-linux

    apt-cyg install openssl

    #setup python
    # ln -sf /cygdrive/c/Python27/python.exe /usr/bin/python
    # ln -s /cygdrive/c/Python27/mkvirtualenv.bat /usr/bin/mkvirtualenv
    # ln -s /cygdrive/c/Python27/lsvirtualenv.bat /usr/bin/lsvirtualenv
    # ln -s /cygdrive/c/Python27/rmvirtualenv.bat /usr/bin/rmvirtualenv
    # ln -s /cygdrive/c/Python27/workon.bat /usr/bin/workon
    # ln -s /cygdrive/c/Python27/deactivate.bat /usr/bin/deactivate
    # ln -s /cygdrive/c/Python27/add2virtualenv.bat /usr/bin/add2virtualenv

    # RVM requirements
    apt-cyg install patch openssl-devel libyaml-devel libyaml0_2 sqlite3 gcc-g++ \
                    gcc-core mingw64-i686-gcc-g++ mingw64-x86_64-gcc-g++ bison \
                    automake m4 autoconf libtool cygwin32-readline zlib-devel

    # install ruby
    curl -#L https://get.rvm.io | bash -s stable --autolibs=3 --ruby=1.9.3 --auto-dotfiles

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
fi
