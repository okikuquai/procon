#!/bin/bash
LOG=$1
RATE=$2
CNT=0
DAT=`du -b ${LOG} | awk '{print $1}'`
OLD_DAT=${DAT}
while [ "${DAT}" = "${OLD_DAT}" ]
do
	DAT=`du -b ${LOG} | awk '{print $1}'`
	OLD_DAT=`du -b ${LOG} | awk '{print $1}'`
done



#Loop untill the end of the game
while [ $CNT -lt $RATE ]
do
	DAT=`du -b ${LOG} | awk '{print $1}'`
	if [ "${DAT}" = "${OLD_DAT}" ];
	then
		CNT=`expr ${CNT} + 1`
	else
		CNT=0
	fi
	OLD_DAT=$DAT
	echo ${DAT}
	sleepenh 0.1
done
