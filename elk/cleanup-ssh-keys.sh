ssh-keygen -f "/home/serafin/.ssh/known_hosts" -R [127.0.0.1]:2200
ssh-keygen -f "/home/serafin/.ssh/known_hosts" -R [127.0.0.1]:2222

ssh -N -p 2222 vagrant@127.0.0.1
ssh -N -p 2200 vagrant@127.0.0.1
