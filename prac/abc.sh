#!/usr/bin/env bash

read -p "enter a num: " num

if (($num % 2)); then
	echo "$num is odd."
else 
	echo "$num is even."
fi
