@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "eol=# tokens=1* delims==" %%i in (C:\Data\ark\args\_shared.txt) do SET %%i=%%j
for /f "eol=# tokens=1* delims==" %%i in (C:\Data\ark\args\gen1.txt) do SET %%i=%%j
for /f "eol=# tokens=1* delims==" %%i in (C:\Data\ark\args\_compose.txt) do SET %%i=%%j
cd /d C:\Games\arkg1\ShooterGame\Binaries\Win64
start ShooterGameServer.exe %Args%
ENDLOCAL
