@echo off

:: @brief Apaga el equipo
:: @params /s indica apagar
:: @params /t indica el tiempo de espera seguido de un numero (en este caso cero)

set arguments=0
for %%x in (%*) do set /A arguments+=1

if %arguments% equ 0 (
  goto :Normal
)

if "%~1" neq "-nu" (
  goto :Helpme
)

:WithoutUpdate
 shutdown /p
 goto :Finish

:Normal
 shutdown /s /t 0
 goto :Finish

:Helpme
  echo Modo de uso: 
  echo poweroff        Apaga el pc normal
  echo poweroff -nu    Apaga el pc sin tener en cuenta actualizaciones
  goto :Finish

:Finish
