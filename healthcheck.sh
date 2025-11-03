#!/bin/bash
# healthcheck.sh - System Health Check Script
LOGFILE="healthlog.txt"
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

echo "==================== System Health Check - $TIMESTAMP ====================" >> "$LOGFILE"

echo "Date & Time:" >> "$LOGFILE"
date >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "Uptime:" >> "$LOGFILE"
uptime >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "CPU Load:" >> "$LOGFILE"
uptime | awk -F'load average:' '{ print "Load Average:" $2 }' >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "Memory Usage (in MB):" >> "$LOGFILE"
free -m >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "Disk Usage:" >> "$LOGFILE"
df -h >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "Top 5 Memory-Consuming Processes:" >> "$LOGFILE"
ps aux --sort=-%mem | head -n 6 >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "Service Status:" >> "$LOGFILE"
for service in nginx ssh; do
    if systemctl is-active --quiet $service; then
        echo "$service: running" >> "$LOGFILE"
    else
        echo "$service: NOT running" >> "$LOGFILE"
    fi
done
echo "" >> "$LOGFILE"

echo "===========================================================================" >> "$LOGFILE"
echo "" >> "$LOGFILE"

echo "✅ Health check complete! Results logged to $LOGFILE"
