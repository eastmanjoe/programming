#!/bin/bash

# Kill ssh-agent process on logout or exit
# if [ ${SSH_AGENT_PID+1} == 1 ]; then
if [ "$SSH_AUTH_SOCK" ]; then
    echo "Killing ssh-agent"
    ssh-add -D
    ssh-agent -k > /dev/null 2>&1
    unset SSH_AGENT_PID
    unset SSH_AUTH_SOCK
fi
