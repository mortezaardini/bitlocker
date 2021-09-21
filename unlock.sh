#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

drive="$(sudo blkid -o list | grep -E 'BitLocker\s+\(not mounted\)' | grep -oE '^\/\w+\/\w+')"

if [[ -z ${drive} ]]; then
  echo "There is no BitLocker drive, you can run \"sudo blkid -o list to see that.\""
  exit 1
fi

drive_spec="$(sudo fdisk -l | grep -B 1 $drive)"
echo 'Unlocking drive...' 
printf '%s\n' "$drive_spec"
echo 
echo -n Enter Password:
read -s password
sudo mkdir -p /media/bitlocker
sudo mkdir -p /media/mount
echo
sudo dislocker -V $drive -u$password -- /media/bitlocker
sudo mount  -o loop /media/bitlocker/dislocker-file /media/mount
