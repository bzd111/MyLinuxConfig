@echo off
echo Starting 桌面整理
start  "" "D:\program files (x86)\cmcm\kdesk\kdesk64.exe" 
echo Starting Launch
start  "" "D:\program files (x86)\Launchy\Launchy.exe"
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
