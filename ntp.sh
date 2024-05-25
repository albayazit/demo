#!/bin/bash

apt install chrony -y
timedatectl set-timezone Europe/Moscow

echo "What machine now?"
echo "1 - HQ-R | 2 - Others"
read MACHINE

rm -rf /etc/chrony/chrony.conf

if [[ $MACHINE -eq 1 ]]; then
    wget albayazit.github.io/demo/chrony/chrony_hqr.conf
    mv chrony_hqr.conf /etc/chrony/chrony.conf
    chronyc sources
elif [[ $MACHINE -eq 2 ]]; then
    wget albayazit.github.io/demo/chrony/chrony.conf
    mv chrony.conf /etc/chrony/chrony.conf
    systemctl restart chrony
    chronyc sources
else
    echo "INCORRECT INPUT"
fi
