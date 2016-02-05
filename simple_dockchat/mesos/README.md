## Setup the mesos stack 

```
$ git clone https://github.com/ypg-data/mesos-stack.git
$ cd vagrant
$ vagrat up
```

After the setup following user interfaces would be available

Mesos: http://10.141.141.10:5050/
Marathon: http://10.141.141.10:8080/
Chronos: http://10.141.141.10:4400/

###  Update the */etc/resolv.conf* on all nodes to relfect following:-
```
search marathon.mesos
nameserver 10.141.141.10
```


### Create the db service 
```
$ bash launch.sh db.json
```

### Create the front service
```
$ bash launch.sh frontend.json
```
