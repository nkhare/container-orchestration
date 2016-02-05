# [Swarm](https://docs.docker.com/swarm/)

![enter image description here](http://image.slidesharecdn.com/swarmonlinemeetup-151111212937-lva1-app6892/95/docker-online-meetup-28-productionready-docker-swarm-11-638.jpg)

## How Swarm satisfies Container Orchestration requirements 

### Multiple Nodes to be part of a cluster

### Unique ID/Token to bind all the nodes in a unique cluster
- Swarm Token ID

### Container Engine
- Docker 

### Single source of truth about configuration for nodes
- [Libkv](https://github.com/docker/libkv)
  * Etcd
  * Consul
  * Zookeeper 
  * BoltDB

### Network for containers of different nodes to talk to each other
- [Libnetwork](https://github.com/docker/libnetwork) 
  * Drivers 
    ** null
    ** bridge
    ** overlay
    ** remote 

![libnetwork](https://github.com/docker/libnetwork/blob/master/docs/cnm-model.jpg)

- Docker Network Plugins
  * Weave
  * Calico

### Scheduler to schedule the containers on nodes based on
- [Filters](https://docs.docker.com/swarm/scheduler/filter/)
  * Node filter
    ** constraint
    ** health
   
  * Container filters
    ** affinity
    ** dependency
    ** port

- [Strategies](https://docs.docker.com/swarm/scheduler/strategy/)
  * spread
  * binpack
  * random

### Service discovery within the cluster
- Through environment variables 
- Internal DNS server
  * [WAGL](https://github.com/ahmetalpbalkan/wagl/) 

### Access from outside world
- Load balancer, HA proxy
  * [Interlock](https://github.com/ehazlett/interlock)

### Access to external shared storage
- Docker Volume plugins
  ** GLusterFS
  ** Rex-Ray
  ** Flocker


### Links
- [Swarm Frontend](https://github.com/docker/swarm-frontends)  - To deploy k8s and Mesos-Marathon using Docker Compose



