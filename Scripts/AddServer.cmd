@echo off
goto :main

:setupgamedir
if exist "C:\Games\%GameFolder%" echo DONE : Game folder already exists && goto :eof
echo TODO : Copy "C:\Games\ark-next" to "C:\Games\%GameFolder%"
goto :eof

:makedir
if exist "%1" echo DONE : '%1' already exists && goto :eof
echo ACTION : Creating directory '%1'
mkdir "%1"
echo DONE : Directory '%1' created
goto :eof

:main
set scriptsdir=C:\Control\scripts\
set /p ArgName=Arg file name (e.g. island, scorched etc.): 
if "%ArgName%" EQU "" echo ERROR! No value provided. Exiting... && pause && goto :eof
if not exist "%thisscriptdir%..\args\%ArgName%.txt" echo ERROR: Arg file not found! Must be created first. && pause && goto :eof

for /f "eol=# tokens=1* delims==" %%i in (%thisscriptdir%..\args\%ArgName%.txt) do SET %%i=%%j

call :setupgamedir
call :makedir C:\Data\_backups\%GameFolder%
call :makedir C:\Data\_backups\%GameFolder%\rolling
echo TODO : Create update and validation steamcmd scripts
echo TODO : Create start script
echo TODO : Create backup script
pause