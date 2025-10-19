#!/bin/bash
#sudo systemctl stop systemd-resolved
#sudo systemctl disable systemd-resolved
#sudo systemctl mask systemd-resolved




#sudo cp ./conf/ntwrk/* /etc/systemd/network/
#sudo systemctl enable systemd-networkd

sudo cp ./conf/resolve/* /run/systemd/resolve/
sudo cp ./conf/NetworkManager/* /etc/NetworkManager/
#sudo cp ./conf/dhcp/* /etc/dhcp/
#sudo cp ./conf/hostapd/* /etc/hostapd/
#sudo cp /etc/hostapd/hostapd_WPA_PSK.conf /etc/hostapd/hostapd.conf
#sudo cp ./conf/etc/* /etc/
#sudo systemctl restart dhcpcd
#sudo systemctl restart dnsmasq
#sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#sudo iptables-save
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo systemctl mask systemd-resolved
sudo systemctl restart dnsmasq.service

sudo rm /etc/netplan/51-*
sudo cp ./conf/netplan/51-configure_WPA2_PSK.yaml /etc/netplan/
sudo chmod 600 /etc/netplan/*
sudo netplan generate
sudo netplan apply
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd


