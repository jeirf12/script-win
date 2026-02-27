@echo off

:: Todo este fragmento de código se necesita para los colores
for /F %%a in ('echo prompt $E ^| cmd') do (
    set "ESC=%%a"
)
:: Se puede definir mas codigos de colores aqui
:: OJO: no borrar el endColour porque puede ocasionar 
:: variaciones en la ejecucion de este codigo

set redColour=%ESC%[31m
set greenColour=%ESC%[32m
set endColour=%ESC%[0m

sudo sc stop "AWS VPN Client OpenVPN Service" && sudo sc stop W3SVC && echo %greenColour%"Servicios detenidos correctamente!"%endColour% || echo %redColour%"Ocurrió un error iniciando los servicios"%endColour%
