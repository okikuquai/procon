#!/bin/bash
MYIP=$1
while :
do
	HOT=`netstat -anA inet | grep "50000" | grep "${MYIP}" | awk '{print $6}'`
	COOL=`netstat -anA inet | grep "40000" | grep "${MYIP}" | awk '{print $6}'`


	if [ "${HOT}" = "ESTABLISHED" -a "${COOL}" = "ESTABLISHED" ]
	then
		break
	fi
	sleep 1
done
