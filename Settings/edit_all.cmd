@echo off
cd /d "%~dp0"

for /f "eol=# tokens=1,2 delims=," %%i in (list.txt) do (
"C:\Program Files\Notepad++\notepad++.exe" "%%i\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini" 
timeout /1
"C:\Program Files\Notepad++\notepad++.exe" "%%i\ShooterGame\Saved\Config\WindowsServer\Game.ini"
timeout /1
)

