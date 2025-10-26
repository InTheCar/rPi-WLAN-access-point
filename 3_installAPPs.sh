#!/bin/bash
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

#  "openvswitch-switch-dpdk"
appsinstall=(
  "screen"
  "hostapd"
  "net-tools"
  "dnsmasq"
  "iptables"
  "rfkill"
  "wireless-tools"
)
appsremove=(
  "wpasupplicant"
  "network-manager"
)
SECONDS=0
for i in "${appsinstall[@]}"
do
  echo ""
  echo "perform: sudo apt-get -y install $i"
  eval sudo apt-get -y install $i || echo failed: sudo apt-get -y install $i
done
for i in "${appsremove[@]}"
do
  echo ""
  echo "perform: sudo apt-get -y remove $i"
  eval sudo apt-get -y remove $i || echo failed: sudo apt-get -y remove $i
done
echo ""
duration=$SECONDS
echo "time for installing apps needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""


