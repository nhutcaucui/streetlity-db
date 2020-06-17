#/bin/bash

docker image rm -f mysql-streetlity-api
docker build . -t mysql-streetlity-api
