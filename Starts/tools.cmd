@echo off

set /p _launch_a=Launch ARKon [Y/n]? 
if "%_launch_a%" EQU "" set _launch_a=y

set /p _launch_c=Launch Data Processor for ARK Files [Y/n]? 
if "%_launch_c%" EQU "" set _launch_c=y


cd /d C:\Software\ARKon
if /i "%_launch_a%" EQU "y" start ARKon.exe

cd /d C:\Software\ArkDataProcessor-Release\Release\
if /i "%_launch_c%" EQU "y" start "Ark Data Processor - Scorched Earth" ArkDataProcessor.exe -c "C:\Data\ark\DataProcessorConfigs\ArkConfig.json"
