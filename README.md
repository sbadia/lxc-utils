LXC Utilities
=============

Licence
-------
2011 Sebastien Badia
feel free to copy and adapt

Install Lxc
-------
`apt-get install lxc debootstrap bridge-utils vlan libcap2-bin`
`mkdir /cgroup`
`echo "cgroup        /cgroup        cgroup        defaults    0    0" >> /etc/fstab`
`mount cgroup`

Play with Lxc
-------

1. Créez le lv `sh lv-create 2 dns`
2. Créez la vm `lxc-debian-squeeze -p /lxc/dns -n dns -i 10.0.10.1 -m 01`
3. Démarrez la vm `lxc-start -n dns -d`
4. Soppez la vm `lxc-stop -n dns`
5. Etat de la vm (basique) `lxc-info -n dns`
6. Console `lxc-console -n dns` (default passwd root:root)


Lxc Status
-------
`wget https://raw.github.com/sbadia/lxc-utils/master/lxc-status && bash lxc-status`

Ip Addr		Bridge		State	Hostname
10.0.10.1	switch-prod	Running	apt.sebian.fr
10.0.10.6	switch-prod	Running	dns.sebian.fr
10.0.10.2	switch-prod	Running	git.sebian.fr
10.0.10.5	switch-prod	Running	mail.sebian.fr
