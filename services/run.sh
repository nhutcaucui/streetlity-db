#/bin/bash

echo "STOP RUNNING COMMON MYSQL CONTAINER"
#docker exec mysql-streetlity-api mysqld --shutdown
docker stop -t 30 mysql-streetlity-api
docker rm -f mysql-streetlity-api
echo "DONE STOPPING"
#docker build . -t mysql:latest --no-cache
echo "STARTING RUNNING COMMON MYSQL CONTAINER"
docker run --name mysql-streetlity-api -d \
           -v common_mysql_volume:/var/lib/mysql \
                --network common-net \
		-p 33060:3306 \
		-e MYSQL_ROOT_PASSWORD=streetlity \
                --restart always \
           mysql-streetlity-api:latest

echo "AWAIT CONTAINER BEING UP"
sleep 3
mysql -P 33060 --protocol=tcp -u root --password=streetlity --reconnect < map-db-product.sql
mysql -P 33060 --protocol=tcp -u root --password=streetlity < dummyinsert.sql
#echo "DONE STARTING"
