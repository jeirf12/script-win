@echo off

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
      echo          SSID              Password
      echo.
      for /F "tokens=5,*" %%a in ('netsh wlan show profiles') do for /f "tokens=4,*" %%c in ('"(netsh wlan show profiles "%%a %%b" key=clear & netsh wlan show profiles "%%a%%b" key=clear) | findstr /R "*Key Content*""') do @echo %%a %%b                  %%c %%d     
      goto Finish

    :PasswordSSID
      echo          SSID              Password
      for /f "tokens=4,*" %%c in ('"netsh wlan show profiles "%~2" key=clear | findstr /R "*Key Content*""') do @echo %~2             %%c %%d 
      goto Finish
    
    :ModeUse
      echo Modo de uso
      echo  .\passwordWifi
      echo      -t         Muestra todas las redes con su ssid y su contrasenia
      echo      -s "ssid"  Muestra la contrasenia de la red [ssid] pasada por argumentos
      echo      -h         Muestra esta ayuda
      goto Finish

    :Finish
      exit /B
  endlocal
