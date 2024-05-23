#!/bin/bash
echo "Start backup"
DATE=$(date +%Y-%m-%d-%T)
rsync -art -t /etc/ /opt/backups/$DATE
echo "Backup done!"
