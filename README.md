# Pet Care Microservice Infrastructure with Docker Swarm

This repository contains a Docker Compose configuration for deploying a microservice-based architecture using Docker Swarm. It includes services for PostgreSQL, Kafka, Zookeeper, Redis, and multiple Spring Boot-based microservices. The goal is to handle everything in one Docker Compose file, including the creation of necessary databases and environment configuration.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Services Overview](#services-overview)
- [Environment Variables](#environment-variables)
- [Setup and Deployment](#setup-and-deployment)
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

The following environment variables should be defined as env variables:

- `DB_PASSWORD`: Password for PostgreSQL database.
- `DB_USER`: Username for PostgreSQL.
- `DB_NAME`: The name of the PostgreSQL database.
- `REDIS_PASSWORD`: Password for Redis.

## Environment Variable File

Set and load .env file before running docker compose
Linux/macOS: source .env
Windows (PowerShell): Get-Content .env | foreach { $key, $value = $_ -split '='; [System.Environment]::SetEnvironmentVariable($key, $value) }

## Single Host Docker Compose

Start service
docker-compose --project-name petcare-stack up

Stop services
docker compose -f .\petcare_docker-compose.yml down

## Docker Swarm Docker Compose