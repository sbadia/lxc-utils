LXC Utilities
=============

Licence
-------
2011 Sebastien Badia
feel free to copy and adapt

`apt-get install lxc debootstrap bridge-utils vlan
mkdir /cgroup
echo "cgroup        /cgroup        cgroup        defaults    0    0" >> /etc/fstab
mount cgroup
apt-get install libcap2-bin

lxc-start -n vm0 -d
lxc-stop -n vm0
lxc-info -n vm0
lxc-console -n vm0

./lv-create.sh 2 dns
lxc-debian-squeeze -p /lxc/apt -n apt -i 10.0.15.201 -m 01`
