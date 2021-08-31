@echo off

::================================Inicio========================================
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
          echo/ [*] Dirijase a un directorio valido
        )
        goto Finish

      :VerifiedStatus2
        if "%status%" geq "1" (
          call :Longitude %1
        ) else (
          echo/ [*] No hay cambios pendientes para subir
        )
        goto Finish

      :ModeUse
        echo  Modo de uso
        echo. .\repoGit "Mensaje del Commit"
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
          echo/ [*] Digite un mensaje mayor a 5 caracteres
        )

      :Finish
        exit /B
  endlocal
::=================================Final========================================
