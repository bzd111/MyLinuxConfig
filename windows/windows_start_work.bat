@echo off
echo Starting ��������
start  "" "D:\program files (x86)\cmcm\kdesk\kdesk64.exe" 
echo Starting Launch
start  "" "D:\Launchy\Launchy.exe"
echo Starting Evernote
start  "" "D:\Evernote\Evernote.exe"
echo Starting �е��ʵ�
start  "" "D:\Program Files (x86)\Dict\YodaoDict.exe"
echo Starting ����������
start  "" "D:\Netease\CloudMusic\cloudmusic.exe"
echo Starting Google
start  "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
echo Starting DingTalk
start "" "D:\DingDing\main\current\DingTalk.exe"
echo Starting VirtualBox
start "" "D:\VirtualBox\VirtualBox.exe"
echo Starting VM auto_centons
cd /d E:\vagrant\vagrant auto centos
start vagrant up
echo Starting VM test_all
cd /d E:\vagrant\vagrant test_all
start vagrant up
REM start /wait "" "path"
exit
