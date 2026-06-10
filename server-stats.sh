echo "##########"
echo "Server Perfomance Stats"
echo "##########"
echo
cpu=$(top -b -n 1 | grep "%Cpu(s)" | awk '{print 100 - $8}')
free=$(top -b -n 1 | grep "MiB Mem" | awk '{print $6, $7}')
used=$(top -b -n 1 | grep "MiB Mem" | awk '{print $8, $9}'
)
usedDisk=$(df -h | grep "nvme0n1p9" | awk '{print $3}'
)
avaliableDisk=$(df -h | grep "nvme0n1p9" | awk '{print $4}'
)
top5CPU=$(ps aux --sort=-%cpu | head -n 5)
top5MEM=$(ps aux --sort=-%mem | head -n 5)

echo "Total CPU Usage: $cpu%"
echo "Used RAM Space: $used"
echo "Free RAM Space: $free"
echo "Avaliable Disk Space: $avaliableDisk"
echo "Used Disk Space: $usedDisk"
echo
echo "Top 5 Processes By CPU Usage: "
echo "##########"
echo "$top5CPU"
echo "##########"
echo
echo "Top 5 Processes By Memory Usage: "
echo "##########"
echo "$top5MEM"
echo "##########"
