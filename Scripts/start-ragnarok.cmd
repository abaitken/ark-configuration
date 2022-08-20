@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "eol=# tokens=1* delims==" %%i in (C:\Data\ark\args\_shared.txt) do SET %%i=%%j
for /f "eol=# tokens=1* delims==" %%i in (C:\Data\ark\args\ragnarok.txt) do SET %%i=%%j
for /f "eol=# tokens=1* delims==" %%i in (C:\Data\ark\args\_compose.txt) do SET %%i=%%j
cd /d C:\Games\arkrag\ShooterGame\Binaries\Win64
start ShooterGameServer.exe %Args%
ENDLOCAL
