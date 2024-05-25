#!/bin/bash

echo "SMB FILE SERVER CONF IN HQ-SRV..."
apt-get install samba -y
mkdir -p /mnt/files/{branch_files,network,admin_files}
useradd admin -p P@ssw0rd
useradd network_admin -p P@ssw0rd
useradd branch_admin -p P@ssw0rd
smbpasswd -a admin
smbpasswd -a network_admin
smbpasswd -a branch_admin
wget albayazit.github.io/demo/samba/smbconf
users >> /etc/samba/smb.conf
rm users
systemctl restart smbd.service
echo "Done!"
echo "On HQ-R: smbclient //20.20.20.2/admin_files -U admin"