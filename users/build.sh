#/bin/bash

docker image rm mysql-streetlity-user
docker build . -t mysql-streetlity-user

#mysql -u root -p map < map-db-product.sql
#docker exec -i mysql_container mysql -uroot -psecret mysql < db.sql
