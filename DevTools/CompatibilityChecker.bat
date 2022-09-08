@echo off
:checkOS
set key=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion
 
For /F "delims=" %%a in ('reg query "%key%" /v "ProductName" ^| find /i "ProductName"') do (
  set OSName=%%a
)
 
echo %OSName% |>NUL find /i "Windows XP" && call :XP || echo %OSName% |>NUL find /i "Windows 7" && call :W7 || echo %OSName% |>NUL find /i "Windows 8" && call :W8 || echo %OSName% |>NUL find /i "Windows 8.1" && call :W81 || echo %OSName% |>NUL find /i "Windows 10" && call :W10 || echo %OSName% |>NUL find /i "Windows 11" && call :W11 || call :Unknown
pause
 
:XP
if not exist "ShulkerInterfaces\PS\pwsh.exe" echo compatibility package needed
color 5
echo Windows XP Detected
echo Our tool may not work on Windows XP. 
echo We will try to use the compatibility package, but we have not tested the behavior of the tool on this system
pause
goto FileVerify
 
:W7
if not exist "ShulkerInterfaces\PS\pwsh.exe" echo compatibility package needed
color e
echo Windows 7 Detected
echo We use the compatibility package for the tool to work on Windows 7...
pause
goto FileVerify

:W8
color e
echo Windows 8 Detected
echo The tool works stable on Windows 8.1 and higher. If you are experiencing problems, download the release for Windows 7
pause
goto FileVerify

:W81
color 2
echo Windows 8.1 Detected...
goto FileVerify

:W10
color 2
echo Windows 10 or 11 Detected...
goto FileVerify

:W11
color 2
echo Windows 11 Detected...
goto FileVerify

:Unknown
color 6
echo We were unable to identify your operating system.
echo The tool works stable on Windows 8.1 and higher. If you are experiencing problems, download the release for Windows 7
pause
goto FileVerify

rem :::::::::::::::::::: CHECKING FILES
:FileVerify
if not exist "ShulkerInterfaces\ffmpeg.exe" echo FFmpeg not found
if not exist "ShulkerInterfaces\yt-dlp.exe" echo Yt-Dlp not found

if not exist "ShulkerInterfaces\Ffmpeg_ComandlineInterfaceProject.bat" echo Ffmpeg_ComandlineInterfaceProject.bat not found
if not exist "ShulkerInterfaces\yt-dl_init.bat" echo yt-dl_init.bat not found
if not exist "ShulkerInterfaces\GetAudioFileFullPath.ps1" echo GetAudioFileFullPath.ps1 not found
if not exist "ShulkerInterfaces\GetAVFileFullPath.ps1" echo GetAVFileFullPath.ps1 not found
if not exist "ShulkerInterfaces\GetFolderPath.ps1" echo GetFolderPath.ps1 not found
if not exist "ShulkerInterfaces\GetMediaFilename.ps1" echo GetMediaFilename.ps1 not found
if not exist "ShulkerInterfaces\GetPictureFileFullPath.ps1" echo GetPictureFileFullPath.ps1 not found
if not exist "ShulkerInterfaces\GetSubtitlesFileFullPath.ps1" echo GetSubtitlesFileFullPath.ps1 not found
if not exist "ShulkerInterfaces\GetVideoFileFullPath.ps1" echo GetVideoFileFullPath.ps1 not found
color a
echo Everything is checked
pause