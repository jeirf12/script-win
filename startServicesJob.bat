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

sudo sc start "AWS VPN Client OpenVPN Service" && sudo sc start "World Wide Web Publishing Service" && echo %greenColour%"Servicios iniciados correctamente!"%endColour% || echo %redColour%"Ocurrió un error iniciando los servicios"%endColour%
