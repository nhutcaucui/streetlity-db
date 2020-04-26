#/bin/bash
echo "Create infrastructure"
docker volume create streetlity-user-volume
echo "Remove old image"
docker image rm mysql-streetlity-user
echo "Build image"
docker build . -t mysql-streetlity-user

echo "Done"
#mysql -u root -p map < map-db-product.sql
#docker exec -i mysql_container mysql -uroot -psecret mysql < db.sql
