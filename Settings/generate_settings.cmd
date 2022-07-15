@echo off
cd /d "%~dp0"

for /f "eol=# tokens=1,2 delims=," %%i in (list.txt) do (
echo Building %%i settings...
"merge-ini.exe" -o "Backup\%%i\ShooterGame\Saved\Config\WindowsServer\Game.ini" -l "Template\Shared\_mergelist-Game.txt" -m "Template\%%i\Game.txt"
"merge-ini.exe" -o "Backup\%%i\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini" -l "Template\Shared\_mergelist-GameUserSettings.txt" -m "Template\%%i\GameUserSettings.txt"
)

pause
