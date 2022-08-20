@echo off
set scriptsdir=C:\Control\scripts\

title Game Server Updates
call %scriptsdir%_generate_scripts.cmd

set prefix=update_
cd /d C:\steamcmd

steamcmd +runscript %scriptsdir%%prefix%arkex.txt
steamcmd +runscript %scriptsdir%%prefix%arkab.txt
steamcmd +runscript %scriptsdir%%prefix%arkse.txt
steamcmd +runscript %scriptsdir%%prefix%arkis.txt
steamcmd +runscript %scriptsdir%%prefix%arkrag.txt
pause