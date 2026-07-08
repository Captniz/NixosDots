# Usage check
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <share ip> <username> <password>"
    exit 1
fi

SERVER_IP="$1"
USERNAME="$2"
PASSWORD="$3"

MOUNT_POINT="/mnt/Network"

# Create mount point if needed
if [ ! -d "$MOUNT_POINT" ]; then
    sudo mkdir -p "$MOUNT_POINT"
fi

# Mount CIFS share
sudo mount -t cifs "//$SERVER_IP" "$MOUNT_POINT" -o "username=$USERNAME,password=$PASSWORD,vers=3.0,uid=1000,gid=1000,nounix,noserverino"

# Verify mount
if mountpoint -q "$MOUNT_POINT"; then
    echo "Mounted //$SERVER_IP at $MOUNT_POINT"
else
    echo "Mount failed"
    exit 1
fi