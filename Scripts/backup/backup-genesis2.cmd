@echo off
SET ArgFile=gen2
for /f "eol=# tokens=1* delims==" %%i in (C:\Data\ark\args\%ArgFile%.txt) do SET %%i=%%j
call "C:\Data\_backups\backup.cmd" %GameFolder% "C:\Games\%GameFolder%\ShooterGame\Saved\*"
pause
