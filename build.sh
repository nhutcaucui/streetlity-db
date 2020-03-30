#/bin/bash

docker image rm mysql_container
docker build . -t mysql_container