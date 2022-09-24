@echo off
goto main

:updateGame
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (%thisscriptdir%..\args\%1.txt) do SET %%i=%%j
if exist "C:\Games\%GameFolder%" SET GameFolderPresent=true
if exist "%scriptsdir%%prefix%%GameFolder%.txt" SET UpdateScriptPresent=true

echo.
echo +++++++++++++++++++++++++++++++++++++++++
echo Updating %SessionName%...
echo -----------------------------------------
if "%GameFolderPresent%" EQU "true" if "%UpdateScriptPresent%" EQU "true" steamcmd +runscript %scriptsdir%%prefix%%GameFolder%.txt
echo -----------------------------------------
if "%GameFolderPresent%" NEQ "true" echo WARNING: Game folder not found!
if "%UpdateScriptPresent%" NEQ "true" echo WARNING: Upgrade script not found!
echo +++++++++++++++++++++++++++++++++++++++++
echo.
ENDLOCAL

goto :eof

:main

set scriptsdir=C:\Control\scripts\
set thisscriptdir=%~dp0
set maplist=%thisscriptdir%..\maplist.txt
set prefix=update_

title Game Server Updates
call %scriptsdir%_generate_scripts.cmd

cd /d C:\steamcmd

for /f "eol=# tokens=1 delims=" %%a in (%maplist%) do call :updateGame %%a
pause
