#!/bin/bash
set -e

# Load secrets into environment variables
export POSTGRES_USER=$(cat /run/secrets/db_user)
export POSTGRES_PASSWORD=$(cat /run/secrets/db_password)

# Debugging: Confirm the environment variables are set (you can remove this later)
echo "POSTGRES_USER=$POSTGRES_USER"
echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD"  # Don't echo the actual password for security
if [ "$(id -u)" = "0" ]; then
    exec gosu postgres "$0" "$@"
fi
# Call the original PostgreSQL entrypoint (this starts PostgreSQL with the correct configuration)
exec $@