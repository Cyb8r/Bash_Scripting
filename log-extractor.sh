#!/bin/bash

LOG_FILE="your log file"

# function to extract errors 
extract_errors() {
    echo "Extracting errors"
    grep -i "error" $LOG_FILE > errors.log
    echo "errors extracted to errors.log"
}

# function to extact warnings 
extract_warnings() {
    echo "Extracting warnings....."
    grep -i "warning" $LOG_FILE > warnings.log
    echo "extracting warnings to warnings.log"
}

# generate log analysis report 
generate_report() {
    echo "log analysis report"
    echo "======================="
    extract_errors
    extract_warnings
    echo "========================"
}

generate_report