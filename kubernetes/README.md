## Kubernetes

k8s architecture


k8s primary components (https://docs.google.com/presentation/d/1b1jH84QkY2LFonwqsOeEvKdUNTZ6Dl9F4uet4WNrdmQ/)

#### Node: 

Physical or virtual machine running Kubernetes, onto which pods can be scheduled,

#### Container

A sealed application package (Docker)

#### Pod: 

A co-located group of Containers and Volumes
	example: content syncer & web server

#### Controller

A loop that drives current state towards desired state
	example: replication controller

#### Service

A set of running pods that work together
	example: load-balanced backends

#### Labels

 Identifying metadata attached to other objects
	example: phase=canary vs. phase=prod

#### Selector
 
A query against labels, producing a set result
	example: all pods where label phase == prod


### Sample Replication Controller file

```
apiVersion: v1
kind: ReplicationController
metadata:
  name: frontend
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: dockchat
        tier: frontend
    spec:
      containers:
      - name: chat
        image: nkhare/dockchat:v1
        env:
        - name: GET_HOSTS_FROM
          value: dns
        ports:
        - containerPort: 5000

```


### Sample Service file

```
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: dockchat
    tier: frontend
spec:
  type: LoadBalancer
  ports:
  - port: 5000
  selector:
    app: dockchat
    tier: frontend
```

 
### Multiple Nodes to be part of a cluster

### Unique ID/Token to bind all the nodes in a unique cluster

### Container Engine
- Docker 

### Means of communication between nodes of a Cluster

### Single source of truth about configuration for nodes
- Key-Value Store 

### Network for containers of different nodes to talk to each other
- VxLAN 

### Scheduler to schedule the containers on nodes based on

### Service discovery within the cluster
- Internal DNS server
- Through environment variables 

### Single point to communication from outside world
- Built in Load balancer, HA proxy

### Shared 

### Features
Rolling Updates


## Links

[Kubernetes Presentation](https://goo.gl/Ueyw6t)
