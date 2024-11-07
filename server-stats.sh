#!/bin/bash

echo '*****************************Server Stats*****************************'
# Total CPU Usage
top -bn1 | grep "Cpu(s)" | awk '{print "Total CPU Usage: " 100 - $8"%"}'

# Total Memory Usage
top -bn1 | grep "KiB Mem" | awk '{total=$3; used=$5; free=$7; used_percent=(used/total)*100; free_percent=(free/total)*100; printf "Total Memory Usage: Used: %.2f%%, Free: %.2f%%\n", used_percent, free_percent}'

# Total Disk Usage
df -h --total | grep 'total' | awk '{used=$3; free=$4; total=$2; used_percent=$5; printf "Total Disk Usage: Used: %s (%.2f%%), Free: %s\n", used, (used_percent+0), free}'

# Top 5 processes by CPU Usage
echo '\nTop 5 Processes By CPU USAGE'
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | awk 'BEGIN {print "+-----+----------------------+--------+"; print "| PID | COMMAND              | %CPU   |"; print "+-----+----------------------+--------+"} NR>1 {printf "| %-3s | %-20s | %-6s |\n", $1, $2, $3} END {print "+-----+----------------------+--------+"}'

# Top 5 processes by Mem Usage
echo '\nTop 5 Processes By MEMORY USAGE'
ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | awk 'BEGIN {print "+-----+----------------------+--------+"; print "| PID | COMMAND              | %MEM   |"; print "+-----+----------------------+--------+"} NR>1 {printf "| %-3s | %-20s | %-6s |\n", $1, $2, $3} END {print "+-----+----------------------+--------+"}'