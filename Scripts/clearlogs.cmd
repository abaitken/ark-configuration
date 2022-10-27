@echo off
goto :main

:clearlogs
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (%thisscriptdir%\..\args\%1.txt) do SET %%i=%%j
if not exist "C:\Games\%GameFolder%\ShooterGame\Saved\Logs" goto :eof

echo Clearing logs for %SessionName%...
del C:\Games\%GameFolder%\ShooterGame\Saved\Logs\*.log

ENDLOCAL
goto :eof

:main
cd /d "%~dp0"
set thisscriptdir=%cd%

set maplist=%thisscriptdir%\..\maplist.txt
for /f "eol=# tokens=1 delims=" %%a in (%maplist%) do call :clearlogs %%a

pause
