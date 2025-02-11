#!/bin/bash

# Define variables
DESTINATION_N8N_CONTAINER="n8n-server"
EXPORT_DIR="/tmp/"

# 3. Copy files to the new container
echo "Copying files to the new container..."
docker cp ./workflows.json $DESTINATION_N8N_CONTAINER:$EXPORT_DIR/workflows.json
docker cp ./credentials.json $DESTINATION_N8N_CONTAINER:$EXPORT_DIR/credentials.json

# 4. Import workflows and credentials into the new container
echo "Starting import into the new container..."
docker exec $DESTINATION_N8N_CONTAINER n8n import:workflow --input=$EXPORT_DIR/workflows.json
docker exec $DESTINATION_N8N_CONTAINER n8n import:credentials --input=$EXPORT_DIR/credentials.json

# 5. Clean up temporary files
echo "Cleaning up temporary files..."
rm ./workflows.json ./credentials.json

echo "Migration completed successfully!"