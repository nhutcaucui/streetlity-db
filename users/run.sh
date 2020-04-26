#/bin/bash

echo "STOP RUNNING COMMON MYSQL CONTAINER"
#docker exec mysql-streetlity-user mysqld --shutdown
docker stop -t 30 mysql-streetlity-user
docker rm -f mysql-streetlity-user
echo "DONE STOPPING"
#docker build . -t mysql:latest --no-cache
echo "STARTING RUNNING COMMON MYSQL CONTAINER"
docker run --name mysql-streetlity-user -d \
           -v common_mysql_volume:/var/lib/mysql \
                --network common-net \
		-p 33061:3306 \
		-e MYSQL_ROOT_PASSWORD=streetlity \
                --restart always \
           mysql-streetlity-user:latest

echo "AWAIT CONTAINER BEING UP"
sleep 3
mysql -P 33061 --protocol=tcp -u root --password=streetlity --reconnect < user-db-product.sql
#mysql -P 33061 --protocol=tcp -u root --password=streetlity < dummyinsert.sql
#echo "DONE STARTING"
