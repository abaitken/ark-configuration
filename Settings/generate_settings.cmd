@echo off
cd /d "%~dp0"

for /f "eol=# tokens=1,2 delims=," %%i in (list.txt) do (
"merge-ini.exe" -o "%%i\ShooterGame\Saved\Config\WindowsServer\Game.ini" -m "Template\Shared\Game.txt" -m "Template\%%i\Game.txt"
"merge-ini.exe" -o "%%i\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini" -m "Template\Shared\GameUserSettings.txt" -m "Template\%%i\GameUserSettings.txt"
)

pause
