@echo off

::================================Inicio========================================
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

title Password Decode
  setlocal EnableExtensions EnableDelayedExpansion
    :Init
      set args=0
      for %%x in (%*) do set /A args+=1
      if %args% equ 1 (
        if "%~1"=="-t" goto :PasswordTodo
        if "%~1"=="-h" goto :ModeUse
      ) 
      if %args% equ 2 (
        if "%~1"=="-s" (
          if "%~2"=="" goto :ModeUse
          if "%~2"=="''" goto :ModeUse
          if "%~2"=="-t" goto :ModeUse
          if "%~2"=="-h" goto :ModeUse
          goto :PasswordSSID %2
        )
      )
      call :ModeUse
      goto Finish

    :PasswordTodo
      echo %greenColour%         SSID              Password%endColour%
      echo.
      for /F "tokens=5,*" %%a in ('netsh wlan show profiles') do for /f "tokens=4,*" %%c in ('"(netsh wlan show profiles "%%a %%b" key=clear & netsh wlan show profiles "%%a%%b" key=clear) | findstr /R "*Key Content*""') do @echo %blueColour%%%a %%b%endColour%                  %yellowColour%%%c %%d%endColour%
      goto Finish

    :PasswordSSID
      echo %greenColour%         SSID              Password%endColour%
      for /f "tokens=4,*" %%c in ('"netsh wlan show profiles "%~2" key=clear | findstr /R "*Key Content*""') do @echo %blueColour%%~2%endColour%             %yellowColour%%%c %%d%endColour%
      goto Finish
    
    :ModeUse
      echo %yellowColour%Modo de uso: .\passwordWifi%endColour%
      echo      %purpleColour%-t%endColour%         %yellowColour%Muestra todas las redes con su ssid y su contrasenia%endColour%
      echo      %purpleColour%-s%endColour%%redColour% "ssid"%endColour%  %yellowColour%Muestra la contrasenia de la red [ssid] pasada por argumentos%endColour%
      echo      %purpleColour%-h%endColour%         %yellowColour%Muestra esta ayuda%endColour%
      goto Finish

    :Finish
      exit /B
  endlocal
::=================================Final========================================
