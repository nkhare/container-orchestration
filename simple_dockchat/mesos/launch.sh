#!/bin/bash

if [ "$#" -ne 1 ]; then
    	echo "script takes json file as an argument"
	exit 1;
fi

curl -X POST -H "Content-Type: application/json" http://mesos:mesos@10.141.141.10:8080/v2/apps -d@"$@"
