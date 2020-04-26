#!/bin/bash

path=$1
todate=$(date +%y%m%d_%H%M)
folder="$path/backups_$todate"
sudo mkdir $folder
#sudo chown devops:devops $folder
file="$folder/backup-$(date + %F).sql"
mysqldump -P 33060 --protocol=tcp -u root -p map --password=streetlity > $file