#!/bin/bash

# Function to stop all running containers
stop_containers() {
    echo "Stopping all running Docker containers..."
    docker stop $(docker ps -q)

    if [ $? -eq 0 ]; then
        echo "All containers stopped successfully."
    else
        echo "Failed to stop containers."
        exit 1
    fi
}

# Function to remove all containers
remove_containers() {
    echo "Removing all Docker containers..."
    docker rm $(docker ps -a -q)

    if [ $? -eq 0 ]; then
        echo "All containers removed successfully."
    else
        echo "Failed to remove containers."
        exit 1
    fi
}

# Main script execution
echo "Starting to stop and remove all containers..."

# Stop containers
stop_containers

# Remove containers
remove_containers

echo "All containers stopped and removed successfully."

