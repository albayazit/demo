apt-get install bind9 bind9-utils -y
echo "Configurating DNS..."
sed -i 's/\/\/ forwarders/forwarders/' /etc/bind/named.conf.options
sed -i 's/\/\/\t0.0.0.0;/ 8.8.8.8;/' /etc/bind/named.conf.options
sed -i 's/\/\/ };/};/' /etc/bind/named.conf.options
wget albayazit.github.io/demo/dns/named.conf.local
rm -rf /etc/bind/named.conf.local
mv named.conf.local /etc/bind/named.conf.local
wget albayazit.github.io/demo/dns/db.30.30.30
wget albayazit.github.io/demo/dns/db.20.20.20
wget albayazit.github.io/demo/dns/db.branch.work
wget albayazit.github.io/demo/dns/db.hq.work

mkdir /etc/bind/zones
mv db.30.30.30 /etc/bind/zones/
mv db.20.20.20 /etc/bind/zones/
mv db.branch.work /etc/bind/zones/
mv db.hq.work /etc/bind/zones/

echo "Checking with named-checkconf..."
named-checkconf
named-checkconf -z
systemctl restart bind9
echo "nameserver 20.20.20.2" > /etc/resolv.conf
echo -e "\necho \"20.20.20.2\" >> /etc/resolv.conf" >> /etc/network/interfaces
apt-get install dnsutils
echo "Done!"