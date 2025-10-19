#!/bin/bash
#sudo systemctl stop systemd-resolved
#sudo systemctl disable systemd-resolved
#sudo systemctl mask systemd-resolved
#sudo cp ./conf/ntwrk/* /etc/systemd/network/
#sudo systemctl enable systemd-networkd

#------------------------------------------------------------------

sudo systemctl stop NetworkManager.service
sudo systemctl stop NetworkManager-wait-online.service
sudo systemctl stop NetworkManager-dispatcher.service
sudo systemctl stop network-manager.service

sudo cp ./conf/NetworkManager/* /etc/NetworkManager/

sudo systemctl start network-manager.service
sudo systemctl start NetworkManager-dispatcher.service
sudo systemctl start NetworkManager-wait-online.service
sudo systemctl start NetworkManager.service

#------------------------------------------------------------------

sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved

sudo cp./conf/resolve/* ./run/systemd/resolve/

sudo systemctl restart dnsmasq.service

#------------------------------------------------------------------








#sudo cp ./conf/dhcp/* /etc/dhcp/
#sudo cp ./conf/hostapd/* /etc/hostapd/
#sudo cp /etc/hostapd/hostapd_WPA_PSK.conf /etc/hostapd/hostapd.conf
#sudo cp ./conf/etc/* /etc/
#sudo systemctl restart dhcpcd
#sudo systemctl restart dnsmasq
#sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#sudo iptables-save

sudo rm /etc/netplan/51-*
sudo cp ./conf/netplan/51-configure_WPA2_PSK.yaml /etc/netplan/
sudo chmod 600 /etc/netplan/*
sudo netplan generate
sudo netplan apply
#sudo systemctl unmask hostapd
#sudo systemctl enable hostapd
#sudo systemctl start hostapd


