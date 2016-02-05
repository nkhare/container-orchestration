```
Neependras-MBP:kubernetes nkhare$ kubectl get nodes
NAME                             LABELS                                                  STATUS    AGE
gke-devconf-af3b3f59-node-i1sv   kubernetes.io/hostname=gke-devconf-af3b3f59-node-i1sv   Ready     21m
gke-devconf-af3b3f59-node-kvw0   kubernetes.io/hostname=gke-devconf-af3b3f59-node-kvw0   Ready     21m
gke-devconf-af3b3f59-node-ruu8   kubernetes.io/hostname=gke-devconf-af3b3f59-node-ruu8   Ready     21m

Neependras-MBP:kubernetes nkhare$ kubectl get svc
NAME         CLUSTER_IP      EXTERNAL_IP   PORT(S)     SELECTOR              AGE
db           10.59.253.130   <none>        27017/TCP   app=db,tier=backend   31s
kubernetes   10.59.240.1     <none>        443/TCP     <none>                23m
Neependras-MBP:kubernetes nkhare$ vim frontend-service.yaml
Neependras-MBP:kubernetes nkhare$ kubectl create -f frontend-service.yaml
service "frontend" created
Neependras-MBP:kubernetes nkhare$ kubectl create -f frontend-controller.yaml
replicationcontroller "frontend" created
Neependras-MBP:kubernetes nkhare$ kubectl get svc
NAME         CLUSTER_IP      EXTERNAL_IP   PORT(S)     SELECTOR                     AGE
db           10.59.253.130   <none>        27017/TCP   app=db,tier=backend          1m
frontend     10.59.244.2                   5000/TCP    app=dockchat,tier=frontend   11s
kubernetes   10.59.240.1     <none>        443/TCP     <none>                       24m
Neependras-MBP:kubernetes nkhare$ kubectl get pods
NAME             READY     STATUS    RESTARTS   AGE
db-k56bv         1/1       Running   0          1m
frontend-jxvwh   1/1       Running   0          23s


Neependras-MBP:kubernetes nkhare$ kubectl get svc
NAME         CLUSTER_IP      EXTERNAL_IP       PORT(S)     SELECTOR                     AGE
db           10.59.253.130   <none>            27017/TCP   app=db,tier=backend          2m
frontend     10.59.244.2     104.196.109.243   5000/TCP    app=dockchat,tier=frontend   1m
kubernetes   10.59.240.1     <none>            443/TCP     <none>                       25m

eependras-MBP:kubernetes nkhare$ kubectl scale --replicas=3 replicationcontrollers frontend
replicationcontroller "frontend" scaled
Neependras-MBP:kubernetes nkhare$ kubectl get pods
NAME             READY     STATUS    RESTARTS   AGE
db-k56bv         1/1       Running   0          4m
frontend-93xrg   0/1       Pending   0          7s
frontend-jxvwh   1/1       Running   0          3m
frontend-q3hjo   0/1       Pending   0          7s
Neependras-MBP:kubernetes nkhare$ kubectl get pods
NAME             READY     STATUS    RESTARTS   AGE
db-k56bv         1/1       Running   0          5m
frontend-93xrg   1/1       Running   0          35s
frontend-jxvwh   1/1       Running   0          4m
frontend-q3hjo   1/1       Running   0          35s
```


