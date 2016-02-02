
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

