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
if not exist "ShulkerInterfaces\PS\pwsh.exe" echo Требуется пакет совместимости...
color 5
echo Обнаружена Windows XP
echo Наш инструмент может не работать на Windows XP. 
echo Мы попробуем использовать пакет совместимости, но мы не тестировали поведение нашего инструмента на этой системе
pause
goto FileVerify
 
:W7
if not exist "ShulkerInterfaces\PS\pwsh.exe" echo compatibility package needed
color e
echo Обнаружена Windows 7
echo Используем пакет совместимости для работы инструмента на Windows 7...
pause
goto FileVerify

:W8
color e
echo Обнаружена Windows 8
echo Инструмент работает стабильно на Windows 8.1 и выше. Если у вас возникают проблемы с работой, скачайте релиз для Windows 7
pause
goto FileVerify

:W81
color 2
echo Обнаружена Windows 8.1...
goto FileVerify

:W10
color 2
echo Обнаружена Windows 10 или 11...
goto FileVerify

:W11
color 2
echo Обнаружена Windows 11...
goto FileVerify

:Unknown
color 6
echo У нас не вышло определить вашу операционную систему.
echo Инструмент работает стабильно на Windows 8.1 и выше. Если у вас возникают проблемы с работой, скачайте релиз для Windows 7
pause
goto FileVerify

rem :::::::::::::::::::: CHECKING FILES
:FileVerify
if not exist "ShulkerInterfaces\ffmpeg.exe" echo FFmpeg Не найден
if not exist "ShulkerInterfaces\yt-dlp.exe" echo Yt-Dlp Не найден

if not exist "ShulkerInterfaces\Ffmpeg_ComandlineInterfaceProject.bat" echo Ffmpeg_ComandlineInterfaceProject.bat Не найден
if not exist "ShulkerInterfaces\yt-dl_init.bat" echo yt-dl_init.bat Не найден
if not exist "ShulkerInterfaces\GetAudioFileFullPath.ps1" echo GetAudioFileFullPath.ps1 Не найден
if not exist "ShulkerInterfaces\GetAVFileFullPath.ps1" echo GetAVFileFullPath.ps1 Не найден
if not exist "ShulkerInterfaces\GetFolderPath.ps1" echo GetFolderPath.ps1 not found
if not exist "ShulkerInterfaces\GetMediaFilename.ps1" echo GetMediaFilename.ps1 Не найден
if not exist "ShulkerInterfaces\GetPictureFileFullPath.ps1" echo GetPictureFileFullPath.ps1 Не найден
if not exist "ShulkerInterfaces\GetSubtitlesFileFullPath.ps1" echo GetSubtitlesFileFullPath.ps1 Не найден
if not exist "ShulkerInterfaces\GetVideoFileFullPath.ps1" echo GetVideoFileFullPath.ps1 Не найден
color a
echo Проверка завершена
pause