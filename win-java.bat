@echo off

set nameVersion=%~1

2>NUL CALL :CASE_%nameVersion%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE
exit /B 

:CASE_8
  set name=8.0.382.5
  GOTO :SET_JAVA %name%

:CASE_17
  set name=17.0.8.101
  GOTO :SET_JAVA %name%

:DEFAULT_CASE
  if "%nameVersion%" == "" (
    echo Uso comando: 
    echo              "win-java 8|17"
  ) else (
    echo Error, version %nameVersion% no encontrada.
  )
  GOTO END_CASE

:END_CASE
  VER > NUL
  GOTO :EOF

:SET_JAVA %name%
  set path_java="%PROGRAMFILES%\Eclipse Adoptium\jdk-%name%-hotspot"
  setx JAVA_HOME "%path_java%"
  set JAVA_HOME=%path_java%
  set PATH=%JAVA_HOME%\bin;%PATH%
  echo Java %nameVersion% Activated.
  GOTO :END_CASE
