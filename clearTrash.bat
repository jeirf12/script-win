@echo off

TITLE "Clear Trash"

REM Elimina la carpeta temp
rd /s /q %TEMP%

REM Vacia la papelera
rd /s /q %SYSTEMDRIVE%\$Recycle.bin

REM Elimina archivos automatico e indica espacio libre
cleanmgr /VERYLOWDISK

REM Elimina archivos de sistemas anteriores
cleanmgr /AUTOCLEAN
