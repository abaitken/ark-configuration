@echo off

goto :main

:backup
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (%thisscriptdir%\..\..\args\%1.txt) do SET %%i=%%j
if not exist "C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%" goto :eof
call "C:\Data\_backups\backup.cmd" %GameFolder% "C:\Games\%GameFolder%\ShooterGame\Saved\*"
ENDLOCAL

goto :eof

:main
cd /d "%~dp0"
set thisscriptdir=%cd%

call "C:\Data\_backups\backup.cmd" arkcluster "C:\Data\ark-clusters\*"

set maplist=%thisscriptdir%\..\..\maplist.txt
for /f "eol=# tokens=1 delims=" %%a in (%maplist%) do call :backup %%a

pause