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
if not exist "ShulkerInterfaces\PS\pwsh.exe" goto GetPowerShell
color 5
echo Windows XP Detected
echo Our tool may not work on Windows XP. 
echo We will try to use the compatibility package, but we have not tested the behavior of the tool on this system
pause
goto FileVerify
 
:W7
if not exist "ShulkerInterfaces\PS\pwsh.exe" goto GetPowerShell
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
if not exist "ShulkerInterfaces\ffmpeg.exe" echo FFmpeg not found && goto downloadLibs
if not exist "ShulkerInterfaces\yt-dlp.exe" echo Yt-Dlp not found && goto downloadLibs

if not exist "ShulkerInterfaces\Ffmpeg_ComandlineInterfaceProject.bat" echo Ffmpeg_ComandlineInterfaceProject.bat not found && goto ScriptNotFound
if not exist "ShulkerInterfaces\yt-dl_init.bat" echo yt-dl_init.bat not found && goto ScriptNotFound
if not exist "ShulkerInterfaces\GetAudioFileFullPath.ps1" echo GetAudioFileFullPath.ps1 not found && goto PsScriptNotFound
if not exist "ShulkerInterfaces\GetAVFileFullPath.ps1" echo GetAVFileFullPath.ps1 not found && goto PsScriptNotFound
if not exist "ShulkerInterfaces\GetFolderPath.ps1" echo GetFolderPath.ps1 not found && goto PsScriptNotFound
if not exist "ShulkerInterfaces\GetMediaFilename.ps1" echo GetMediaFilename.ps1 not found && goto PsScriptNotFound
if not exist "ShulkerInterfaces\GetPictureFileFullPath.ps1" echo GetPictureFileFullPath.ps1 not found && goto PsScriptNotFound
if not exist "ShulkerInterfaces\GetSubtitlesFileFullPath.ps1" echo GetSubtitlesFileFullPath.ps1 not found && goto PsScriptNotFound
if not exist "ShulkerInterfaces\GetVideoFileFullPath.ps1" echo GetVideoFileFullPath.ps1 not found && goto PsScriptNotFound
if exist "ShulkerInterfaces\PSfunc.7z" del /Q "ShulkerInterfaces\PSfunc.7z"
goto start

:downloadLibs
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/u0nzqardgrrba11/lastest.txt?dl=1','%~p0\ShulkerInterfaces\ffmpegBin.7z')
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\ffmpegBin.7z"
pause
if not exist "ShulkerInterfaces\ffmpeg.exe" echo FFmpeg still not found && pause && exit
if not exist "ShulkerInterfaces\yt-dlp.exe" echo Yt-Dlp still not found && pause && exit
del /Q "ShulkerInterfaces\ffmpegBin.7z"
goto FileVerify

:ScriptNotFound
color 4
echo One or more batch files were not found. Please reinstall the tool.
echo Exit...
pause
exit

:PsScriptNotFound
color 4
echo One or more Powershell files were not found. Downloading them from the cloud...
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/u0nzqardgrrba11/lastest.txt?dl=1','%~p0\ShulkerInterfaces\PSfunc.7z')
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PSfunc.7z"
goto FileVerify

:GetPowerShell
cls
color e 
echo Installing compatibility package
if not exist "ShulkerInterfaces\PS.7z" goto PowerShellDownload
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PS.7z"
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PScript.7z"
if exist "ShulkerInterfaces\PS\pwsh.exe" del /Q "ShulkerInterfaces\PS.7z"
if exist "ShulkerInterfaces\compatibility.txt" del /Q "ShulkerInterfaces\PScript.7z"
goto checkOS

:PowerShellDownload
echo Compatibility package has been removed, or a release for Win 8.1 and higher versions has been downloaded. 
echo Downloading the latest Compatibility package from the cloud
echo Connecting to dropbox...
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/u0nzqardgrrba11/lastest.txt?dl=1','%~p0\ShulkerInterfaces\PS.7z')
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/u0nzqardgrrba11/lastest.txt?dl=1','%~p0\ShulkerInterfaces\PScript.7z')
timeout /t 5
goto GetPowerShell

:start
cls
color e
echo I hope you like our tools
echo "<3" (Release 0.9.1 sysps) - Click "R" to check lastest release
echo _______  _______  _______  _______  _______  _______  _______ 
echo (  ____ \(  ____ \(  ____ )(  ____ \(  ____ )(  ____ \(  ____ \
echo : (    \/: (    \/: (    ):: (    \/: (    ):: (    \/: (    \/
echo : (__    : (__    : (____):: (__    : (____):: (__    : :      
echo :  __)   :  __)   :  _____):  __)   :  _____):  __)   : : ____ 
echo : (      : (      : (      : (      : (      : (      : : \_  )
echo : )      : )      : )      : (____/\: )      : (____/\: (___) :
echo :/       :/       :/       (_______/:/       (_______/(_______)
echo .
echo ::::::::::::::::::::::::::
echo F : Start FFmpeg Interface
echo D : Start Multiplatform Video Downloader (STABLE!)
echo G : GitHub
echo C : Credits
echo ::::::::::::::::::::::::::
choice /C FDGCR /N

if %errorlevel%==1 cd ShulkerInterfaces && Ffmpeg_ComandlineInterfaceProject.bat
if %errorlevel%==2 cd ShulkerInterfaces && yt-dl_init.bat
if %errorlevel%==3 goto start
if %errorlevel%==4 goto Credits
if %errorlevel%==5 goto start
pause
exit

:Credits