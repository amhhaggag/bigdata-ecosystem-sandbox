#!/bin/bash

# Function to pull Docker images
pull_images() {
    echo "Pulling Docker images..."

    docker pull amhhaggag/hadoop-base-3.1.1:1.0
    docker pull amhhaggag/hive-base-3.1.2:1.0
    docker pull amhhaggag/spark-3.5.1:1.0

    echo "Docker images pulled successfully."
}

# Function to start services with Docker Compose
start_services() {
    echo "Starting services with Docker Compose..."

    # Bring up each service from the compose directory
    docker compose up -d minio
    docker compose up -d --build namenode datanode nodemanager resourcemanager historyserver
    docker compose up -d --build hive-metastore hive-server
    docker compose up -d spark-master spark-worker
    docker compose up -d trino
    docker compose up -d nessie
    docker compose up -d airflow-db airflow
    docker compose up -d jobmanager taskmanager
    docker compose up -d kafka schema-registry postgresql conduktor-console conduktor-monitoring
    docker compose up -d nifi-zookeeper nifi
    
    echo "All services started successfully."
}

# Function to execute SQL file inside PostgreSQL container
execute_postgres_sql() {
    
    echo "Starting Postgres docker container ...\n"
    docker compose up -d postgres
    
    sleep 15

    echo "Preparing the PostgreSQL container...\n"

    # Define the container name
    CONTAINER_NAME="postgres"

    # Define the database name, user, and password
    DB_NAME="odp_db"
    DB_USER="admin"
    DB_PASSWORD="admin"

    # First, create the database (cannot run inside a transaction block)
    docker exec -i $CONTAINER_NAME psql -U $DB_USER -c "CREATE DATABASE metastore;"
 
    # SQL statements to execute
    SQL_STATEMENTS="
    CREATE USER hive WITH PASSWORD 'hive';
    GRANT ALL PRIVILEGES ON DATABASE metastore TO hive;
    ALTER DATABASE metastore OWNER TO hive;
    "

    # Execute the SQL statements inside the PostgreSQL container
    docker exec -i $CONTAINER_NAME psql -U $DB_USER -c "$SQL_STATEMENTS"

    echo "postgres preparation is completed successfully."
}

# Function to create the ./mnt/trino directory and copy configuration files
setup_trino_directory() {
    echo "Setting up Trino configuration directory..."

    # Create the directory if it doesn't exist
    if [ ! -d "./mnt/trino" ]; then
        mkdir -p ./mnt/trino
        echo "./mnt/trino directory created."
    fi

    # Copy the configuration files
    cp -r ./conf/trino/* ./mnt/trino/

    echo "Configuration files copied to ./mnt/trino."
}

# Main script execution
echo "Starting setup..."

# Pull the images
pull_images

# Execute SQL file in PostgreSQL container
execute_postgres_sql

# Set up the Trino configuration directory
setup_trino_directory

# Start the services
start_services

echo "adding bes cli to the path"
mv ./bes /usr/local/bin

echo "changing the permission of ./mnt directory"
mkdir -p ./mnt
chmod -R 777 ./mnt

echo "Setup completed successfully."

