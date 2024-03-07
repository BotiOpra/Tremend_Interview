#!/bin/bash

FILENAME="/etc/passwd"
if [[ $(basename ${FILENAME}) != "passwd" ]]; then
    echo "Filename is not passwd"
else
    echo "Home directory: $HOME"
    echo "----------------------"
    user_count=0
    while IFS=: read -r username password userid groupid comment homedir cmdshell
    do
        echo "$username"
        ((user_count++))
    done < $FILENAME
    echo "----------------------"
    echo "Number of users: $user_count"
    echo "----------------------"
    read -p "Enter a username: " entered_username
    homedir=$( getent passwd ${entered_username} | cut -d: -f6 )
    echo "Home directory of user ${entered_username} is $homedir"
    echo "----------------------"
    id_lowerbound=1000
    id_upperbound=1010
    while IFS=: read -r username _ userid _ _ _ _; 
    do
        if [[ $userid -ge id_lowerbound && $userid -le id_upperbound ]]; then
            echo "$username, $userid"
        fi
    done < "$FILENAME"
    echo "----------------------"
    sed -e 's/\//\\/g' $FILENAME > passwd_backslash
    echo "File written with name passwd_backslash"
    echo "----------------------"
    echo Public IP: $(curl -s https://ipecho.net/plain)
    echo Private IP: $(hostname -I)
    echo "----------------------"
    su john -c 'echo $HOME'
fi

