#!/usr/bin/env bash

output_log=~/codin/bash/output
error_log=~/codin/bash/error

count=0

while true
do
	((count++))

	n=$(( RANDOM % 100 ))

 	if [[ n -eq 42 ]]; then
    		echo "Something went wrong" | tee -a "$error_log"
    		echo "The error was using magic numbers" >> "$error_log"
		echo "Total runs before failure: $count" | tee -a "$output_log"
    		exit 1
 	fi

 	echo "Everything went according to plan" >> "$output_log"

done
