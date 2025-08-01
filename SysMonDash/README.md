# 🖥️ SysMonDash - Bash System Monitor Dashboard

A lightweight Bash-based system monitoring tool that logs CPU, RAM, and disk usage with alerts, interactive controls, and log rotation.

---

## 📋 Features

-  **Threshold Alerts** with `notify-send` or console fallback  
-  **CSV Logging** of CPU, RAM, and Disk usage  
-  **Timed Logging** via customizable intervals and durations  
-  **Log Rotation**: Compress logs older than 7 days, delete logs older than 30  
-  **Interactive Menu**:  
  - View logs  
  - Re-run logging  
  - Exit gracefully  
-  Written in pure Bash — no dependencies beyond basic Linux tools

---

## ⚙️ Configuration

You can tweak thresholds and timing inside the script:

```bash
CPU_THRESHOLD=90
RAM_THRESHOLD=80
DISK_THRESHOLD=85

LOG_INTERVAL=30     # Seconds between each log
LOG_DURATION=60     # Total seconds to run logging

DISK_PARTITION="/dev/sda2"   # Partition to monitor

