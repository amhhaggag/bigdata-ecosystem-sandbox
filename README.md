# bigdata-ecosystem-sanbox
BES (Bigdata Ecosystem Sandbox) is an all-in-one development and learning environment designed to simplify the exploration, experimentation, and development of big data technologies.

# Prerequisites

- Docker & Docker Compose
- RAM: 10 GB
- CPU: 4 Cores
- Storage: 40 GB

# Sandbox Components

This platform contains the following tools:

- PostgreSQL
- MinIO
- Hadoop
- Hive
- Spark
- Trino
- NiFi
- Kafka
- Flink
- Iceberg
- Airflow

# Repository Components
- bes-cleanup.sh: to stop and remove all the running containers
- bes-setup.sh: to setup and start all the sandbox components
- Command Line Tool for the Sandbox
    - bes-linux-amd64: CLI Tool for linux users
    - bes-macos-arm64: CLI Tool for MAC Users with ARM Processor
    - bes-windows-amd64: CLI Tool for Windows Users
- docker-compose.yml: The YAML file that contains all the containers
- updates.md: a Markdown File for logging the updates on the Sandbox

# Getting Started

### Setup ALL the Sandbox Tools

“Make sure that you have enough CPU and RAM”

To Setup all the sandbox tools use the following script

```bash
git clone https://github.com/amhhaggag/bigdata-ecosystem-sandbox.git
cd bigdata-ecosystem-sandbox

./bes-setup.sh
```

This command will do the following:
1. Add the Trino Configurations to it’s specific mounted volume (Local Directory)
2. Create and Start all the containers


# Currently Working On
- Building a Command Line Interface for the Sandbox.

# Future Plans for the Sandbox
- Adding the Following Tools
   - MongoDB
   - Druid
   - Superset
   - Atlas
   - Hue
  
Let's Connect if you are interested!

