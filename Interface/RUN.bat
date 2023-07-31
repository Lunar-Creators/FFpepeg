@echo off
rem :::::::::::::::::::: CHECKING OS
:checkOS
set key=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion
 
For /F "delims=" %%a in ('reg query "%key%" /v "ProductName" ^| find /i "ProductName"') do (
  set OSName=%%a
)
 
echo %OSName% |>NUL find /i "Windows XP" && call :XP || echo %OSName% |>NUL find /i "Windows 7" && call :W7 || echo %OSName% |>NUL find /i "Windows 8" && call :W8 || echo %OSName% |>NUL find /i "Windows 8.1" && call :W81 || echo %OSName% |>NUL find /i "Windows 10" && call :W10 || echo %OSName% |>NUL find /i "Windows 11" && call :W11 || call :Unknown
pause
 
:XP
if not exist "LunarTools\PS\pwsh.exe" goto GetPowerShell
color 5
echo Windows XP Detected
echo Our tool may not work on Windows XP. 
echo We will try to use the compatibility package, but we have not tested the behavior of the tool on this system
goto FileVerify
 
:W7
if not exist "LunarTools\PS\pwsh.exe" goto GetPowerShell
color e
echo Windows 7 Detected
echo We use the compatibility package for the tool to work on Windows 7...
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

rem ### Add OS Warning
rem ### Add New file checking system that tests files only on first start

:start
cls
color e
echo I hope you like our tools
echo "<3" (YUKO 1.0) - Press "R" to check lastest release
echo ::::::::::::::::::::::::::
echo F : START
echo G : Our GitHub
echo C : Credits
echo S : Settings
echo ::::::::::::::::::::::::::
choice /C FDGCRLS /N

if %errorlevel%==1 cd LunarTools && if exist settings\lang.lcl YUKO.bat& if exist settings\langru.lcl YUKO_ru.bat
if %errorlevel%==3 explorer.exe "https://github.com/Lunar-Creators/FFpepeg"
if %errorlevel%==4 goto Credits
if %errorlevel%==5 explorer.exe "https://github.com/Lunar-Creators/FFpepeg/releases"
if %errorlevel%==6 Language.bat
goto start

:Credits
color b
echo Thank to ffmpeg.org for a wonderful tool: https://ffmpeg.org/
echo Windows builds of ffmpeg by BtbN: https://github.com/BtbN/FFmpeg-Builds/releases
echo For downloading Videos we use yt-dlp: https://github.com/yt-dlp/yt-dlp
echo Compression is provided by 7-zip: https://www.7-zip.org/
echo YUKO!
pause
goto start