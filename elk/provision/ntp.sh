#!/bin/bash

systemctl disable systemd-timesyncd.service

sed -e '/^pool/s/^/#/' -i /etc/ntp.conf

cat >> /etc/ntp.conf <<- "EOF"

server tempus1.gum.gov.pl
server tempus2.gum.gov.pl
server ntp.certum.pl
server vega.cbk.poznan.pl

server 127.127.1.0
fudge 127.127.1.0 stratum 10

EOF

service ntp restart

ntpq -p

