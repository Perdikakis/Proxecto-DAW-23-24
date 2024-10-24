@echo off

REM Iniciar XAMPP en segundo plano usando PowerShell para ocultar la ventana
echo Iniciando XAMPP...
cd /d D:\xampp
powershell -Command "Start-Process 'xampp_start.exe' -WindowStyle Hidden"

REM Iniciar Laravel en segundo plano usando PowerShell para ocultar la ventana
echo Iniciando Laravel...
cd /d D:\xampp\Proxecto-DAW-23-24\api
powershell -Command "Start-Process 'cmd' -ArgumentList '/c php artisan serve' -WindowStyle Hidden"

REM Iniciar React en segundo plano usando PowerShell para ocultar la ventana
echo Iniciando React...
cd /d D:\xampp\Proxecto-DAW-23-24\frontend
powershell -Command "Start-Process 'cmd' -ArgumentList '/c npm run dev' -WindowStyle Hidden"

REM Abrir Microsoft Edge con dos pestañas (URL de la API y React)
echo Abriendo Microsoft Edge con las URLs de la API y React...
start microsoft-edge:http://localhost:8000
start microsoft-edge:http://localhost:5173