@echo off

:: Todo este fragmento de código se necesita para los colores
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set redColour=%ESC%[31m
set blueColour=%ESC%[34m
set greenColour=%ESC%[32m
set endColour=%ESC%[0m

for %%x in (%*) do where /Q %%x && echo %blueColour%Se encontro el binario de %%x%endColour% && where %%x | xargs echo %greenColour% || echo %redColour%No se encontro el binario de %%x%endColour%
