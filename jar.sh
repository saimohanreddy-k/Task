#!/bin/bash

# Absolute path to your Eureka Server JAR
JAR_PATH="/root/HRMS/EurekaServer/target/Eureka-Server-0.0.1-SNAPSHOT.jar"

# Log directory relative to Eureka's location
LOG_DIR="/root/HRMS/EurekaServer/logs"
LOG_FILE="$LOG_DIR/eureka.log"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Start Eureka Server and redirect logs
echo "Starting Eureka Server from $JAR_PATH ..."
nohup java -jar "$JAR_PATH" > "$LOG_FILE" 2>&1 &

# Capture and show the process ID
PID=$!
echo "Eureka Server started with PID $PID"
echo "Logs are being written to $LOG_FILE"

