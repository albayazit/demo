#!/bin/bash

apt install chrony -y
timedatectl set-timezone Europe/Moscow

rm -rf /etc/chrony/chrony.conf
wget albayazit.github.io/demo/chrony/chrony.conf
mv chrony.conf /etc/chrony/chrony.conf
systemctl enable --now chrony
chronyc sources
echo "Write 'server 20.20.20.1 iburst prefer' on other machines."
