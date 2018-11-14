#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get --quiet update

apt-get --quiet --yes install mc postfix unzip zip apt-file apt-show-versions lynx elinks sysstat apparmor-utils ntp htop screen apt-transport-https wget

#apt-get install lshw pciutils

#apt-get --quiet install open-vm-tools

apt-file update

apt-get --quiet --purge --yes remove ufw
apt-get --quiet --yes install iptables-persistent netfilter-persistent

