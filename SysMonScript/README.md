# 🖥️ System Monitor Script

A simple Bash script that logs system resource usage — CPU, memory, disk space, and top memory-consuming processes — to timestamped log files. Great for practicing Bash scripting and basic system administration!

---

## 🚀 Features

- Logs:
  - CPU usage
  - Memory usage
  - Disk usage
  - Top 5 memory-heavy processes
- Saves logs with timestamped filenames
- Automatically creates a `logs/` directory
- Can be run manually or scheduled with `cron`
- Supports alerting when CPU usage exceeds a threshold (e.g., 70%)

---
