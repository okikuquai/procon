#!/bin/bash
#
#	Install sprict for chaser playBGM 
#	未完成
#


#関連ソフトのインストール
sudo apt-get install swatch
sudo apt-get install wine
sudo apt-get install wmctrl
sudo apt-get install sleepenh
sudo apt-get install git

#インストールフォルダの作成
cd ~/
mkdir opt
cd opt
mkdir music
mkdir swatch
cd swatch
touch start.swatchrc
touch keylog.log
echo "watchfor /(keysym 0x20, space)/" >> start.swatchrc
echo "    quit" >> start.swatchrc



#gitからソースをダウンロード
cd ~/opt
git clone http://git1.expand.co.jp/git/procon-u16.sv1
cd ~/opt/procon-u16.sv1
mv play.sh ~/opt
mv Connect.sh ~/opt
mv ChackKeyEvent.sh ~/opt
mv Game.sh ~/opt
mv config.txt ~/opt
mv README.txt ~/opt
cd ~/opt
rm -rf procon-u16.sv1/

