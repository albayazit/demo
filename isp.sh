#!/bin/bash

# Настройка сети
echo "Network config (enp0sX)..."
echo "ISP-HQ:"
read ISPHQ
echo "ISP-BR:"
read ISPBR
echo "ISP-CLI:"
read ISPCLI

echo -e "\nauto $ISPHQ \niface $ISPHQ inet static\naddress 2.2.2.1\nnetmask 255.255.255.0\n" >> /etc/network/interfaces
echo -e "auto $ISPBR \niface $ISPBR inet static\naddress 3.3.3.1\nnetmask 255.255.255.0\n" >> /etc/network/interfaces
echo -e "auto $ISPCLI \niface $ISPCLI inet static\naddress 10.10.10.1\nnetmask 255.255.255.0\n" >> /etc/network/interfaces

systemctl restart networking.service



# Включение перенаправления пакетов
echo "Turn on ip_forwarding..."
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p



# Установка iptables
echo "Installing iptables..."
apt-get install iptables -y



# Установка правил для iptables
echo "Creating iptables rules..."
touch /etc/iptables.sh

echo "#!/bin/bash" >> /etc/iptables.sh
echo "NAT interface. Default enp0s3:" >> /etc/iptables.sh
echo "read NAT" >> /etc/iptables.sh
echo -e "export WAN=\"$NAT\"" >> /etc/iptables.sh

echo "iptables -F" >> /etc/iptables.sh
echo "iptables -F -t nat" >> /etc/iptables.sh
echo "iptables -F -t mangle" >> /etc/iptables.sh
echo "iptables -X" >> /etc/iptables.sh
echo "iptables -t nat -X" >> /etc/iptables.sh
echo "iptables -t mangle -X" >> /etc/iptables.sh

echo "iptables -P INPUT ACCEPT" >> /etc/iptables.sh
echo "iptables -P OUTPUT ACCEPT" >> /etc/iptables.sh
echo "iptables -P FORWARD ACCEPT" >> /etc/iptables.sh

echo "iptables -t nat -A POSTROUTING -o $WAN -j MASQUERADE" >> /etc/iptables.sh

echo "/sbin/iptables-save > /etc/iptables.rules" >> /etc/iptables.sh
echo "post-up iptables-restore < /etc/iptables.rules" >> /etc/network/interfaces
chmod 0740 /etc/iptables.sh
bash /etc/iptables.sh