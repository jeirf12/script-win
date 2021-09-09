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

title repogit
  setlocal EnableExtensions EnableDelayedExpansion
      :Init
        set args=0
        for %%x in (%*) do set /A args+=1
        if %args% equ 1 (
          if "%~1"=="" goto :ModeUse
          if "%~1"=="''" goto :ModeUse
          call :VerifiedStatus %1
        ) else (
          call :ModeUse
        )
        goto Finish

      :VerifiedStatus
        if exist .git/ (
          for /F "delims= " %%f in ('"(git status | findstr /R "^Changes ^Untracked") | find /c /v """') do set/a status=%%f
          call :VerifiedStatus2 %1
        ) else (
          echo/ %purpleColour%[*]%endColour%%redColour% Dirijase a un directorio valido%endColour%
        )
        goto Finish

      :VerifiedStatus2
        if "%status%" geq "1" (
          call :Longitude %1
        ) else (
          echo/ %purpleColour%[*]%endColour%%greenColour% No hay cambios pendientes para subir%endColour%
        )
        goto Finish

      :ModeUse
        echo  %yellowColour%Modo de uso%endColour%
        echo. %purpleColour%.\repoGit%endColour%%yellowColour% "Mensaje del Commit"%endColour%
        goto Finish

      :: Mide la longitud de una cadena
      :Longitude
	    :: Podemos usar también el metacaracter $
	    FOR /F "DELIMS=:" %%F IN (
		    '"(ECHO.%~1 & ECHO.) | FINDSTR /O ."'
	    ) DO SET/A LEN=%%~F-3

      :ContinueSequence
        if %LEN% gtr 5 (
          git branch | for /f "tokens=2" %%a in ('findstr "*"') do @echo %%a >temp.txt
          set/p branch=< temp.txt
          del temp.txt
          git add .
          git commit -m "%~1"
          git push -u origin %branch%
        ) else (
          echo/ %purpleColour%[*]%endColour%%yellowColour% Digite un mensaje mayor a 5 caracteres%endColour%
        )

      :Finish
        exit /B
  endlocal
::=================================Final========================================
