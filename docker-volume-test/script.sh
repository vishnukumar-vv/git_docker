#!/bin/bash
set -e

echo "=============================="
echo "6Container Started"
echo "Hostname: $(hostname)"
echo "Time: $(date)"
echo "=============================="

echo "Preparing volume directory..."

# ensure directory exists
mkdir -p /data

# give permission (for demo purpose)
chmod 777 /data

echo "Writing message to volume..."

# append message (important for multi container demo)
echo "Hello from container $(hostname) at $(date)" >> /data/message.txt

echo ""
echo "Message saved successfully!"
echo ""

echo " Listing /data directory:"
ls -l /data

echo ""
echo " File Content:"
cat /data/message.txt

echo ""
echo "=============================="
echo "Container will keep running..."
echo "Use docker exec to inspect"
echo "=============================="

# keep container alive
sleep infinity
