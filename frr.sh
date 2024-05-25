#!/bin/bash

echo "FRR setup. Choose machine:"
echo "1 - HQ-R; 2 - ISP; 3 - BR-R"
read NUM

apt-get install frr -y
sed -i 's/ospfd=no/ospfd=yes/' /etc/frr/daemons

if [[ $NUM -eq 1 ]]; then
    
elif [[ $NUM -eq 2 ]]; then
    echo "2";
elif [[ $NUM -eq 3 ]]; then
    echo "3"
else
    echo "INCORRECT INPUT"
fi

echo "router ospf" >> /etc/frr/frr.conf