#!/bin/bash
apps=(
  "dnsmasq"
  "hostapd"
  "iptables"
)
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
echo "reboot needed"

