@echo off

:: Comando para eliminar archivos o carpetas con archivos dentro (enmascara comandos de eliminacion windows con uno utilizado en linux)

for %%f in (%*) do (
  if exist "%%~f" (
    if exist "%%~f\" (
      rd /s/q %%~f
    ) else (
      del /q %%~f
    )
  )
)

