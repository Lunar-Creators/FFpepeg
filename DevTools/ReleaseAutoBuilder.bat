@echo off
chcp 866
:checkOS
set key=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion
 
For /F "delims=" %%a in ('reg query "%key%" /v "ProductName" ^| find /i "ProductName"') do (
  set OSName=%%a
)
 
echo %OSName% |>NUL find /i "Windows XP" && call :XP || echo %OSName% |>NUL find /i "Windows 7" && call :W7 || echo %OSName% |>NUL find /i "Windows 8" && call :W8 || echo %OSName% |>NUL find /i "Windows 8.1" && call :W81 || echo %OSName% |>NUL find /i "Windows 10" && call :W10 || echo %OSName% |>NUL find /i "Windows 11" && call :W11 || call :Unknown
pause
 
:XP
color c
echo Обнаружена Windows XP
echo Мы не можем собрать релиз на Windows 8 и ниже
pause
exit

:W7
color c
echo Обнаружена Windows 7
echo Мы не можем собрать релиз на Windows 8 и ниже
pause
exit

:W8
color 6
echo Обнаружена Windows 8
echo Инструмент работает стабильно на Windows 8.1 и выше.
echo Пытаемся выполнить скрипт
pause
goto Builder

:W81
color 2
echo Windows 8.1 Detected...
goto Builder

:W10
color 2
echo Обнаружена Windows 10 или 11...
goto Builder

:W11
color 2
echo Обнаружена Windows 11...
goto Builder

:Unknown
color 6
echo У нас не вышло определить вашу операционную систему.
echo Инструмент работает стабильно на Windows 8.1 и выше. Мы попытаемся исполнить скрипт с помощью Powershell
pause
goto Builder

:Builder
color e
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://github.com/SHULKERPLAY/FFpepeg/archive/refs/heads/FFmpeg-Batch-RU.zip','%~p0FFpepeg-FFmpeg-Batch-RU.zip')
if not exist "FFpepeg-FFmpeg-Batch-RU.zip" goto DoError
powershell.exe Expand-Archive '%~p0\FFpepeg-FFmpeg-Batch-RU.zip' -DestinationPath '%~p0'
md build
move /Y "FFpepeg-FFmpeg-Batch-RU\Interface" "Build"
del /f /q "FFpepeg-FFmpeg-Batch-RU.zip"
ren "Build\Interface" FFpepeg
if exist "build\FFpepeg\RUN.bat" rd /s /q FFpepeg-FFmpeg-Batch-RU
if not exist "build\FFpepeg\RUN.bat" goto DoError1
color a
echo Готово! Запустите файл RUN внутри папки FFpepeg вручную
pause
exit

:DoError
color 4
echo Ошибка. Скачаные файлы не найдены.
echo Пожалуйста, скачайте совместимый релиз
pause
exit

:DoError1
color 4
echo Ошибка исполнения скрипта...
pause
exit