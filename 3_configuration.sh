#!/bin/bash
sudo systemctl unmask hostapd
sudo systemctl enable hostapd

cp ./conf/ntwrk/* /etc/systemd/network/
sudo systemctl enable systemd-networkd

cp ./conf/dhcp/* /etc/dhcp/

cp ./conf/hostapd/* /etc/hostapd/
 
cp ./conf/hostapd/hostapd_WPA_PSK.conf 

