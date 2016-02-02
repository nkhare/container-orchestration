```
docker-machine create -d virtualbox dev

Neependras-MacBook-Pro:swarm nkhare$ docker-machine  ls
NAME   ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
dev    -        virtualbox   Running   tcp://192.168.99.115:2376           v1.9.1
Neependras-MacBook-Pro:swarm nkhare$ eval $(docker-machine env dev)
Neependras-MacBook-Pro:swarm nkhare$ docker-machine ls
NAME   ACTIVE   URL          STATE     URL                         SWARM   DOCKER   ERRORS
dev    *        virtualbox   Running   tcp://192.168.99.115:2376           v1.9.1
```


```
$ pwd
Neependras-MacBook-Pro:standalone nkhare$ pwd
/Users/nkhare/work/containers-orchestration/simple/swarm

$ cd standalone
$ Neependras-MacBook-Pro:standalone nkhare$ docker-compose up -d
Starting standalone_db_1
Starting standalone_web_1
$ Neependras-MacBook-Pro:standalone nkhare$ docker-compose ps
      Name                   Command             State           Ports
-------------------------------------------------------------------------------
standalone_db_1    /entrypoint.sh --smallfiles   Up      27017/tcp
standalone_web_1   python webapp.py              Up      0.0.0.0:5000->5000/tcp
```

```
Neependras-MacBook-Pro:standalone nkhare$ docker-machine ip dev
192.168.99.115
```

- Open the browser and access *http://192.168.99.115:5000* 


