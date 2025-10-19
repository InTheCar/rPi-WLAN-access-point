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


apps=(
  "network-manager"
  "openvswitch-switch-dpdk"
  "hostapd"
  "net-tools"
  "dnsmasq"
  "iptables"
  "rfkill"
  "wireless-tools"
  "wpasupplicant"

)
#  "dnsmasq"
#  "hostapd"
#  "iptables"
SECONDS=0
for i in "${apps[@]}"
do
  echo ""
  echo "perform: sudo apt-get -y install $i"
  eval sudo apt-get -y install $i || echo failed: sudo apt-get -y install $i
done
echo ""
duration=$SECONDS
echo "time for installing apps needed:"
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
echo ""


