#/bin/bash

docker image rm mysql_container
docker build . -t mysql_container

#mysql -u root -p map < map-db-product.sql
#docker exec -i mysql_container mysql -uroot -psecret mysql < db.sql
