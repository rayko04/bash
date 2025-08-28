#!/usr/bin/env bash

LOG_DIR="/home/ryan/codin/bash/SysMonScript/logs"

mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/$(date +%F_%H-%M-%S).log"


{
	
	echo "==== SYS STATS: $(date) ===="
	echo ""
	echo ">> Uptime:"
	uptime
	echo ""
	echo ">> Memory:"
	free -h
	echo ""
	echo ">> Disk:"
	df -h
	echo ""
	echo ">> Top 5 processes by memory:"
	ps aux --sort=-%mem | head -n 6

} >> "$LOG_FILE"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
if (( $(echo "$CPU > 70.0" | bc -l) )); then
	echo "HIGH CPU: $CPU%" >> "$LOG_FILE"
fi

echo "logs saved in $LOG_FILE"
