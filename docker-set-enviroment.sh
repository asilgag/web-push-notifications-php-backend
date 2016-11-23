#!/bin/sh

BASHRC=~/.bashrc

# Load current enviroment variables
source $BASHRC

# Check $USER
if [ -z ${USER} ];
    then
        USER=`whoami`
        echo "export USER=\"$USER\"" >> $BASHRC
        echo "\$USER set to '$USER'";
    else
        echo "\$USER already set to '$USER'";
fi

# Check $USER_ID
if [ -z ${USER_ID} ];
    then
        USER_ID=`id -u $USER`
        echo "export USER_ID=\"$USER_ID\"" >> $BASHRC
        echo "\$USER_ID set to '$USER_ID'";
    else
        echo "\$USER_ID already set to '$USER_ID'";
fi

# Load new enviroment variables
source $BASHRC
