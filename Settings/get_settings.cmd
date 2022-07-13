@echo off
cd /d "%~dp0"
copy /y "C:\Games\ark\ShooterGame\Saved\Config\WindowsServer\*.ini" "Island\ShooterGame\Saved\Config\WindowsServer\"
copy /y "C:\Games\arkse\ShooterGame\Saved\Config\WindowsServer\*.ini" "Scorched\ShooterGame\Saved\Config\WindowsServer\"
copy /y "C:\Games\arkab\ShooterGame\Saved\Config\WindowsServer\*.ini" "Aberration\ShooterGame\Saved\Config\WindowsServer\"
copy /y "C:\Games\arkex\ShooterGame\Saved\Config\WindowsServer\*.ini" "Extinction\ShooterGame\Saved\Config\WindowsServer\"
pause
