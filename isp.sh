#!/bin/bash

echo "Network config (enp0sX)..."
echo "ISP-HQ:"
read ISPHQ
echo "ISP-BR:"
read ISPBR
echo "ISP-CLI"
read ISPCLI

echo -e "auto $ISPHQ \niface $ISPHQ inet static\naddress 2.2.2.1\nnetmask 255.255.255.0\n" >> /etc/network/interfaces
echo -e "auto $ISPBR \niface $ISPBR inet static\naddress 3.3.3.1\nnetmask 255.255.255.0\n" >> /etc/network/interfaces
echo -e "auto $ISPCLI \niface $ISPCLI inet static\naddress 10.10.10.1\nnetmask 255.255.255.0\n" >> /etc/network/interfaces
systemctl restart networking


echo "Turn on ip_forwarding..."
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p

