REM Detener XAMPP sin dejar la ventana abierta
cd /d D:\xampp
powershell -Command "Start-Process 'cmd' -ArgumentList '/c xampp_stop.exe' -WindowStyle Hidden"

REM Cerrar todas las ventanas de CMD abiertas por este script
taskkill /F /IM cmd.exe /T