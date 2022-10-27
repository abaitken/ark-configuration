@echo off
goto :main

:updatemods
echo @ShutdownOnFailedCommand 0 //set to 0 if updating multiple servers at once>steamcmd-arknext-script.txt
echo @NoPromptForPassword 1>>steamcmd-arknext-script.txt
echo force_install_dir C:\Games\ark-next>>steamcmd-arknext-script.txt
echo login anonymous>>steamcmd-arknext-script.txt
echo app_update 376030>>steamcmd-arknext-script.txt
echo quit>>steamcmd-arknext-script.txt

echo @ShutdownOnFailedCommand 0 //set to 0 if updating multiple servers at once>steamcmd-mods-script.txt
echo @NoPromptForPassword 1>>steamcmd-mods-script.txt
echo force_install_dir C:\Games\ark-next\Engine\Binaries\ThirdParty\SteamCMD\Win64>>steamcmd-mods-script.txt
echo login anonymous>>steamcmd-mods-script.txt
for /f "eol=# tokens=1* delims=;" %%j in (..\Settings\Template\_Shared\_list-Mods.txt) do echo workshop_download_item 346110 %%k>>steamcmd-mods-script.txt
echo quit>>steamcmd-mods-script.txt

cd /d C:\Games\ark-next\Engine\Binaries\ThirdParty\SteamCMD\Win64
::steamcmd +runscript "%cd%\steamcmd-arknext-script.txt"
::steamcmd +runscript "%cd%\steamcmd-mods-script.txt"

goto :eof

:copymods
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (%thisscriptdir%\..\args\%1.txt) do SET %%i=%%j
SET Destination=/cygdrive/C/Games/%GameFolder%/Engine/Binaries/ThirdParty/SteamCMD

echo Syncing mods for %1...
echo TODO : !!! "C:\Software\DeltaCopyRaw\rsync" -itvrh --delete --stats --modify-window=1 "%Source%" "%Destination%"

ENDLOCAL
goto :eof

:main
cd /d "%~dp0"
set thisscriptdir=%cd%

call :updatemods

SET Source=/cygdrive/C/Games/ark-next/Engine/Binaries/ThirdParty/SteamCMD/Win64

set maplist=%thisscriptdir%\..\maplist.txt
for /f "eol=# tokens=1 delims=" %%a in (%maplist%) do call :copymods %%a
pause
