
```
docker $(docker-machine config dev) run -d \
    -p "8500:8500" \
    -h "consul" \
    progrium/consul -server -bootstrap


 docker-machine create \
-d virtualbox \
--virtualbox-memory 2048 \
--swarm --swarm-master \
--swarm-discovery="consul://$(docker-machine ip dev):8500" \
--engine-opt="cluster-store=consul://$(docker-machine ip dev):8500" \
--engine-opt="cluster-advertise=eth1:2376" \
swarm-master


 docker-machine create \
-d virtualbox \
--virtualbox-memory 2048 \
--swarm  \
--swarm-discovery="consul://$(docker-machine ip dev):8500" \
--engine-opt="cluster-store=consul://$(docker-machine ip dev):8500" \
--engine-opt="cluster-advertise=eth1:2376" \
swarm-node1

 docker-machine create \
-d virtualbox \
--virtualbox-memory 2048 \
--swarm  \
--swarm-discovery="consul://$(docker-machine ip dev):8500" \
--engine-opt="cluster-store=consul://$(docker-machine ip dev):8500" \
--engine-opt="cluster-advertise=eth1:2376" \
swarm-node2
```

- Create Overlay Network
```
docker network create -d overlay --subnet=10.10.10.0/24 dockchat
```

- Setup the environment
```
Neependras-MacBook-Pro:1_master_2_nodes_overlay nkhare$ docker-compose up -d
Creating 1master2nodesoverlay_web_1
Creating 1master2nodesoverlay_db_1
Creating 1master2nodesoverlay_interlock_1
Neependras-MacBook-Pro:1_master_2_nodes_overlay nkhare$ docker-compose ps
              Name                            Command               State                 Ports
--------------------------------------------------------------------------------------------------------------
1master2nodesoverlay_db_1          /entrypoint.sh --smallfiles      Up      27017/tcp
1master2nodesoverlay_interlock_1   /usr/local/bin/interlock - ...   Up      443/tcp, 192.168.99.112:80->80/tcp
1master2nodesoverlay_web_1         python webapp.py                 Up      192.168.99.113:32772->5000/tcp
```

- Scale the web interface
Neependras-MacBook-Pro:1_master_2_nodes_overlay nkhare$ docker-compose scale web=5
Creating and starting 2 ... done
Creating and starting 3 ... done
Creating and starting 4 ... done
Creating and starting 5 ... done
Neependras-MacBook-Pro:1_master_2_nodes_overlay nkhare$ docker-compose ps
              Name                            Command               State                 Ports
--------------------------------------------------------------------------------------------------------------
1master2nodesoverlay_db_1          /entrypoint.sh --smallfiles      Up      27017/tcp
1master2nodesoverlay_interlock_1   /usr/local/bin/interlock - ...   Up      443/tcp, 192.168.99.112:80->80/tcp
1master2nodesoverlay_web_1         python webapp.py                 Up      192.168.99.113:32772->5000/tcp
1master2nodesoverlay_web_2         python webapp.py                 Up      192.168.99.113:32773->5000/tcp
1master2nodesoverlay_web_3         python webapp.py                 Up      192.168.99.113:32774->5000/tcp
1master2nodesoverlay_web_4         python webapp.py                 Up      192.168.99.112:32768->5000/tcp
1master2nodesoverlay_web_5         python webapp.py                 Up      192.168.99.113:32775->5000/tcp
````


