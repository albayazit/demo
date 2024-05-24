#!/bin/bash
echo "Start..."
DATE=$(date +%Y-%m-%d-%T)
rsync -art -t /etc/ /opt/backups/$DATE
echo "Backup done!"
