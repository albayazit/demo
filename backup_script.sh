#!/bin/bash
echo "Start..."
DATE=$(date +%Y-%m-%d-%T)
mkdir -p /opt/backups
rsync -art -t /etc/ /opt/backups/$DATE
echo "Backup done!"
