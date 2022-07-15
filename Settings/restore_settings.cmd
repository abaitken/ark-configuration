@echo off
set confirm=
set /p confirm=Are you sure? [y/N]:
if /i "%confirm%" NEQ "Y" goto :eof
cd /d "%~dp0"

for /f "eol=# tokens=1,2 delims=," %%i in (list.txt) do if exist "C:\Games\%%j" xcopy /y /E "Backup\%%i\ShooterGame\Saved\Config\WindowsServer\" "C:\Games\%%j\ShooterGame\Saved\Config\WindowsServer\"
pause
