#!/usr/bin/env bash

userf="user.txt"
logt="userCreationLog.txt"

if [[ ! -f $userf ]]; then
    echo "file not found"
    exit 1
fi

while read -r username; do

    [[ -z "$username" ]] && continue

    if id "$username" &>/dev/null; then
            echo "$(date): User $username exists." >> "$logt"
    else

        sudo useradd -m "$username" && echo "$(date): User $username added." >> "$logt"
    fi

done < $userf    

echo "user creation done. check $logt"
