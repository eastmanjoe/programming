#!/bin/bash

# # This creates a ssh agent session automatically at startup

# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.

env="${HOME}/.ssh/agent.env"

# Note: Don't bother checking SSH_AGENT_PID. It's not used
#       by SSH itself, and it might even be incorrect
#       (for example, when using agent-forwarding over SSH).

agent_is_running() {
    if [ "$SSH_AUTH_SOCK" ]; then
        # ssh-add returns:
        #   0 = agent running, has keys
        #   1 = agent running, no keys
        #   2 = agent not running
        ssh-add -l >/dev/null 2>&1 || [ $? -eq 1 ]
    else
        false
    fi
}

agent_has_keys() {
    ssh-add -l >/dev/null 2>&1
}

agent_load_env() {
    . "$env" >/dev/null
}

agent_start() {
    (umask 077; ssh-agent >"$env")
    . "$env" >/dev/null
}

if ! agent_is_running; then
    agent_load_env
fi

# if your keys are not stored in ~/.ssh/id_rsa or ~/.ssh/id_dsa, you'll need
# to paste the proper path after ssh-add
if ! agent_is_running; then
    agent_start
    ssh-add
elif ! agent_has_keys; then
    ssh-add
fi

unset env

if [ "$(uname -s)" == "Linux" ]; then
    echo "You are running Linux"
    # source /usr/bin/virtualenvwrapper.sh

elif [ "$(expr substr $(uname -s) 1 6)" == "CYGWIN" ]; then

    if [ "$(hostname)" == "dl-r9gg2gm" ]; then
        # system variables
        JOE4710='root@10.11.50.63'
        NETBOOK='jeastman@jeastman-Aspire-one'

        net_use_status=$(net use U: | grep "Status")
        # Output of above command
        # net_use_status=Status            Disconnected
        # net_use_status=Status            OK

        if [ "$(expr substr "$net_use_status" 19 2)" != "OK" ] && [ "$(expr substr "$net_use_status" 19 2)" != "Di" ]; then
            net use U: '\\arcturus\home\jeastman'
            net use
        fi

        unset net_use_status

        # set PATH so it includes the campbellsci compilers
        CS_COMPILE="/cygdrive/c/Campbellsci/Lib/Compilers"

        if [ -d ${CS_COMPILE} ] ; then
            PATH="$PATH:${CS_COMPILE}"
        fi

        # set path to include campbell sci 200 compilers
        CS_COMPILE_200="/cygdrive/c/Campbellsci/Lib/CR200Compilers"

        if [ -d ${CS_COMPILE_200} ] ; then
            PATH="$PATH:${CS_COMPILE_200}"
        fi

        PATH="$PATH:$HOME/daft/lib/daft"

        export WORKON_HOME=$HOME/.venvs
        export PIP_VIRTUALENV_BASE=$WORKON_HOME
        source /usr/bin/virtualenvwrapper.sh
    fi
fi


