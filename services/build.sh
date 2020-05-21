#/bin/bash

docker image rm mysql-streetlity-api
docker build . -t mysql-streetlity-api
