# Mesos  Marathon 
### Multiple Nodes to be part of a cluster

### Unique ID/Token to bind all the nodes in a unique cluster

### Container Engine
- Docker 

### Means of communication between nodes of a Cluster

### Single source of truth about configuration for nodes
-  ZK

### Network for containers of different nodes to talk to each other

### Scheduler to schedule the containers on nodes based on

### Service discovery within the cluster
- Mesos-DNS

### Single point to communication from outside world



## Mesos
http://mesos.apache.org/assets/img/documentation/architecture3.jpg


http://mesos.apache.org/assets/img/documentation/architecture-example.jpg



```

{
    "id": "basic-0", 
    "cmd": "while [ true ] ; do echo 'Hello Marathon' ; sleep 5 ; done",
    "cpus": 0.1,
    "mem": 10.0,
    "instances": 1
}

```



```


```



# Links

https://github.com/mesosphere/presentations/blob/gh-pages/2015-08-17-deploying-containers-in-production-and-at-scale/containercon.pdf

