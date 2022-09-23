@echo off
goto main

:restoreSettings
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (..\args\%1.txt) do SET %%i=%%j

if exist "C:\Games\%GameFolder%" xcopy /y /E "Staging\%AltSaveDirectoryName%\ShooterGame\Saved\Config\WindowsServer\" "C:\Games\%GameFolder%\ShooterGame\Saved\Config\WindowsServer\"
ENDLOCAL
goto :eof

:main
set confirm=
set /p confirm=Are you sure? [y/N]:
if /i "%confirm%" NEQ "Y" goto :eof

cd /d "%~dp0"

for /f "eol=# tokens=1 delims=" %%i in (..\maplist.txt) do call :getSettings %%i

pause
