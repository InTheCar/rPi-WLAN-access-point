#!/bin/bash
#sudo systemctl stop systemd-resolved
#sudo systemctl disable systemd-resolved
#sudo systemctl mask systemd-resolved




#sudo cp ./conf/ntwrk/* /etc/systemd/network/
#sudo systemctl enable systemd-networkd

sudo cp ./conf/dhcp/* /etc/dhcp/

sudo cp ./conf/hostapd/* /etc/hostapd/
 
sudo cp ./conf/hostapd/* /etc/hostapd/ 



sudo cp ./conf/etc/* /etc/
sudo systemctl unmask hostapd
sudo systemctl enable hostapd

sudo systemctl restart dhcpcd
sudo systemctl restart dnsmasq


