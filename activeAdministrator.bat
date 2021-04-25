@echo off

TITLE "Administrator Trigger"

REM Activa el usuario administrador
net user administrador /active:yes

REM Pide la contraseña por teclado
:bucle
set/p password= Digite una contrasenia: 
echo.

set/p passwordConfirmed= Vuelva a digitar la contrasenia:
echo.

REM Compara la contraseña y dependiendo del resultado se vuelve a digitar o sale correctamente
if %password%==%passwordConfirmed% (goto correct) else (goto incorrect)

REM Contraseña correcta
:correct
  REM echo Contrasenia Correcta!

  REM este no muestra mensaje al pausar
  REM pause>nul
  exit

REM Contraseña incorrecta
:incorrect
  echo Contrasenia Incorrecta, vuelva a intentarlo

  REM Este pause solo, muestra mensaje de presionar tecla
  pause

cls
goto bucle
