## healthcheck.sh is a simple Bash script that performs a quick system health check and logs key system metrics — such as CPU, memory, disk usage, uptime, and service status — to a log file named healthlog.txt with timestamps.

This script is useful for basic system monitoring, troubleshooting, or automating routine checks on Linux systems.



## Features

 1.Displays system date and time

 2.Shows system uptime

 3.Reports CPU load

 4.Shows memory usage (free -m)

 5.Displays disk usage (df -h)

 6.Lists top 5 memory-consuming processes

7.Checks if critical services (e.g. nginx, ssh) are running

8.Logs all output to healthlog.txt with a timestamp  


Example Output.

==================== System Health Check - 2025-10-24 14:32:12 ====================
Date & Time:
Fri Oct 24 14:32:12 UTC 2025

Uptime:
 14:32:12 up 2 days,  5:47,  2 users,  load average: 0.05, 0.03, 0.00

CPU Load:
Load Average: 0.05, 0.03, 0.00

Memory Usage (in MB):
              total        used        free      shared  buff/cache   available
Mem:           7852        1834        4248          86        1769        5632
Swap:          2047           0        2047

Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   20G   28G  42% /

Top 5 Memory-Consuming Processes:
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root       102  0.3  5.4 155892  4324 ?        Ss   Oct22   0:20 /usr/sbin/sshd
...

Service Status:
nginx: running
ssh: running

===========================================================================



Usage Instructions
1.Create or copy the script

Create the file:

nano healthcheck.sh



2.Make it executable (if inside Linux filesystem)
chmod +x healthcheck.sh


If you’re using WSL and the file is inside /mnt/c/..., just run it with:

bash healthcheck.sh

3.Run the script
./healthcheck.sh


or

bash healthcheck.sh

4.View the log
cat healthlog.txt


Each run appends a new entry with a timestamp.

## Requirements

Linux or WSL (Windows Subsystem for Linux)

bash

uptime, free, df, ps, and systemctl commands available (default on most Linux systems)

Optional: nginx, ssh (or replace with other service names)



## Sample Log File

A sample healthlog.txt is included to show the expected output format.

## Author

Veeresh
Created for system health monitoring and shell scripting practice.





Git repo 


https://github.com/Veereshshrikanths/Healthcheck.git