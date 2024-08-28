#!/bin/bash

# function to check network connectivity 
check_connectivity() {
    echo "checking network connectivity..."
    ping -c 4 google.com > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        echo "Network is up."
    else 
        echo "Network is down"
    fi 

    echo ""
}

# function to monitor bandwidth 
monitor_bandwidth() {
    echo "monitoring bandwidth..."
    ifstat -t 1 1 | awk 'NR==3{print "recieved: " $6 " KB/s, Transmitted: " $8 " KB/s"}'
    echo ""
}

# function to chec device status 
check_device_status() {
    echo -a | awk '{print "Device: " $1 ", IP: " $2 ", MAC: " $4}'
    echo ""
}

# generate report
generate_report() {
    echo "network report"
    echo "===================="
    check_connectivity
    monitor_bandwidth
    check_device_status
    echo "===================="
}

generate_report