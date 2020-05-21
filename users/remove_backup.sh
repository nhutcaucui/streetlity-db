#!/bin/bash

folder=$1
echo $folder
array=($(ls $folder))
todate=$(date +%y%m%d)
for i in "${array[@]}"
do
if [[ $i == *"lock"* ]]; then
  echo "This backup is locked!"
  continue
fi
        thedate=$(date -r $folder/$i +%y%m%d)
        datediff=$(echo $(( ($(date --date=$todate +%s) - $(date --date=$thedate +%s) )/(60*60*24) )))
        echo $datediff
        if [ $datediff -ge 2 ]
        then
        		echo "Removing folder" $folder/$i
                rm -r $folder/$i
        fi
done

echo Done
