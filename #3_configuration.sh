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

sudo systemctl restart dnsmasq

#------------------------------------------------------------------


sudo cp r- /etc/ /etc/
#sudo cp ./conf/etc/* /etc/




sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd
#sudo systemctl restart dhcpcd

#sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
#sudo iptables-save


