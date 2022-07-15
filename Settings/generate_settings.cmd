@echo off
goto :fn_main

:fn_GenerateSetting
if not exist "Backup\%1" goto :eof
echo Building %1 settings...
"merge-ini.exe" -o "Backup\%1\ShooterGame\Saved\Config\WindowsServer\Game.ini" -l "Template\_Shared\_mergelist-Game.txt" -l "Template\%1\_mergelist-Game.txt"
"merge-ini.exe" -o "Backup\%1\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini" -l "Template\_Shared\_mergelist-GameUserSettings.txt" -l "Template\%1\_mergelist-GameUserSettings.txt"
goto :eof

:fn_main
cd /d "%~dp0"

for /f "eol=# tokens=1,2 delims=," %%i in (list.txt) do call :fn_GenerateSetting %%i

pause
