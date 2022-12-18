@echo off

set nameVersion=%~1

2>NUL CALL :CASE_%nameVersion%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE

echo Done.
exit /B 

:CASE_8
  set name=1.8.0_202
  GOTO :SET_JAVA %name%

:CASE_17
  set name=-17.0.5
  GOTO :SET_JAVA %name%

:DEFAULT_CASE
  echo Error, version %nameVersion% no encontrada
  GOTO END_CASE

:END_CASE
  VER > NUL
  GOTO :EOF

:SET_JAVA %name%
  set JAVA_HOME=C:\Program Files\Java\jdk%name%
  set Path=%JAVA_HOME%\bin;%Path%
  echo Java %nameVersion% Activated.
  GOTO :END_CASE
