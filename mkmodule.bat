@echo off

::================================Inicio========================================
:: @brief Este script se encarga de generar un modulo para el framework laminas https://getlaminas.org/
::        Creando todo el conjunto de carpetas y archivos necesarios para esto
:: @params NameModule recibe el nombre del modulo a crear
::
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

setlocal EnableExtensions EnableDelayedExpansion
  :init
    set args=0
    for %%x in (%*) do set/a args+=1
    if %args% equ 1 (
      set name=%1
      if exist module/ (
        call :Capitalize %name%
        echo/ %purpleColour%[*]%endColour%%greenColour% Modulo creado correctamente%endColour%
      ) else (
        echo/ %purpleColour%[*]%endColour%%redColour% Dirijase a la raiz del proyecto%endColour%
      )
    ) else (
      call :ModeUse
    )
    goto Finish

  :Capitalize
    for %%x in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do set name=!name:%%x=%%x!
    set initial=%name:~0,1%
    set overleft=%name:~1%
    for %%x in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do set initial=!initial:%%x=%%x!
    if not "%overleft%"=="" for %%x in (a b c d e f g h i j k l m n o p q r s t u v w x y z) do set overleft=!overleft:%%x=%%x!
    set nameCapitalize=%initial%%overleft%
    md module\%nameCapitalize%\config\
    md module\%nameCapitalize%\src\Controller\
    md module\%nameCapitalize%\src\Form\
    md module\%nameCapitalize%\src\Model\
    md module\%nameCapitalize%\view\%name%\%name%\
    copy NUL module\%nameCapitalize%\src\Module.php > NUL
    copy NUL module\%nameCapitalize%\config\module.config.php > NUL
    copy NUL module\%nameCapitalize%\src\Controller\%nameCapitalize%Controller.php > NUL
    copy NUL module\%nameCapitalize%\view\%name%\%name%\index.phtml > NUL
    copy NUL module\%nameCapitalize%\view\%name%\%name%\add.phtml > NUL
    copy NUL module\%nameCapitalize%\view\%name%\%name%\edit.phtml > NUL
    copy NUL module\%nameCapitalize%\view\%name%\%name%\delete.phtml > NUL
    copy NUL module\%nameCapitalize%\src\Model\%nameCapitalize%.php > NUL
    copy NUL module\%nameCapitalize%\src\Model\%nameCapitalize%Table.php > NUL
    copy NUL module\%nameCapitalize%\src\Form\%nameCapitalize%Form.php > NUL
    goto :EOF

  :ModeUse
    echo %yellowColour%Modo de uso%endColour%
    echo. %purpleColour%.\mkmodule%endColour%%yellowColour% NameModule%endColour%
    goto Finish

  :Finish
    exit /B
