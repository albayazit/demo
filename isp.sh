echo "Настройка интерфейсов (enp0sX):"
echo "ISP-HQ:"
read ISPHQ
echo "ISP-BR:"
read ISPBR
echo "ISP-CLI"ßß
read ISPCLI

echo -e "\nauto $ISPHQ \niface $ISPHQ inet static\naddress 2.2.2.1\nnetmask 255.255.255.0" >> /etc/network/interfaces

echo -e "\nauto $ISPBR \niface $ISPBR inet static\naddress 3.3.3.1\nnetmask 255.255.255.0" >> /etc/network/interfaces

echo -e "\nauto $ISPCLI \niface $ISPCLI inet static\naddress 10.10.10.1\nnetmask 255.255.255.0" >> /etc/network/interfaces
