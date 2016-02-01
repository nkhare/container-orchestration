# containers-orchestration

## Why we need Container Orchestration

- We don't like pets in server farms :)
- We want zero down
- We want auto-scaling
- We want to go across different cloud providers

## What is needed to do the Container Orchestration

### Multiple Nodes to be part of a cluster

### Unique ID/Token to bind all the nodes in a unique cluster

### Container Engine
- Docker 
- Rkt

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


### Docker Swarm

### Kubernetes

### Mesos

### ECS

## Credits
As there are many container orchestration tool, it becomes difficultto choose one. So we thought of taking one Real World App and deploy it in differnet orchestration engines. 

We thought a real world e-commerce platform would be a nice and came
across [Magento](https://magento.com/). While doing some browsing we 
came across [this blog post](http://mageinferno.com/blog/deploy-magento-2-digital-ocean-tutum)
to deploy Magento2 on Tutum., which gave us good reference. 

So first we would deploy Magneto on differnet orhestration engines and
then experiment with features like replication, auto-scaling etc. 

- [Mark Shust](https://github.com/markoshust) for providing Magento2 Docker Compose file
https://github.com/mageinferno/magento2-docker-compose
