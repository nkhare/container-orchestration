# Mesos  Marathon 

![Mesos Architecture](http://mesos.apache.org/assets/img/documentation/architecture3.jpg)

![Mesos Arch](http://mesos.apache.org/assets/img/documentation/architecture-example.jpg)

## How Kubernetes satisfies Container Orchestration requirements 

### Multiple Nodes to be part of a cluster
Mesos Master and slave

### Container Engine
- Docker 

### Single source of truth about configuration for master/nodes
-  ZooKeeper

### [Network for containers of different nodes to talk to each other](http://mesos.apache.org/documentation/latest/networking-for-mesos-managed-containers/)
![Mesos Networking for containers](http://mesos.apache.org/assets/img/documentation/networking-architecture.png)

### Scheduler to schedule the containers on nodes based on
Marathon

### Service discovery within the cluster
- Mesos-DNS
- Marathon-lb and HA Proxy

### Single point to communication from outside world
HA Proxy


```
{
    "id": "basic-0", 
    "cmd": "while [ true ] ; do echo 'Hello Marathon' ; sleep 5 ; done",
    "cpus": 0.1,
    "mem": 10.0,
    "instances": 1
}
```


### Sample Docker Task

```
{
  "id": "basic-3",
  "cmd": "python3 -m http.server 8080",
  "cpus": 0.5,
  "mem": 32.0,
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "python:3",
      "network": "BRIDGE",
      "portMappings": [
        { "containerPort": 8080, "hostPort": 0 }
      ]
    }
  }
}
```



# Links

https://github.com/mesosphere/presentations/blob/gh-pages/2015-08-17-deploying-containers-in-production-and-at-scale/containercon.pdf

