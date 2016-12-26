@echo off
setlocal

set TASMPATH=..\RomWBW\Tools\tasm32
set TASMTABS=%TASMPATH%
set PATH=%TASMPATH%;%PATH%

call :asm DISKIO
call :asm DISKIO3
call :asm ZETA
call :asm ZETA2
call :asm DIDE
call :asm N8
call :asm SMB_WD
copy FD_SMB_WD.COM ..\RomWBW\Source\RomDsk\smb_std\FD.COM
copy FD_SMB_WD.COM ..\RomWBW\Source\RomDsk\smb_8inch\FD.COM
goto :eof

:asm
TASM -t80 -b -g3 -fFF -dFDPLT=PLT_%1 fd.asm FD_%1.COM FD_%1.LST
goto :eof

