@echo off
cd /d "%~dp0"

echo Map,SessionName,Port,PortRawUDP,QueryPort,RCONPort,AltSaveDirectoryName> temp.txt
for /f %%i in (maplist.txt) do (
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "eol=# tokens=1* delims==" %%j in (args\args_%%i.txt) do SET %%j=%%k
echo !map!,!SessionName!,!Port!,!PortRawUDP!,!QueryPort!,!RCONPort!,!AltSaveDirectoryName!>> temp.txt
ENDLOCAL
)

call ConsoleTable temp.txt
del temp.txt

pause