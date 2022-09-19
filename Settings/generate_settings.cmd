@echo off
goto :fn_main

:fn_GenerateSetting
if not exist "Staging\%1" goto :eof
echo Building %1 settings...
call "merge-ini" -o "Staging\%1\ShooterGame\Saved\Config\WindowsServer\Game.ini" -l "Template\_Shared\_mergelist-Game.txt" -l "Template\%1\_mergelist-Game.txt"
echo.>> "Staging\%1\ShooterGame\Saved\Config\WindowsServer\Game.ini"
call "merge-ini" -o "Staging\%1\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini" -l "Template\_Shared\_mergelist-GameUserSettings.txt" -l "Template\%1\_mergelist-GameUserSettings.txt"
echo.>> "Staging\%1\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini"
goto :eof

:fn_main
cd /d "%~dp0"

SETLOCAL ENABLEDELAYEDEXPANSION
SET MODIDS=
echo [ModInstaller]>Template\_Shared\Mods-Game.txt
for /f "eol=# tokens=1* delims=;" %%j in (Template\_Shared\_list-Mods.txt) do echo ModIDS=%%k>>Template\_Shared\Mods-Game.txt

for /f "eol=# tokens=1* delims=;" %%j in (Template\_Shared\_list-Mods.txt) do SET MODIDS=!MODIDS!,%%k
echo [ServerSettings]>Template\_Shared\Mods-GameUserSettings.txt
echo ActiveMods=%MODIDS:~1%>>Template\_Shared\Mods-GameUserSettings.txt

ENDLOCAL

for /f "eol=# tokens=1,2 delims=," %%i in (list.txt) do call :fn_GenerateSetting %%i

pause
