#!/bin/bash
if [ -z $1 ]; then exit 1; fi
t="$1"
a=($(echo "$t" | tr '.' ' '))
pos=$(( ${#a[@]} - 1 ))
last=${a[$pos]}
IFS=$'\n'
echo -n '{"data":['
for s in ${a[@]}; do
    PORT=$(ss -nap | grep LISTEN | grep -w "*:$s" | awk '{print $5}' | sed 's/*://g')
    if [[ $s == $last ]]
    then
        echo -n '{"{#PORT}":"'${PORT}'"}'
        break
    else
        echo -n '{"{#PORT}":"'${PORT}'"},'
    fi
done
echo -n ']}'
unset IFS
