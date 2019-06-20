#!/bin/bash

url="http://10.13.0.160/?page=e43ad1fdc54babe674da7c7b8f0127bde61de3fbe01def7d00f151c2fcca6d1c"
referer="Referer: https://www.nsa.gov/"
user_agent="User-Agent: ft_bornToSec"
host="Host: 10.13.0.160"

req=$(curl -H "${referer}" -H "${user_agent}" -X GET ${url} | grep "flag")
echo ${req}
