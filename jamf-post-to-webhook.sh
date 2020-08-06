#!/bin/bash

sn=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')

curl --location --request POST '<YOUR-WEBHOOK-URL-HERE>' \
--header 'Content-Type: application/json' \
--data-raw '{
	"computerName": "'"$(networksetup -getcomputername)"'",
	"date": "'"$(TZ=America/New_York date)"'",
	"serialNumber": "'"$sn"'",
	"userName": "'"$3"'"
}'
