#!/bin/bash

path=$1
todate=$(date +%y%m%d_%H%M)
folder="$path/user_backups_$todate"
sudo mkdir $folder
#sudo chown devops:devops $folder
file="$folder/backup-$(date + %F).sql"
mysqldump -P 33060 --protocol=tcp -u root -p user --password=streetlity > $file
