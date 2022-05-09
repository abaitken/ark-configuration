@echo off
set confirm=
set /p confirm=Are you sure? [y/N]:
if /i "%confirm%" NEQ "Y" goto :eof
cd /d "%~dp0"
xcopy /y /E "Island\ShooterGame\Saved\Config\WindowsServer\" "C:\Games\ark\ShooterGame\Saved\Config\WindowsServer"
xcopy /y /E "Scorched\ShooterGame\Saved\Config\WindowsServer" "C:\Games\arkse\ShooterGame\Saved\Config\WindowsServer\*.ini"
pause
