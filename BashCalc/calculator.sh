#!/usr/bin/env bash

calc(){
	if [[ $# -ne 3	]]; then
		echo "Usage: calc <num1> <num2> <oper>"
		return 1
	fi

	case $3 in
		+) echo "Result: $(($1 + $2))" ;;
		-) echo "Result: $(($1 - $2))" ;;
		\*) echo "Result: $(($1 * $2))" ;;
		/)
			if [[ $2 -eq 0 ]]; then
				echo "Div by Zero"
			else
				echo "Result: $(echo "scale=2; $1 / $2" | bc)"
			fi
			;;
		*) echo "inavlid operation" ;;
	esac
}
