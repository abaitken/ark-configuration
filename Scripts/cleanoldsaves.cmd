@echo off
goto :main

:clearlogs
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (%thisscriptdir%\..\args\%1.txt) do SET %%i=%%j
if not exist "C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%" goto :eof

dir /b /s C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%\ >> __saved_filelist.txt

ENDLOCAL
goto :eof

:main
cd /d "%~dp0"
set thisscriptdir=%cd%

if exist __saved_filelist.txt del __saved_filelist.txt
if exist __deletelist.txt del __deletelist.txt
set maplist=%thisscriptdir%\..\maplist.txt
for /f "eol=# tokens=1 delims=" %%a in (%maplist%) do call :clearlogs %%a

findstr /R /C:"_[0-9][0-9]\.[0-9][0-9]\.[0-9][0-9][0-9][0-9]_[0-9][0-9]\.[0-9][0-9]\.[0-9][0-9]\.ark$" __saved_filelist.txt >> __deletelist.txt

echo The following files will be deleted:
echo.
type __deletelist.txt
echo.
echo Delete these files?
set confirm=
set /P confirm=Continue [y/N]? 

if /i "%confirm%" equ "y" for /f "delims=" %%i in (__deletelist.txt) do del "%%i"

if exist __saved_filelist.txt del __saved_filelist.txt
if exist __deletelist.txt del __deletelist.txt

pause
