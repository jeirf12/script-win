@echo off

TITLE "Super Usuario"

REM Ejecuta una consola como administrador
runas /profile /env /user:%USERNAME%\administrador cmd

