@echo off
cd /d %~dp0
cd backups
:: Get timestamp (convert 08/04/2018 16:18:51.04 to yyyy-mm-dd-hh-mm)
::Character indexes 0123456789012345678901
::%date% value      08/04/2018
::%time% value      16:18:51.04

SET timestamp=%date:~6,4%-%date:~3,2%-%date:~0,2%-%time:~0,2%-%time:~3,2%-%time:~6,2%
"c:\Program Files\7-Zip\7z.exe" a -t7z -r "%timestamp%.7z" "C:\Games\ark\ShooterGame\Saved\*.*"
