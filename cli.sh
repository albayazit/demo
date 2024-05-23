hostnamectl set-hostname cli; exec bash
echo -e “\nauto enp0s3\n iface enp0s3 inet static\naddress 10.10.10.2\nnetmask 255.255.255.0\ngateway 10.10.10.1”
systemctl restart networking
