#!/bin/bash
#test.sh   Proconserver Sraert Sprict
#
#		Written by Yuki Kikuchi <kikku650@gmail.com>.
#
#
EXEPATH=`grep "PATH" config.txt | awk -F[=] '{print $2}'`
RATE=`grep "RATE" config.txt | awk -F[=] '{print $2}'`
NUM=`grep "BGMNUM" config.txt | awk -F[=] '{print $2}'`
FANFARE=`grep "FANFARE" config.txt | awk -F[=] '{print $2}'`
MYIP=`sudo ifconfig  eth0 | awk '{print $1}' | grep inetアドレス | awk -F[:] '{print $2}'`



#Choose BGM
cd music
if [ "`ls -l *.mp3 *.wav | grep rw | head -n ${NUM} | tail -n 1 | awk '{print $9}'`" = ${FANFARE} ];
	then 
		NUM=`expr ${NUM} + 1`
fi

if [ "`ls -l | grep rw | wc -l`" -gt "${NUM}" ];
then
	NUM=0
fi

BGM=`ls -l | grep rw | head -n ${NUM} | tail -n 1 | awk '{print $9}'`
NUM=`expr ${NUM} + 1`
cd ~/opt
sed -i -e '4d' config.txt
echo "BGMNUM=${NUM}" >> config.txt



#launch CHaserServer.exe in wine
echo 'start CHaserServer.exe'
wine ~/.wine/drive_c/${EXEPATH}/CHaserServer.exe &



#loop Until connect cool and hot
sh Connect.sh $MYIP



#Get CHaserServer.exe's windowid 
ID1=`wmctrl -l | grep 全国情報技術教育研究会 | awk '{print $1}' | head -n 1`
ID2=`wmctrl -l | grep 全国情報技術教育研究会 | awk '{print $1}' | tail -n 1`
ID1_D=`echo $((${ID1}))`
ID2_D=`echo $((${ID2}))`
if [ $ID1_D -gt $ID2_D ];
then
	WINDOWID=$ID1
else
	WINDOWID=$ID2
fi



#launch swatch & xev for watch keyevent
sh ChackKeyEvent.sh $WINDOWID
echo Game Started



#Play BGM
mplayer ~/opt/music/${BGM} -loop 0 -vo null < /dev/null > /dev/null 2>&1 &



#Get the log file for this game
cd ~/.wine/drive_c/${EXEPATH}/log
LOG=`ls -1t *.txt | head -1`



#Loop untill the end of the game
sh ~/opt/Game.sh $LOG $RATE



#BGM stop
kill -9 `ps aux | grep mplayer | grep null | awk '{print $2}'`



#途中で閉じられたら再生しない
if [ -n "`ps aux | grep CHaserServer.exe | grep -v grep`" ];
then
	echo "game ended"
	mplayer ~/opt/music/${FANFARE}
else
	echo "CHaserServer.exe stopped"
fi

echo -n > ~/opt/swatch/keylog.log
