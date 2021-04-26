@echo off

TITLE "Organize Information"

REM Obtiene la ruta actual en un archivo plano
cd >pathPresent.txt

REM Lee el archivo y lo mete a la variable
set/p pathPresent= <pathPresent.txt

REM Elimina el archivo plano
del pathPresent.txt

REM Carpeta a organizar
set pathCurrent= %USERPROFILE%\Downloads\

REM Nos redirigimos a la carpeta a organizar
cd %pathCurrent%

REM Carpeta a la cual se va mover los archivos
set pathDate= E:\Music\Nueva\

REM Crea la carpeta de nueva, sino existe (valida existencia de la carpeta)
if not exist %pathDate% (mkdir %pathDate%)

REM Mueve los archivos a esa carpeta
FOR %%f IN (*.mp3) DO (MOVE %pathCurrent%"%%f" %pathDate%)

REM Carpeta a la cual se va mover los archivos
set pathDate= %pathCurrent%Pictures\

REM Crea la carpeta de pictures, sino existe (valida existencia de la carpeta)
if not exist %pathDate% (mkdir %pathDate%)

REM Mueve los archivos a esa carpeta
FOR %%f IN (*.png *.jpg) DO (MOVE %pathCurrent%"%%f" %pathDate%)

REM Carpeta a la cual se va mover los archivos
set pathDate= %pathCurrent%\Movies\

REM Crea la carpeta de movies, sino existe (valida existencia de la carpeta)
if not exist %pathDate% (mkdir %pathDate%)

REM Mueve los archivos a esa carpeta
FOR %%f IN (*.mp4) DO (MOVE %pathCurrent%"%%f" %pathDate%)

REM Carpeta a la cual se va mover los archivos
set pathDate= %pathCurrent%\Documents\

REM Crea la carpeta de Documents, sino existe (valida existencia de la carpeta)
if not exist %pathDate% (mkdir %pathDate%)

REM Mueve los archivos a esa carpeta
FOR %%f IN (*.doc *.pdf *.txt) DO (MOVE %pathCurrent%"%%f" %pathDate%)

REM Vuelve a la ruta inicial
cd %pathPresent%
