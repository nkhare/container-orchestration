# Container-orchestration

As there are many container orchestration tools like 

- [Docker Swarm](swarm/README.md)
- [Kubernetes](kubernetes/README.md)
- [Mesos Marathon](mesos/README.md)
- Cloud Foundry Diego
- Apache Aurora
- Amazon ECS
- Azure container Service

As you could guess, it becomes difficult to choose one. So we thought of taking one Real World App and deploy it in differnet orchestration engines. For now we would look into Docker Swarm, Kubernetes and Mesos marathon.

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
- Load balancer, HA proxy

### Access to external shared storage
- Volume plugins

## Examples 

We are going to look at two examples :-

### dockchat (https://github.com/nicolaka/dockchat.git)

This is a simple example, which I borrowed from from [DockerCon EU tutorial](https://github.com/docker/dceu_tutorials/blob/master/02-orchestration.md). In that tutorial, the steps are given to orchestrate the simple chat application using Docker Swarm. Here would take that same app and deploy it using Kubernetes and Mesos.

Here is the Docker compose file :- 

```
# Mongo DB
db:
  image: mongo
  expose:
    - 27017
  command: --smallfiles
# Python App
web:
  image: nkhare/dockchat:v1
  ports:
    - "5000:5000"
  links:
   - db:db
```  

which consist of two containers, *db* and *web*. *db* container would get created from *mongo* images and *web* container from *nkhare/dockchat:v1* image which got create from this [Dockerfile](https://github.com/nicolaka/dockchat/blob/master/Dockerfile). In the *web app*, we would see following settings for *mongodb*

```
#Mongo Settings
client = MongoClient('db', 27017) # db is the hostname for the mongodb daemon. Need to link the db container to this container and create a local alias in etc/hosts.
db = client.test_database
collection = db.test_collection
posts = db.posts
```

*web app* would look try to connect to *db* on port *27017*, which can be resolved by  

- *db* entry in */etc/hosts* file
- service discovery
- internal *DNS* server


### Magento

We thought a real world e-commerce platform would be a nice and came
across [Magento](https://magento.com/). While doing some browsing we 
came across [this blog post](http://mageinferno.com/blog/deploy-magento-2-digital-ocean-tutum)
to deploy Magento2 on Tutum., which gave us good reference. 

So first we would deploy Magneto on differnet orhestration engines and
then experiment with features like replication, auto-scaling etc. 


TDB

## Credits

- [Nicola Kabar](https://github.com/nicolaka) putting down (dockchat)[https://github.com/nicolaka/dockchat] for [DockerCon EU'15 Tutorial](https://github.com/docker/dceu_tutorials/blob/master/02-orchestration.md)  

- [Mark Shust](https://github.com/markoshust) for providing Magento2 Docker Compose file
https://github.com/mageinferno/magento2-docker-compose
