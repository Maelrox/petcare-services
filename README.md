# Pet Care Microservice Infrastructure with Docker Swarm

This repository contains a Docker Compose configuration for deploying a microservice-based architecture using Docker Swarm. It includes services for PostgreSQL, Kafka, Zookeeper, Redis, Nginx and multiple Spring Boot-based microservices. The goal is to handle everything in one Docker Compose file, including the creation of necessary databases and environment configuration.

It is still under construction...

## Table of Contents

- [Prerequisites](#prerequisites)
- [Services Overview](#services-overview)
- [Environment Variables](#environment-variables)
- [Setup and Deployment](#setup-and-deployment)
    - [Single Host Deployment](#single-host-deployment)
    - [Docker Swarm Deployment](#docker-swarm-deployment)
- [Microservice Dockerfile](#microservice-dockerfile)
- [Scaling the Services](#scaling-the-services)
- [Troubleshooting](#troubleshooting)

## Prerequisites

Before running the Docker Compose configuration, make sure you have the following installed:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)
- Docker Swarm (Optional, for orchestration): [Docker Swarm Overview](https://docs.docker.com/engine/swarm/)

## Services Overview

This setup deploys the following services:

1. **PostgreSQL**: A relational database service with automatic database creation if the database does not exist.
2. **Kafka**: A distributed event streaming platform, used for messaging between services.
3. **Zookeeper**: A coordination service for managing Kafka brokers.
4. **Redis**: An in-memory data structure store, used for caching.
5. **Microservices**: Spring Boot-based microservices, each with its own Dockerfile and environment configuration.

### Microservices

Each microservice (e.g., `petcare-appointment`, `petcare-management`) will run a Spring Boot application using a `.jar` file. The services depend on PostgreSQL and Redis for data storage and caching.

## Environment Variables

The following environment variables should be defined:

- `DB_PASSWORD`: Password for PostgreSQL database
- `DB_USER`: Username for PostgreSQL
- `REDIS_PASSWORD`: Password for Redis

### Docker Swarm Deployment

1. Initialize Docker Swarm (if not already done):
```bash
docker swarm init
```

2. Create the required secrets:
```bash

# Set postgres secrets
echo "petcare_suite" | docker secret create db_name -
echo "db_admin" | docker secret create db_user -
echo "care_db_adm1N" | docker secret create db_password -

# Set redis secrets
echo "care_db_adm1N_." | docker secret create redis_password -
```

3. Deploy the stack:
```bash
docker stack deploy -c stack.yml petcare
```

4. Check deployment status:
```bash
docker stack ps petcare
docker service ls
```

If needed Remove the stack:
```bash
docker stack rm petcare
```

### Scaling and High Availability

From the main machine, you can:
- Add more nodes to provide high availability
- Modify the number of replicas of the services using:
```bash
docker service scale petcare_service-name=N
```
Where N is the desired number of replicas.

## Troubleshooting

If you encounter issues:

1. Check service logs:
```bash
docker service logs petcare_service-name
```

2. Verify service status:
```bash
docker stack services petcare
```

3. Inspect service details:
```bash
docker service inspect petcare_service-name
```
