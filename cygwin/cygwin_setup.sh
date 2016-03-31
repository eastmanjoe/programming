#!/bin/bash
#
#

echo "Script to set-up Cygwin"

#Help info
help()
{
echo "Please enter an option"
echo "-i or --initial_install to setup cygwin for the domain and set the home drive"
echo "-c or --continue to install the required packages"
}

# setup home location
set_home()
{
    read -e -p "Please enter location of home (default: /home): " home_folder

    if [ -z "$home_folder"]; then
        home_folder = "/home"
    fi

    mkgroup -d -l > /etc/group
    mkpasswd -d -l -p $home_folder > /etc/password

    echo "Home folder set and cygwin setup for domain"
    echo "Exiting Script. Please restart Cygwin"
    echo "Rerun the setup script with the following command to continue"
    echo "cygwin_setup.sh -c"

    exit 0
}

# verify OS is Cygwin
check_os()
{
    if [ "$(uname -s)" == "Linux" ]; then
        echo "You are running Linux, script not setup for that. Exiting script"
        exit 0

    elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then
        echo "You are running Cygwin, script continuing."

    else
        echo "OS is unknown, script not setup for that. Exiting script"
        exit 0
    fi
}

# install the packages
install_packages()
{

    # download and install sage
    lynx -source rawgit.com/svnpenn/sage/master/sage > sage
    install sage /bin
    rm sage


    # install required packages
    # sage install wget
    sage install bash-completion cygutils git git-completion git-gui
    sage install inetutils libsqlite3-devel libxml2-devel libxslt-devel make
    sage install mintty nano ncurses openssh ping rxvt util-linux
    sage install openssl

    # install ruby
    sage install ruby rubygems

}

# add the CSI compilers to the cygwin PATH
set_CSI_compiler_path()
{
    echo -e "# set PATH so it includes the campbellsci compilers\n" >> .bashrc
    echo -e "\n" >> .bashrc
    echo -e 'CS_COMPILE="/cygdrive/c/Campbellsci/Lib/Compilers"\n' >> .bashrc
    echo -e "if [ -d ${CS_COMPILE} ] ; then\n" >> .bashrc
    echo -e "    PATH=${CS_COMPILE}:${PATH}\n" >> .bashrc
    echo -e "fi\n" >> .bashrc
    echo -e "\n" >> .bashrc

    # # set path to include campbell sci 200 compilers
    # CS_COMPILE_200="/cygdrive/c/Campbellsci/Lib/CR200Compilers"

    # if [ -d ${CS_COMPILE_200} ] ; then
    #     PATH=${CS_COMPILE_200}:${PATH}
    # fi
}


# main loop
if [[ $# = 0 ]];
then
    help
else
    while [[ $# > 0 ]]
    do
        key="$1"

        check_os

        case $key in
            -i|--initial_install)
            set_home
            shift # past argument
            ;;
            -c|--continue)
            install_packages
            shift
            ;;
                *)
            help
            shift
            ;;
        esac
        shift # past argument or value
    done
    source .bashrc
fi
