@echo off

title repogit
  setlocal EnableExtensions EnableDelayedExpansion
      :Init
        set args=0
        for %%x in (%*) do set /A args+=1
        if %args% equ 1 (
          call :VerifiedStatus %1
        ) else (
          call :ModeUse
        )
        goto Finish

      :VerifiedStatus
        if exist .git/ (
          git status >NUL 2>&1 | findstr /B "^Changes ^Untracked" >NUL
          if %errorlevel% equ 0 (
            call :Longitude %1
          ) else (
            echo/ [*] No hay cambios pendientes para subir
          )
        ) else (
          echo/ [*] Dirijase a un directorio valido
        )
        goto Finish

      :ModeUse
        echo Modo de uso.
        echo ./repoGit "mensajeCommit"
        goto Finish
  endlocal

==============================================================

:: Mide la longitud de una cadena
:: Devuelve errorlevel=1 si no se especifica la cadena

:Longitude
  setlocal EnableExtensions
	  :: Salimos si no se especifican argumentos
	  IF "%~1"=="" exit /B
	  :: Podemos usar también el metacaracter $
	  FOR /F "DELIMS=:" %%F IN (
		  '"(ECHO.%~1 & ECHO.) | FINDSTR /O ."'
	  ) DO SET/A LEN=%%~F-3
  endlocal & SET "LEN=%LEN%"

:ContinueSequence
  if %LEN% gtr 5 (
    git add .
    git commit -m "%~1"
    git push
  ) else (
    echo/ [*] Digite un mensaje mayor a 5 caracteres
  )

:Finish
  exit /B


