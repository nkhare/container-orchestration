- Get the token 

```
Neependras-MacBook-Pro:standalone nkhare$ docker run swarm create
Unable to find image 'swarm:latest' locally
latest: Pulling from library/swarm
d681c900c6e3: Pull complete
188de6f24f3f: Pull complete
90b2ffb8d338: Pull complete
237af4efea94: Pull complete
3b3fc6f62107: Pull complete
7e6c9135b308: Pull complete
986340ab62f0: Pull complete
a9975e2cc0a3: Pull complete
Digest: sha256:c21fd414b0488637b1f05f13a59b032a3f9da5d818d31da1a4ca98a84c0c781b
Status: Downloaded newer image for swarm:latest
c2b415317f580d04e564fa316aba2034
Neependras-MacBook-Pro:standalone nkhare$ token=$(docker run swarm create)
```

- Create master

```
Neependras-MacBook-Pro:standalone nkhare$ docker-machine create -d virtualbox --virtualbox-memory 2048 --swarm --swarm-master --swarm-discovery token://$token swarm-master
Running pre-create checks...
Creating machine...
(swarm-master) Copying /Users/nkhare/.docker/machine/cache/boot2docker.iso to /Users/nkhare/.docker/machine/machines/swarm-master/boot2docker.iso...
(swarm-master) Creating VirtualBox VM...
(swarm-master) Creating SSH key...
(swarm-master) Starting the VM...
(swarm-master) Waiting for an IP...
Waiting for machine to be running, this may take a few minutes...
Machine is running, waiting for SSH to be available...
Detecting operating system of created instance...
Detecting the provisioner...
Provisioning with boot2docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Configuring swarm...
Checking connection to Docker...
Docker is up and running!
To see how to connect Docker to this machine, run: docker-machine env swarm-master
```


- Create node-1

```
Neependras-MacBook-Pro:standalone nkhare$ docker-machine create -d virtualbox --virtualbox-memory 2048  --swarm --swarm-discovery token://$token swarm-node1
Running pre-create checks...
Creating machine...
(swarm-node1) Copying /Users/nkhare/.docker/machine/cache/boot2docker.iso to /Users/nkhare/.docker/machine/machines/swarm-node1/boot2docker.iso...
(swarm-node1) Creating VirtualBox VM...
(swarm-node1) Creating SSH key...
(swarm-node1) Starting the VM...
(swarm-node1) Waiting for an IP...
Waiting for machine to be running, this may take a few minutes...
Machine is running, waiting for SSH to be available...
Detecting operating system of created instance...
Detecting the provisioner...
Provisioning with boot2docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Configuring swarm...
Checking connection to Docker...
Docker is up and running!
To see how to connect Docker to this machine, run: docker-machine env swarm-node1
```
- Create node-2
Neependras-MacBook-Pro:standalone nkhare$ docker-machine create -d virtualbox  --virtualbox-memory 2048 --swarm --swarm-discovery token://$token swarm-node2


- Machine output

eependras-MacBook-Pro:1_master_2_nodes nkhare$ eval $(docker-machine env --swarm swarm-master)
Neependras-MacBook-Pro:1_master_2_nodes nkhare$ docker-machine ls
NAME           ACTIVE   DRIVER       STATE     URL                         SWARM                   DOCKER   ERRORS
dev            -        virtualbox   Running   tcp://192.168.99.100:2376                           v1.9.1
swarm-master   *        virtualbox   Running   tcp://192.168.99.104:2376   swarm-master (master)   v1.9.1
swarm-node1    -        virtualbox   Running   tcp://192.168.99.105:2376   swarm-master            v1.9.1
swarm-node2    -        virtualbox   Running   tcp://192.168.99.106:2376   swarm-master            v1.9.1


- Connect to swarm node

Neependras-MacBook-Pro:~ nkhare$ docker-machine env --swarm swarm-master
xport DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.104:3376"
export DOCKER_CERT_PATH="/Users/nkhare/.docker/machine/machines/swarm-master"
export DOCKER_MACHINE_NAME="swarm-master"
# Run this command to configure your shell:
# eval "$(docker-machine env --swarm swarm-master)"

Neependras-MacBook-Pro:~ nkhare$ eval $(docker-machine env --swarm swarm-master)

- info

