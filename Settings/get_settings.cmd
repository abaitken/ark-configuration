@echo off
cd /d "%~dp0"
for /f "eol=# tokens=1,2 delims=," %%i in (list.txt) do if exist "C:\Games\%%j" copy /y "C:\Games\%%j\ShooterGame\Saved\Config\WindowsServer\*.ini" "Staging\%%i\ShooterGame\Saved\Config\WindowsServer\"

pause
