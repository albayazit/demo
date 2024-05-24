apt-get install bind9 bind9-utils -y
echo "Configurating DNS..."
sed -i 's/\/\/ forwarders/forwarders/' /etc/bind/named.conf.options
sed -i 's/\/\/\t0.0.0.0;/ 8.8.8.8;/' /etc/bind/named.conf.options
sed -i 's/\/\/ };/};/' /etc/bind/named.conf.options
wget albayazit.github.io/demo/named.conf.local
rm -rf /etc/bind/named.conf.local
mv named.conf.local /etc/bind/named.local.conf