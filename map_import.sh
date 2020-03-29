#!/usr/bin/env bash

username=$1
password=$2
database=$3
file="map-db.sql"

if [ ! "$4" == "" ]; then
    file=$4
fi

mysql -u ${username} -p ${database} < ${file}