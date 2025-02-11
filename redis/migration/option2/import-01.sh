#!/bin/bash

# Define variables
ORIGIN_N8N_CONTAINER_NAME="n8n-regular" # n8n container running in regular mode
DESTINATION_N8N_CONTAINER="n8n-queue" # n8n container running in queue mode
EXPORT_DIR="/tmp/"

# Create export directory
mkdir -p $EXPORT_DIR

# 1. Export workflows and credentials from the old container
echo "Starting export from the old container..."
docker exec $ORIGIN_N8N_CONTAINER_NAME n8n export:workflow --all --output=$EXPORT_DIR/workflows.json
docker exec $ORIGIN_N8N_CONTAINER_NAME n8n export:credentials --all --output=$EXPORT_DIR/credentials.json

# 2. Copy export files to local
echo "Copying export files to local..."
docker cp $ORIGIN_N8N_CONTAINER_NAME:$EXPORT_DIR/workflows.json ./workflows.json
docker cp $ORIGIN_N8N_CONTAINER_NAME:$EXPORT_DIR/credentials.json ./credentials.json