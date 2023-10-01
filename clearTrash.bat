@echo off

TITLE "Clear Trash"

REM Elimina la carpeta temp
rd /s /q %TEMP% >NUL 2>&1

REM Elimina basura de npm
rd /S /q %USERPROFILE%\AppData\Local\cache\ >NUL 2>&1

REM Elimina basura de npm
rd /S /q %USERPROFILE%\AppData\Local\npm-cache\ >NUL 2>&1

REM Vacia la papelera del disco C
rd /s /q %SYSTEMDRIVE%\$Recycle.bin >NUL 2>&1

REM Vacia la papelera del disco D
rd /s /q D:\$Recycle.bin >NUL 2>&1

REM Elimina archivos automatico e indica espacio libre y elimina archivos de sistemas anteriores
cleanmgr /VERYLOWDISK /SETUP /AUTOCLEAN >NUL 2>&1
