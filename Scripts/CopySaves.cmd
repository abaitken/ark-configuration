@echo off
goto :main

:copySave
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (..\args\%1.txt) do SET %%i=%%j
echo Copy %SessionName%...
if exist "C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%\%map%.ark" copy /y C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%\%map%.ark ..\backups\%map%.ark
ENDLOCAL
goto :eof

:main
cd /d "%~dp0"

for /f "eol=# tokens=1 delims=" %%a in (..\maplist.txt) do call :copySave %%a

pause