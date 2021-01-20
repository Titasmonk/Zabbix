#!/bin/bash
if [ -z $1 ]; then exit 1; fi
if [ -z "$3" ]
then
    REMOTEHOST=${1}
    t="$2"
    a=($(echo "$t" | tr '.' ' '))
    pos=$(( ${#a[@]} - 1 ))
    last=${a[$pos]}
    TIMEOUT=1
    IFS=$'\n'
    echo -n '{"data":['
    for s in ${a[@]}; do
        if nc -w $TIMEOUT -z $REMOTEHOST $s; then
            if [[ $s == $last ]]
            then
                echo -n '{"{#PORT}":"'${s}'"}'
                break
            else
                echo -n '{"{#PORT}":"'${s}'"},'
            fi
        else
            if [[ $s == $last ]]
                then
                    echo -n '{"{#PORT}":"''"}'
                    break
                else
                    echo -n '{"{#PORT}":"''"},'
                fi
        fi
    done
    echo -n ']}'
    unset IFS
else
    REMOTEHOST=${1}
    REMOTEPORT=${2}
    TIMEOUT=1
    if nc -w $TIMEOUT -z $REMOTEHOST $REMOTEPORT; then
        echo "0"
    else
        echo "1"
    fi
fi