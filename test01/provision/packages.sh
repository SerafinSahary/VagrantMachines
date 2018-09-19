#!/bin/bash

apt-get --quiet update

apt-get --quiet --yes install mc postfix unzip zip apt-file apt-show-versions lynx elinks munin-node sysstat apparmor-utils ntp htop screen

#apt-get install lshw pciutils

#apt-get --quiet install open-vm-tools

apt-file update

apt-get --quiet --purge --yes remove ufw
apt-get --quiet --yes install iptables-persistent netfilter-persistent

