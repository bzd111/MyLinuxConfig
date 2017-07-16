@echo off
echo Starting 桌面整理
start  "" "D:\program files (x86)\cmcm\kdesk\kdesk64.exe" 
REM echo Starting Launch
REM start  "" "D:\program files (x86)\Launchy\Launchy.exe"
echo Starting Everything
start "" "D:\Program Files\Everything\Everything.exe"
echo Starting Wox
start "" "C:\Users\zidy\AppData\Local\Wox\Wox.exe"
echo Starting Evernote
start  "" "D:\Evernote\Evernote.exe"
echo Starting 有道词典
start  "" "D:\program files (x86)\Dict\YodaoDict.exe"
echo Starting 网易云音乐
start  "" "D:\program files (x86)\CloudMusic\cloudmusic.exe"
echo Starting Google
start  "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
echo Starting Jupyter
start jupyter notebook
REM start /wait "" "path"
exit
