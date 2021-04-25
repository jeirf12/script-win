@echo off

TITLE "Deactivate Administrator"

REM Desactiva el usuario administrador
net user administrador /active:no

REM echo Usuario administrador desactivado correctamente!
REM pause>nul
