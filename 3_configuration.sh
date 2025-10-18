#!/bin/bash




sudo systemctl unmask hostapd
sudo systemctl enable hostapd

sudo cp ./conf/ntwrk/* /etc/systemd/network/
sudo systemctl enable systemd-networkd

sudo cp ./conf/dhcp/* /etc/dhcp/

sudo cp ./conf/hostapd/* /etc/hostapd/
 
sudo cp ./conf/hostapd/* /etc/hostapd/ 



sudo cp ./conf/etc/* /etc/
sudo systemctl restart dhcpcd

