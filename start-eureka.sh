#!/bin/bash

# Define paths
PROJECT_DIR="/root/HRMS/EurekaServer"
JAR_NAME="Eureka-Server-0.0.1-SNAPSHOT.jar"
JAR_PATH="$PROJECT_DIR/target/$JAR_NAME"

# Build the Eureka JAR
cd "$PROJECT_DIR" || exit
mvn clean package -DskipTests

# Check if JAR was built successfully
if [ ! -f "$JAR_PATH" ]; then
  echo "❌ Build failed or JAR not found at $JAR_PATH"
  exit 1
fi

# Create systemd service for Eureka
sudo tee /etc/systemd/system/eureka.service > /dev/null <<EOF
[Unit]
Description=Eureka Server
After=network.target

[Service]
User=root
ExecStart=/usr/bin/java -jar $JAR_PATH
SuccessExitStatus=143
Restart=always
RestartSec=5
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and start Eureka
sudo systemctl daemon-reload
sudo systemctl enable eureka
sudo systemctl start eureka

# Show Eureka status
sudo systemctl status eureka --no-pager

