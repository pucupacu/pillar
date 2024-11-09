#!/bin/bash

# ==============================================================================
# Configuration
COMPOSE_FILE="docker/docker-compose.yml"

# ==============================================================================
# Function to display usage
function usage() {
    echo "Usage: $0 [--rebuild] [--cleanup]"
    echo "Options:"
    echo "  --rebuild   Rebuild the Docker image and restart the container using docker-compose"
    echo "  --cleanup   Stop and remove all containers, networks, and volumes for the service"
    exit 1
}

# Check for valid arguments
if [[ $# -gt 1 ]]; then
    usage
fi

# Handle script options
case "$1" in
    --rebuild)
        echo "Rebuilding and restarting services..."
        docker-compose -f $COMPOSE_FILE down
        docker-compose -f $COMPOSE_FILE build --no-cache
        docker-compose -f $COMPOSE_FILE up -d
        ;;
    --cleanup)
        echo "Cleaning up..."
        docker-compose -f $COMPOSE_FILE down --rmi all --volumes --remove-orphans
        yes | docker image prune
        echo "Cleanup complete."
        exit 0
        ;;
    "")
        echo "Starting services..."
        docker-compose -f $COMPOSE_FILE up -d
        ;;
    *)
        usage
        ;;
esac

# Show containers status
docker-compose -f $COMPOSE_FILE ps
