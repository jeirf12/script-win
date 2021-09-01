@echo off

echo          SSID              Password
echo.
for /F "tokens=5,*" %%a in ('netsh wlan show profiles') do for /f "tokens=4,*" %%c in ('"(netsh wlan show profiles "%%a %%b" key=clear & netsh wlan show profiles "%%a%%b" key=clear) | findstr /R "*Key Content*""') do @echo %%a %%b                  %%c %%d
