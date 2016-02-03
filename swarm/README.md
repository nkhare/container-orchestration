## Swarm

![enter image description here](http://image.slidesharecdn.com/swarmonlinemeetup-151111212937-lva1-app6892/95/docker-online-meetup-28-productionready-docker-swarm-11-638.jpg)

### Multiple Nodes to be part of a cluster

### Unique ID/Token to bind all the nodes in a unique cluster
- Swarm Token ID

### Container Engine
- Docker 

### Means of communication between nodes of a Cluster

### Single source of truth about configuration for nodes
- Key-Value Store 

### Network for containers of different nodes to talk to each other
- VxLAN 

### Scheduler to schedule the containers on nodes based on
- Constraints
- Affinity

### Service discovery within the cluster
- Internal DNS server
- Through environment variables 

### Single point to communication from outside world
- Load balancer, HA proxy
