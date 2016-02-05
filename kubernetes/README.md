# [Kubernetes](http://kubernetes.io/)

## k8s architecture
![k8s architecture](http://blog.arungupta.me/wp-content/uploads/2015/01/kubernetes-architecture.png)


## k8s primary components (https://docs.google.com/presentation/d/1b1jH84QkY2LFonwqsOeEvKdUNTZ6Dl9F4uet4WNrdmQ/)

### Node: 

Physical or virtual machine running Kubernetes, onto which pods can be scheduled,

### Container

A sealed application package (Docker)

### Pod: 

A co-located group of Containers and Volumes
	example: content syncer & web server

### Controller

A loop that drives current state towards desired state
	example: replication controller

### Service

A set of running pods that work together
	example: load-balanced backends

### Labels

 Identifying metadata attached to other objects
	example: phase=canary vs. phase=prod

### Selector
 
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

## How Kubernetes satisfies Container Orchestration requirements 

### Multiple Nodes to be part of a cluster
- Kubernetes Master
- Kubernetes Slaves

### Container Engines
- Docker 
- Rkt (coming soon)

### KV value store supprot
- etcd

### [Network for containers of different nodes to talk to each other](http://kubernetes.io/v1.0/docs/admin/networking.html)
- Flannel 
- OpenVswitch
- Weave
- Calico

### One or more cluster master to manage the cluster and schedule the jobs/tasks  
- Kubernetes Master

### [Scheduler to schedule the containers on nodes based on](http://kubernetes.io/v1.1/docs/devel/scheduler.html)
- Predicates
- Priorities 

### Service discovery within the cluster
- [Cluster Internal DNS server](https://github.com/kubernetes/kubernetes/tree/v1.0.6/cluster/addons/dns) 
- Through environment variables 
- Load balancer, HA proxy

![service discovert] (http://kubernetes.io/v1.0/docs/user-guide/services-overview.png)

### Kubernetes Volumes
- emptyDir
- hostPath
- gcePersistentDisk
- awsElasticBlockStore
- nfs
- iscsi
- glusterfs
- rbd
- gitRepo
- secret
- persistentVolumeClaim
 

## Links
[Kubernetes Presentation](https://goo.gl/Ueyw6t)
