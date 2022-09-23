@echo off
goto main

:getSettings
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (..\args\%1.txt) do SET %%i=%%j
if exist "C:\Games\%GameFolder%" copy /y "C:\Games\%GameFolder%\ShooterGame\Saved\Config\WindowsServer\*.ini" "Staging\%AltSaveDirectoryName%\ShooterGame\Saved\Config\WindowsServer\"
ENDLOCAL

goto :eof

:main
cd /d "%~dp0"
for /f "eol=# tokens=1 delims=" %%a in (..\maplist.txt) do call :getSettings %%a
pause
