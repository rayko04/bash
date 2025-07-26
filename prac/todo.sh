#!/bin/env bash

todo() {
    if [[ $# -ne 2 ]]; then
        echo "Invalid Command."
        echo "Usage: todo [path] [name]"
        return
    fi

    file="$1/$2.txt"
    
    [[ ! -e "$file.txt" ]] && touch "$file"
    
    while true; do
        echo "Choose an option:"
        echo "1) Add Task"
        echo "2) View Task"
        echo "3) Delete Task"
        echo "4) Replace Task"
        echo "5) Exit"

        read -rp "Enter choice: " choice

        case $choice in
            1) echo "Adding Task.."
                read -rp "  Enter a task: " task && echo "$task" >> "$file";; 
            2) echo "Viewing Task.."
                cat -n "$file";;
            3) echo "Deleting a Task.." 
                read -rp "  Select task no to delete: " toDel && sed -i "${toDel}d" "$file"
                echo "  Task no. $toDel deleted." ;; 
            4) echo "Replacing Task.." 
                read -rp "  Task no. to replace: " toRep 
                read -rp "  New task: " rtask && sed -i "${toRep}s/.*/${rtask}/" "$file";;
            5) echo "Exiting.." ; break ;;
            *) echo "Inavlid choice..Try again" ;;
        esac

        echo 
    done
}
