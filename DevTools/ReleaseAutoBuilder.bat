@echo off
:checkOS
set key=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion
 
For /F "delims=" %%a in ('reg query "%key%" /v "ProductName" ^| find /i "ProductName"') do (
  set OSName=%%a
)
 
echo %OSName% |>NUL find /i "Windows XP" && call :XP || echo %OSName% |>NUL find /i "Windows 7" && call :W7 || echo %OSName% |>NUL find /i "Windows 8" && call :W8 || echo %OSName% |>NUL find /i "Windows 8.1" && call :W81 || echo %OSName% |>NUL find /i "Windows 10" && call :W10 || echo %OSName% |>NUL find /i "Windows 11" && call :W11 || call :Unknown
pause
 
:XP
color c
echo Windows XP detected
echo Unable to build release for Windows 8 and below
pause
exit

:W7
color c
echo Windows XP detected
echo Unable to build release for Windows 8 and below
pause
exit

:W8
color 6
echo Windows 8 Detected
echo The tool works stable on Windows 8.1 and higher.
echo Trying to execute the script
pause
goto Builder

:W81
color 2
echo Windows 8.1 Detected...
goto Builder

:W10
color 2
echo Windows 10 or 11 Detected...
goto Builder

:W11
color 2
echo Windows 11 Detected...
goto Builder

:Unknown
color 6
echo We were unable to identify your operating system.
echo The tool works stable on Windows 8.1 and higher. We will try to execute the script using Powershell
pause
goto Builder

:Builder
color e
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://github.com/SHULKERPLAY/FFpepeg/archive/refs/heads/FFmpeg-Batch.zip','%~p0FFmpeg-Batch.zip')
if not exist "FFmpeg-Batch.zip" goto DoError
powershell.exe Expand-Archive '%~p0\FFmpeg-Batch.zip' -DestinationPath '%~p0'
md build
move /Y "FFpepeg-FFmpeg-Batch\Interface" "Build"
del /f /q "FFmpeg-Batch.zip"
ren "Build\Interface" FFpepeg
if exist "build\FFpepeg\RUN.bat" rd /s /q FFpepeg-FFmpeg-Batch
if not exist "build\FFpepeg\RUN.bat" goto DoError1
cd build\FFpepeg
RUN.bat
pause
exit

:DoError
color 4
echo Error. The downloaded files could not be found.
echo Please download a compatible release
pause
exit

:DoError1
color 4
echo Script execution error...
pause
exit