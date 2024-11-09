#!/bin/bash

# Container and image names for reusability
CONTAINER_NAME="pillar-api-v1"
IMAGE_NAME="pillar/api/v1"
DOCKERFILE_PATH="docker/api-dockerfile"


# ==============================================================================
# Function to display usage
function usage() {
    echo "Usage: $0 [--rebuild] [--cleanup]"
    echo "Options:"
    echo "  --rebuild   Rebuild the Docker image and restart the container"
    echo "  --cleanup   Stop and remove the container and image, then exit"
    exit 1
}

# Check for valid arguments
if [[ $# -gt 1 ]]; then
    usage
fi

# Function to stop and remove the container
function stop_container() {
    docker stop $CONTAINER_NAME >/dev/null 2>&1 || true
    docker rm $CONTAINER_NAME >/dev/null 2>&1 || true
}

# Function to remove the Docker image
function remove_image() {
    docker rmi $IMAGE_NAME >/dev/null 2>&1 || true
}

# Handle script options
case "$1" in
    --rebuild)
        stop_container
        remove_image
        ;;
    --cleanup)
        stop_container
        remove_image
        echo "Cleanup complete."
        exit 0
        ;;
    "")
        ;; # No option passed, proceed to build and run
    *)
        usage
        ;;
esac

# Build the Docker image, with cache control if needed
echo "Building Docker image..."
docker build --no-cache -t $IMAGE_NAME -f $DOCKERFILE_PATH .

# Run the Docker container
echo "Starting Docker container..."
docker run -d --name $CONTAINER_NAME -p 8080:80 $IMAGE_NAME

# Show container status
docker ps -f name=$CONTAINER_NAME
