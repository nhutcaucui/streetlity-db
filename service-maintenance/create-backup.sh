#!/bin/bash

path=$1
todate=$(date +%y%m%d_%H%M)
folder="$path/service_backups_$todate"
sudo mkdir $folder
#sudo chown devops:devops $folder
file="$folder/backup.sql"
mysqldump -P 33060 --protocol=tcp -u root -p services --password=streetlity > $file
