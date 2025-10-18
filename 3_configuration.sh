#!/bin/bash
#sudo systemctl stop systemd-resolved
#sudo systemctl disable systemd-resolved
#sudo systemctl mask systemd-resolved




#sudo cp ./conf/ntwrk/* /etc/systemd/network/
#sudo systemctl enable systemd-networkd

sudo cp ./conf/dhcp/* /etc/dhcp/
sudo cp ./conf/hostapd/* /etc/hostapd/
sudo cp /etc/hostapd/hostapd_WPA_PSK.conf /etc/hostapd/hostapd.conf
sudo cp ./conf/etc/* /etc/
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl restart dhcpcd
sudo systemctl restart dnsmasq
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables-save
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo systemctl mask systemd-resolved


