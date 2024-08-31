@echo off

::************************************Inicio************************************
:: Todo este fragmento de código se necesita para los colores
for /F %%a in ('echo prompt $E ^| cmd') do (
    set "ESC=%%a"
)
:: Se puede definir mas codigos de colores aqui
:: OJO: no borrar el endColour porque puede ocasionar 
:: variaciones en la ejecucion de este codigo

set redColour=%ESC%[31m
set greenColour=%ESC%[32m
set yellowColour=%ESC%[33m
set blueColour=%ESC%[34m
set purpleColour=%ESC%[35m
set grayColour=%ESC%[37m
set endColour=%ESC%[0m

set arguments=0
for %%x in (%*) do set /A arguments+=1

if %arguments% leq 0 (
  echo %redColour%Falta la %purpleColour%url%endColour%%redColour% del repositorio%endColour%
  goto :Finish
)

git clone --recurse-submodules %1 && echo %greenColour%Repositorio descargado correctamente%endColour%

:Finish
  exit /B
