FROM mysql:latest

ADD user-db-product.sql user-db-product.sql
#ADD my.cnf /etc/mysql/my.cnf
RUN mkdir -p /var/lib/mysql
RUN mkdir -p /etc/mysql/conf.d


ENV MYSQL_USER devops
ENV MYSQL_PASSWORD streetlity

USER mysql
 
EXPOSE 3306 33060
CMD ["mysqld", "--lc_messages_dir=/usr/share/mysql"]
