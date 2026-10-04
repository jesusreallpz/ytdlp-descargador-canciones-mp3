@echo off
title Descargador de canciones
cd /d "%~dp0"

if not exist "MP3" mkdir "MP3"

echo.
echo ==========================================
echo       DESCARGADOR DE CANCIONES
echo ==========================================
echo.

for /f "usebackq delims=" %%A in ("canciones.txt") do (
    if not "%%A"=="" (
        echo.
        echo ==========================================
        echo Buscando: %%A
        echo ==========================================
        yt-dlp "ytsearch1:%%A" ^
            --extract-audio ^
            --audio-format mp3 ^
            --audio-quality 0 ^
            --output "MP3/%%(title)s.%%(ext)s"
    )
)

echo.
echo ==========================================
echo          TERMINADO
echo ==========================================
echo.
echo Tus canciones estan en la carpeta MP3.
pause