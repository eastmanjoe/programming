#!/bin/bash

# base-files version 4.1-1
# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benificial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_aliases file


# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color=always'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #
alias ls='ls -l --color=tty'
# alias exit=exit_func
alias fdisk=/usr/sbin/fdisk.exe
#
#user program shortcuts
alias npp=notepad++.exe
alias mintty='mintty.exe -i /Cygwin-Terminal.ico - &'
alias cmd='cygstart cmd.exe'
#
# git shortcuts
alias st='git st'
alias cim='git commit -m'
alias merge='git merge'
alias rebase='git rebase'
alias add='git add'
alias checkout='git checkout'
#
# Draker shortcuts
alias toDINTTEST_01='ssh root@10.11.50.67'
alias todiag='ssh -i ~/.ssh/ddsptidevkey.pem ubuntu@diagnostics.intelligentarray.com'
alias toVM='ssh -i ~/.ssh/vm_rsa jeastman@192.168.117.128'
# alias daft='ruby ~/daft/bin/daft'