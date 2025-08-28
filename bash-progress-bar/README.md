# Progress Bar

> Based on code from [bahamas10/ysap](https://github.com/bahamas10/ysap/tree/main/code/2025-08-21-progress-bar).

An animated Progress Bar in bash.

---

## Features

- Displays progress as a **bar with filled and empty characters**.  
- Shows both **numerical progress** (`current/total`) and **percentage completed**.  
- Uses **ANSI escape codes** for coloring  
- Automatically scales to a **fixed bar length of 50 characters**, regardless of total value.  
- Updates **in place** (using `\r` carriage return) instead of printing new lines.  

