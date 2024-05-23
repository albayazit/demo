echo "NAT interface (enp0sX):"
read NAT
echo "ISP-HQ:"
read ISP-HQ
echo "ISP-BR:"
read ISP-BR
echo "ISP-CLI"
read ISP-CLI

echo -e "\nauto $NAT \niface $NAT inet dhcp\n" >> /etc/network/interfaces
echo -e "\nauto $ISP-HQ \niface $ISP-HQ inet dhcp\n" >> /etc/network/interfaces
