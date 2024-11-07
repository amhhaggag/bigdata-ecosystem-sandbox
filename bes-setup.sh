#!/bin/bash

# Function to start services with Docker Compose
start_services() {
    echo "Starting services with Docker Compose..."

    # Bring up each service from the compose directory
    docker compose up -d minio
    docker compose up -d namenode datanode nodemanager resourcemanager historyserver
    docker compose up -d hive-metastore hive-server
    docker compose up -d spark-master spark-worker
    docker compose up -d trino
    docker compose up -d nessie
    docker compose up -d airflow-db airflow
    docker compose up -d jobmanager taskmanager
    docker compose up -d kafka schema-registry postgresql conduktor-console conduktor-monitoring
    docker compose up -d nifi-zookeeper nifi
    
    echo "All services started successfully."
}

echo "Starting setup..."

# Start the services
start_services


echo "changing the permission of ./mnt directory"
mkdir -p ./mnt
chmod -R 777 ./mnt

echo "Setup completed successfully."

