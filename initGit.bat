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

title initGit
  setlocal EnableExtensions EnableDelayedExpansion
  
    :Init
      set arguments=0
      for %%x in (%*) do set /A arguments+=1
      if %arguments% geq 1 (
        if "%~1"=="" goto :HelpMe
        if "%~1"=="''" goto :HelpMe
        if "%~1"=="-b" (
          if "%~2"=="" goto :HelpMe
          if "%~2"=="''" goto :HelpMe
          if "%~3"=="-r" (
            call :VerifiedFolder %1 %2 %3 %4
          ) else (
            call :HelpMe
          )
        )
        if "%~1"=="-r" (
          if "%~3"=="-b" (
            if "%~4"=="" goto :HelpMe
            if "%~4"=="''" goto :HelpMe
            call :VerifiedFolder %3 %4 %1 %2
          ) else (
            call :VerifiedFolder "master" "master" %1 %2
          )
        )
      ) else (
        call :HelpMe
      )
      goto :Finish

    :VerifiedFolder
      if not exist .git (
        call :AddUrlRepo %2 %3 %4
      ) else (
        echo. %purpleColour% [*]%endColour%%redColour% No se puede inicializar el repositorio, porque ya existe uno enlazado%endColour%
      )
      goto :Finish
    
    :AddUrlRepo
      if "%~2"=="-r" (
        if "%~3"=="" goto :HelpMe
        if "%~3"=="''" goto :HelpMe
        echo %purpleColour% [*]%endColour%%yellowColour% El git se esta inicializando...%endColour%
        timeout /t 6 /nobreak > NUL
        git init > NUL 2>&1
        git branch -M %~1
        git remote add origin %~3
        echo %purpleColour% [*]%endColour%%greenColour% El repositorio se inicializo correctamente%endColour%
      )
      goto :Finish

    :HelpMe
      echo  %yellowColour%Modo de uso: .\initGit%endColour%
      echo.       %purpleColour%-b%endColour%%redColour% "NewNameBranch"%endColour%       %yellowColour%Especifica el nombre de la rama principal%endColour%
      echo.       %purpleColour%-r%endColour%%redColour% urlRepositoryRemote%endColour%   %yellowColour%Conecta el proyecto con el repositorio remoto especificado%endColour%
      echo.                                %yellowColour%Nota: Si no se especifica la opcion -b, deja el nombre de la rama por defecto (master)%endColour%
      goto :Finish

    :Finish
      exit/B

  endlocal
::*************************************Final*************************************
