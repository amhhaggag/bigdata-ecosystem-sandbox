# BES Tool Documentation

## Overview

BES is a simple command-line interface (CLI) tool designed to interact with Docker containers and Docker Compose services. This tool provides various functionalities, such as managing services (start, stop, etc.), viewing logs, running commands in containers, and more.

It works seamlessly with Docker Compose files and allows you to control individual services inside your docker-compose.yml file.

## Features

Manage services within a Docker Compose setup (start, stop, up -d, etc.).
List running Docker containers.
View logs for a specific container.
Run the Trino CLI in the trino container.
Execute commands in any running Docker container.
Prerequisites

Ensure that you have Docker and Docker Compose installed on your machine. You also need to have a valid docker-compose.yml file in the same directory or a known path containing the services you want to control.

## Usage

### 1. Manage Docker Containers
The service command allows you to manage services defined in your docker-compose.yml file. You can use this command to start, stop, or bring up services.

Start a Service

To start a service (e.g., trino), use the following command:

```bash
./bes service trino start
```

Stop a Service

To stop a service (e.g., trino), use the following command:

```bash
./bes service trino stop
```

Bring Up a Service in Detached Mode

To bring up a service in detached mode (e.g., trino), use:

```bash
./bes service trino up -d
```
### 2. List Running Docker Containers
The service command also has a --list option to list all running Docker containers. It uses docker container ls under the hood.

```bash
./bes service --list
```
This will display a table of running containers:

```bash
CONTAINER ID   NAMES       STATUS          PORTS
1234567890ab   trino       Up 5 minutes    8080/tcp
abcdef123456   minio       Up 10 minutes   9000/tcp, 9001/tcp
```
### 3. View Logs of a Running Docker Container
To view the logs of a specific Docker container, use the logs command followed by the service name:

```bash
./bes logs trino
```

### 4. Run the Trino CLI
If you have a Trino container and want to access the Trino CLI inside the container, you can use the trino-cli command:

```bash
./bes trino-cli
```

### 5. Execute Commands in a Running Docker Container
The exec command allows you to run a command inside a specific running Docker container. By default, it runs /bin/bash, but you can specify any command using the --command flag.

Run Bash in a Container

```bash
./bes exec trino
```
Run a Custom Command

You can also specify a custom command:

```bash
./bes exec trino --command "ls /usr/local"
```

## Conclusion

BES is a handy tool for managing Docker services via the command line, making it easier to start, stop, and interact with Docker Compose services. You can customize the tool further to suit your specific environment and services.
