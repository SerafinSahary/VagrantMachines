#!/usr/bin/python

import winrm

s = winrm.Session('http://192.168.5.164:5985',
    auth=('vagrant','vagrant'),transport='basic')

r = s.run_cmd('ipconfig')

print r.std_out
