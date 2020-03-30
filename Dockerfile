FROM mysql/mysql-server:latest

ADD map-db-product.sql map-db-product.sql
ADD ./my.cnf /etc/mysql/my.cnf
RUN mkdir -p /var/lib/mysql
RUN mkdir -p /etc/mysql/conf.d

RUN mysql -u root -p map < map-db-product.sql

EXPOSE 3306 33060
CMD ["mysqld"]