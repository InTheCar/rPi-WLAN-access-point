#!/bin/bash
#sudo systemctl stop systemd-resolved
#sudo systemctl disable systemd-resolved
#sudo systemctl mask systemd-resolved
#sudo cp ./conf/ntwrk/* /etc/systemd/network/
#sudo systemctl enable systemd-networkd
#------------------------------------------------------------------

command=(
  "sudo snap refresh"
  "sudo apt-get update"
  "sudo apt-get -y upgrade"
)
SECONDS=0
for i in "${command[@]}"
do
  echo ""
  echo "perform: $i"
  eval $i || echo failed: $i
  #eval "$1"
done
echo ""
duration=$SECONDS
echo "time for updates needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""

#------------------------------------------------------------------

echo Stopping NetworkManager.service
sudo systemctl stop NetworkManager.service
echo Stopping NetworkManager-wait-online.service
sudo systemctl stop NetworkManager-wait-online.service
echo Stopping NetworkManager-dispatcher.service
sudo systemctl stop NetworkManager-dispatcher.service

sudo cp ./conf/NetworkManager/* /etc/NetworkManager/

echo Starting NetworkManager-dispatcher.service
sudo systemctl start NetworkManager-dispatcher.service
echo Starting NetworkManager-wait-online.service
sudo systemctl start NetworkManager-wait-online.service
echo Starting NetworkManager.service
sudo systemctl start NetworkManager.service

#------------------------------------------------------------------

echo Stopping systemd-resolved
sudo systemctl stop systemd-resolved
echo Disable systemd-resolved
sudo systemctl disable systemd-resolved

echo cp./etc/* /etc/

echo Restart dnsmasq.service
sudo systemctl restart dnsmasq.service

#------------------------------------------------------------------

sudo rm /etc/netplan/51-*
sudo cp ./conf/netplan/51-configure_WEP.yaml /etc/netplan/
sudo chmod 600 /etc/netplan/*
sudo netplan generate
sudo netplan apply




sudo cp ./conf/hostapd/* /etc/hostapd/
sudo cp /etc/hostapd/hostapd_WPA_PSK.conf /etc/hostapd/hostapd.conf
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables-save
sudo systemctl restart hostapd






#sudo systemctl restart dhcpcd
#sudo systemctl restart dnsmasq
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables-save



