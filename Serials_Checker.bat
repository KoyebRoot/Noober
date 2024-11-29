@echo off
mode con: cols=90 lines=40
:diocane
title Rebirth Checker
color D
cls
echo Bios
echo [97m------------[95m
wmic bios get serialnumber
wmic csproduct get uuid
echo CPU
echo [97m------------[95m
wmic cpu get serialnumber
echo Diskdrive
echo [97m------------[95m
wmic diskdrive get serialnumber
echo Baseboard
echo [97m------------[95m
wmic baseboard get serialnumber
echo MacAddress
echo [97m------------[95m
wmic path Win32_NetworkAdapter where "PNPDeviceID like '%%PCI%%' AND NetConnectionStatus=2 AND AdapterTypeID='0'" get MacAddress
echo Press ENTER to check serial again...
pause >nul
goto diocane