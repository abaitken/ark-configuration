@echo off
goto :fn_main

:fn_GenerateSetting
SETLOCAL
for /f "eol=# tokens=1* delims==" %%i in (..\args\%1.txt) do SET %%i=%%j

if not exist "Staging\%AltSaveDirectoryName%" ENDLOCAL && goto :eof
echo Building %AltSaveDirectoryName% settings...
call "merge-ini" -o "Staging\%AltSaveDirectoryName%\ShooterGame\Saved\Config\WindowsServer\Game.ini" -l "Template\_Shared\_mergelist-Game.txt" -l "Template\%AltSaveDirectoryName%\_mergelist-Game.txt"
echo.>> "Staging\%AltSaveDirectoryName%\ShooterGame\Saved\Config\WindowsServer\Game.ini"
call "merge-ini" -o "Staging\%AltSaveDirectoryName%\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini" -l "Template\_Shared\_mergelist-GameUserSettings.txt" -l "Template\%AltSaveDirectoryName%\_mergelist-GameUserSettings.txt"
echo.>> "Staging\%AltSaveDirectoryName%\ShooterGame\Saved\Config\WindowsServer\GameUserSettings.ini"

ENDLOCAL
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

for /f "eol=# tokens=1 delims=" %%i in (..\maplist.txt) do call :fn_GenerateSetting %%i

pause
