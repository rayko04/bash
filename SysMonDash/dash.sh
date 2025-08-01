#!/usr/bin/env bash

# === CONFIG ===
CPU_THRESHOLD=90
RAM_THRESHOLD=80
DISK_THRESHOLD=85
LOG_INTERVAL=30
LOG_DURATION=60
DISK_PARTITION="/dev/sda2"


notify_user() {
	local msg="$1"

	if command -v notify-send > /dev/null 2>&1; then
		notify-send "System Alert" "$msg"
	else
		echo "ALERT: $msg"
	fi
}


cpu_usage() {
	
	CPU=$(top -bn1 | awk '/Cpu\(s\)/ {print $2 + $4}')	
	echo "$CPU"

	if echo "$CPU > $CPU_THRESHOLD" | bc -l | grep -q 1; then
		notify_user "CPU usage high: $CPU%"
	fi

}

ram_usage() {

	MEM_USED=$(free | awk '/Mem:/ {print $3}') 
	MEM_TOTAL=$(free | awk '/Mem:/ {print $2}')
	MEM_PER=$(echo "scale=2; ($MEM_USED / $MEM_TOTAL) * 100" | bc -l)

	if echo "$MEM_PER > $RAM_THRESHOLD" | bc -l | grep -q 1; then
		notify_user "MEMORY USAGE HIGH: $MEM_PER% used"
	fi

	echo "$MEM_PER"
}

disk_usage() {
	
	DISK=$(df | awk -v part="$DISK_PARTITION" '$1 == part {print $5}' | tr -d '%')
	if [[ "$DISK" -gt $DISK_THRESHOLD ]]; then
		notify_user "DISK USAGE HIGH: $DISK%"
	fi

	echo "$DISK"
}

process_mon() {
	echo "==== TOP 5 CPU CONSUMING PROCESS ===="
	ps aux --sort=-%cpu | head -n 6
	echo ""
}


logging_fun() {

	TIMESTAMP=$(date +%F_%T)
	CPU=$(cpu_usage)
	RAM=$(ram_usage)
	DISK=$(disk_usage)

	echo "$TIMESTAMP,$CPU,$RAM,$DISK" >> "$FILE"
	echo "Logged an entity in $FILE"
}

menu() {
	
	echo ""
	echo "Choose an option:"
	select OPTION in "Run Again" "View Logs" "Exit"; do
		case $REPLY in
			1) main; break ;;
			2) tail -n 20 "$FILE";;
			3) return ;;
			*) echo "Invalid" ;;
		esac
	done
}

rotate_logs() {
	find "$FILE_DIR" -name "*.csv" -mtime +7 -exec gzip {} \;
	find "$FILE_DIR" -name "*.csv.gz" -mtime +30 -exec rm {} \;
	echo "Logs Rotated"
}

main() {

	
	FILE_DIR="$HOME/codin/bash/SysMonDash/logs"
	mkdir -p "$FILE_DIR"

	rotate_logs

	FILE="$FILE_DIR/$(date +%F).csv"

	if [[ ! -f "$FILE" ]]; then
		echo "timestamp,cpu,ram,disk" > "$FILE"
	fi


	DURATION=$LOG_DURATION
	INTERVAL=$LOG_INTERVAL
	ELAPSED=0

	echo ""
	notify_user "Running SysMonDash"
	echo "Runnig SysMonDash..."
	while [[ $ELAPSED -lt $DURATION ]]; do
		logging_fun

		sleep $INTERVAL
		ELAPSED=$(($ELAPSED + $INTERVAL))
	done

	menu
}

main
