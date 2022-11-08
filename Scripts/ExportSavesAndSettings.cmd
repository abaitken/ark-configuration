@echo off
goto :main

:getfiles
for /f "eol=# tokens=1* delims==" %%i in (%thisscriptdir%\..\args\%1.txt) do SET %%i=%%j
if not exist "C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%" goto :eof

echo Copying files for %AltSaveDirectoryName%...
set GameExport=%StagingFolder%\%GameFolder%
mkdir "%GameExport%"
mkdir "%GameExport%\Saved"
mkdir "%GameExport%\Saved\%AltSaveDirectoryName%"
mkdir "%GameExport%\Saved\Config\WindowsServer"

echo TODO : Copy paintings cache
copy "C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%\%map%.ark" "%GameExport%\Saved\%AltSaveDirectoryName%"
copy "C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%\*.arkprofile" "%GameExport%\Saved\%AltSaveDirectoryName%"
copy "C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%\*.arktributetribe" "%GameExport%\Saved\%AltSaveDirectoryName%"
copy "C:\Games\%GameFolder%\ShooterGame\Saved\%AltSaveDirectoryName%\*.arktribe" "%GameExport%\Saved\%AltSaveDirectoryName%"
copy "C:\Games\%GameFolder%\ShooterGame\Saved\Config\WindowsServer\*.ini" "%GameExport%\Saved\Config\WindowsServer"

goto :eof

:main
cd /d "%~dp0"
set thisscriptdir=%cd%
set maplist=%thisscriptdir%\..\maplist.txt
set WorkingFolder=C:\Temp\ExportArk
set StagingFolder=%WorkingFolder%\Staging

if exist "%WorkingFolder%" rmdir /s /q "%WorkingFolder%"
mkdir "%WorkingFolder%"

for /f "eol=# tokens=1 delims=" %%a in (%maplist%) do call :getfiles %%a

echo TODO : Copy clusters
7z a -r -tzip "%WorkingFolder%\Ark-Exilers.zip" "%StagingFolder%\*"

pause