#!/bin/bash
## Author <seb@sebian.fr>

HOST=$1
LV=$2
usage()
{
  echo -en "Usage:\t./migrate.sh <host-src> <lv-src>\n\t./migrate.sh xen-srv1 www-disk\n\nContact: <seb@sebian.fr>\n"
}

if [ -z $HOST ]; then
  usage
elif [ -z $LV ]; then
  usage
else
  echo -n "--> mount"
  ssh $HOST "mount /dev/xen-images/$LV /mnt/ubuntu"
  mount /dev/bdx_vg/$LV /mnt/migrate/
  echo -n "--> rsync files"
  rsync --numeric-ids --verbose --archive --bwlimit=100000 --rsh ssh $HOST:/mnt/ubuntu/* /mnt/migrate
  echo -n "--> umount"
  umount /mnt/migrate
  ssh $HOST "umount /mnt/ubuntu"
fi
