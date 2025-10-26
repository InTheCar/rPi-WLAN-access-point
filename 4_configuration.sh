#!/bin/bash
#------------------------------------------------------------------
command=(
  "sudo snap refresh"
  "sudo apt-get update"
  "sudo apt-get -y upgrade"
  "sudo unattended-upgrade"
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
echo Disable NetworkManager-dispatcher.service
sudo systemctl disable NetworkManager-dispatcher.service

echo Stopping NetworkManager-wait-online.service
sudo systemctl stop NetworkManager-wait-online.service
echo Disable NetworkManager-wait-online.service
sudo systemctl disable NetworkManager-wait-online.service

echo Stopping NetworkManager-dispatcher.service
sudo systemctl stop NetworkManager-dispatcher.service
echo Disable NetworkManager.service
sudo systemctl disable NetworkManager.service
#------------------------------------------------------------------
echo Stopping systemd-resolved
sudo systemctl stop systemd-resolved
echo Disable systemd-resolved
sudo systemctl disable systemd-resolved


#sudo ln -s /etc/systemd/system/wifiap@wlan0.service \
#  /etc/systemd/system/multi-user.target.wants/wifiap@wlan0.service
#echo Restart dnsmasq.service
#sudo systemctl restart dnsmasq.service

#------------------------------------------------------------------
sudo rm /etc/netplan/51-*
echo cp -rv ./conf/etc/* /etc/
sudo cp -rv ./conf/etc/* /etc/
sudo chmod 600 /etc/netplan/*
sudo unlink /etc/resolv.conf
sudo cp -v /etc/resolv.conf.bak /etc/resolv.conf
sudo cp -v /etc/dnsmasq.conf /etc/dnsmasq.conf.bak

sudo netplan generate
sudo netplan apply




sudo cp -v /etc/hostapd/wifiap_WPA2 /etc/hostapd/hostapd.conf
sudo systemctl unmask hostapd.service
sudo systemctl enable hostapd.service
sudo systemctl start hostapd
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
sudo systemctl restart hostapd.service

echo ""
echo "--- reboot needed ---"




