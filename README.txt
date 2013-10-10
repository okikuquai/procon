**********CHaserServer.exeを開始すると同時にBGMを流すスクリプト**********

BGM等などの音声ファイルは~/opt/music　に入れてください

set.txtの説明:
	PATH=<~/.wine/drive_c/からのCHaserserver.exeのある階層>
	例：（パスが~/.wine/drive_c/chaser/BugFixedCHaser2012Server/CHaserServer.exeの場合）
		PATH=chaser/BugFixedCHaser2012Server
	
	RATO=<判定の速度>
	例：（対戦中約0.5秒間対戦logが更新されなかったら終了と判定 ※0.5秒よりも少し遅い）
	RATO=5

	FANFARE=<ファンファーレで流すファイル>
	BGMNUM=<abc順の流すファイルの番号>
	(BGMはabc順で順に流します)

***************************************************************************
