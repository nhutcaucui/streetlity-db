#/bin/bash
echo "Create infrastructure"
docker volume create mysql-streetlity-user-volume
echo "Remove old image"
docker image rm mysql-streetlity-user
echo "Build image"
docker build . -t mysql-streetlity-user

echo "Done"

