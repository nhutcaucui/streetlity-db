echo "STOP RUNNING COMMON MYSQL CONTAINER"
#docker exec mysql_container mysqld --shutdown
docker stop -t 30 mysql_container
docker rm -f mysql_container
echo "DONE STOPPING"
#docker build . -t mysql:latest --no-cache
echo "STARTING RUNNING COMMON MYSQL CONTAINER"
docker run --name mysql_container -d \
           -v common_mysql_volume:/var/lib/mysql \
                --network common-net \
		-p 33060:3306 \
		-e MYSQL_ROOT_PASSWORD=streetlity \
                --restart always \
           mysql_container:latest

#docker exec -i /usr/local/mysql/support-files/mysql.server start

docker exec -i mysql_container mysql -u root -p streetlity < map-db-product.sql
echo "DONE STARTING"