eependras-MacBook-Pro:~ nkhare$ docker info
Containers: 4
Images: 3
Role: primary
Strategy: spread
Filters: health, port, dependency, affinity, constraint
Nodes: 3
 swarm-master: 192.168.99.101:2376
  └ Status: Healthy
  └ Containers: 2
  └ Reserved CPUs: 0 / 1
  └ Reserved Memory: 0 B / 1.021 GiB
  └ Labels: executiondriver=native-0.2, kernelversion=4.1.13-boot2docker, operatingsystem=Boot2Docker 1.9.1 (TCL 6.4.1); master : cef800b - Fri Nov 20 19:33:59 UTC 2015, provider=virtualbox, storagedriver=aufs
 swarm-node1: 192.168.99.102:2376
  └ Status: Healthy
  └ Containers: 1
  └ Reserved CPUs: 0 / 1
  └ Reserved Memory: 0 B / 1.021 GiB
  └ Labels: executiondriver=native-0.2, kernelversion=4.1.13-boot2docker, operatingsystem=Boot2Docker 1.9.1 (TCL 6.4.1); master : cef800b - Fri Nov 20 19:33:59 UTC 2015, provider=virtualbox, storagedriver=aufs
 swarm-node2: 192.168.99.103:2376
  └ Status: Healthy
  └ Containers: 1
  └ Reserved CPUs: 0 / 1
  └ Reserved Memory: 0 B / 1.021 GiB
  └ Labels: executiondriver=native-0.2, kernelversion=4.1.13-boot2docker, operatingsystem=Boot2Docker 1.9.1 (TCL 6.4.1); master : cef800b - Fri Nov 20 19:33:59 UTC 2015, provider=virtualbox, storagedriver=aufs
CPUs: 3
Total Memory: 3.064 GiB
Name: swarm-master


- Create the app
Neependras-MacBook-Pro:1_master_2_nodes nkhare$ docker-compose up -d

Pulling db (mongo:latest)...
swarm-node2: Pulling mongo:latest... : downloaded
swarm-master: Pulling mongo:latest... : downloaded
swarm-node1: Pulling mongo:latest... : downloaded
Creating 1master2nodes_db_1
Pulling web (nkhare/dockchat:v1)...
swarm-master: Pulling nkhare/dockchat:v1... : downloaded
swarm-node1: Pulling nkhare/dockchat:v1... : downloaded
swarm-node2: Pulling nkhare/dockchat:v1... : downloaded
Creating 1master2nodes_web_1


Neependras-MacBook-Pro:1_master_2_nodes nkhare$ docker-compose ps
       Name                     Command             State               Ports
-----------------------------------------------------------------------------------------
1master2nodes_db_1    /entrypoint.sh --smallfiles   Up      27017/tcp
1master2nodes_web_1   python webapp.py              Up      192.168.99.105:5000->5000/tcp


 
$ cd /Users/nkhare/work/containers-orchestration/simple/swarm/1_master_2_nodes_interlock

$ Neependras-MacBook-Pro:1_master_2_nodes_interlock nkhare$ docker-compose up -d
Creating 1master2nodesinterlock_db_1
Creating 1master2nodesinterlock_web_1
Creating 1master2nodesinterlock_interlock_1
Neependras-MacBook-Pro:1_master_2_nodes_interlock nkhare$ docker-compose ps
               Name                             Command               State                 Ports
----------------------------------------------------------------------------------------------------------------
1master2nodesinterlock_db_1          /entrypoint.sh --smallfiles      Up      27017/tcp
1master2nodesinterlock_interlock_1   /usr/local/bin/interlock - ...   Up      443/tcp, 192.168.99.104:80->80/tcp
1master2nodesinterlock_web_1         python webapp.py                 Up      192.168.99.104:32779->5000/tcp

- update the /etc/hosts file on your desktop/laptop
192.168.99.104 dockchat.com

<insert diagram>

- Scale
Neependras-MacBook-Pro:1_master_2_nodes_interlock nkhare$ docker-compose scale web=5
Creating and starting 2 ... done
Creating and starting 3 ... done
Creating and starting 4 ... done
Creating and starting 5 ... done
Neependras-MacBook-Pro:1_master_2_nodes_interlock nkhare$ docker-compose ps
               Name                             Command               State                 Ports
----------------------------------------------------------------------------------------------------------------
1master2nodesinterlock_db_1          /entrypoint.sh --smallfiles      Up      27017/tcp
1master2nodesinterlock_interlock_1   /usr/local/bin/interlock - ...   Up      443/tcp, 192.168.99.104:80->80/tcp
1master2nodesinterlock_web_1         python webapp.py                 Up      192.168.99.104:32779->5000/tcp
1master2nodesinterlock_web_2         python webapp.py                 Up      192.168.99.104:32781->5000/tcp
1master2nodesinterlock_web_3         python webapp.py                 Up      192.168.99.104:32780->5000/tcp
1master2nodesinterlock_web_4         python webapp.py                 Up      192.168.99.104:32783->5000/tcp
1master2nodesinterlock_web_5         python webapp.py                 Up      192.168.99.104:32782->5000/tcp
 






