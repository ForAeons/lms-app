#!/bin/bash

# Load environment variables
export $(cat .env.local | xargs)

echo "Building Docker image..."
docker build . > /dev/null

# Build and start Docker containers
echo "Starting Docker containers..."
docker compose up -d > /dev/null

# Wait for the server to start
echo "Waiting for the server to become active..."
while ! curl -s http://localhost:$PORT > /dev/null; do
    echo "Waiting for server to respond..."
    sleep 5
done
echo "Server is up and running at http://localhost:$PORT"

# Start ngrok
echo "Starting ngrok..."
ngrok config add-authtoken $NGROK_AUTHTOKEN
ngrok http --domain $NGROK_DOMAIN $PORT 
