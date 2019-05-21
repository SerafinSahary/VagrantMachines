ssh-keygen -f "/home/serafin/.ssh/known_hosts" -R [127.0.0.1]:2222
ssh-keygen -f "/home/serafin/.ssh/known_hosts" -R [127.0.0.1]:2200
ssh-keygen -f "/home/serafin/.ssh/known_hosts" -R [127.0.0.1]:2201

ssh-keygen -f "/home/serafin/.ssh/known_hosts" -R 192.168.33.10
ssh-keygen -f "/home/serafin/.ssh/known_hosts" -R 192.168.33.11
ssh-keygen -f "/home/serafin/.ssh/known_hosts" -R 192.168.33.12

ssh -p 2222 vagrant@127.0.0.1 /bin/true
ssh -p 2200 vagrant@127.0.0.1 /bin/true
ssh -p 2201 vagrant@127.0.0.1 /bin/true

ssh vagrant@192.168.33.10 /bin/true
ssh vagrant@192.168.33.11 /bin/true
ssh vagrant@192.168.33.12 /bin/true

