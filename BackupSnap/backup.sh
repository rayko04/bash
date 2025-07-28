#!/bin/bash

back(){

	if [[ ! -d $1 ]]; then
		echo "Directory not found"
	elif [[ ! -d $2 ]]; then
		echo "Destination not found"
	else
		backup_file="$2/backup_$(date +"%Y-%m-%d").tar.gz"
		tar -czvf $backup_file $1
		echo "Backup created: $backup_file (Size: $(du -h $backup_file | cut -f1))"
	fi
}
