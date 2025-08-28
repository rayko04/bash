# 👥 BatchUser — Bulk Linux User Creation Script

`BatchUser` is a Bash script that reads a list of usernames from a file and creates them as system users. It logs whether each user was created or already existed.

This script is useful for sysadmins, instructors, or anyone who needs to create multiple user accounts efficiently on a Linux system.

---

## 📂 What It Does

- Reads usernames from a file (`user.txt`)
- Checks if each user already exists
- Creates missing users with `useradd -m` (home directory included)
- Logs all actions to `userCreationLog.txt`

---

