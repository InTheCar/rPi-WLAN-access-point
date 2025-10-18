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
echo "reboot needed"
