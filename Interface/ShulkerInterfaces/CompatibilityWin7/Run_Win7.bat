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
goto FileVerify
 
:W7
if not exist "ShulkerInterfaces\PS\pwsh.exe" goto GetPowerShell
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

rem :::::::::::::::::::: CHECKING FILES
:FileVerify
if not exist "ShulkerInterfaces\7z\7za.exe" echo ERROR. 7-ZIP NOT FOUND && color c && pause && exit
if not exist "ShulkerInterfaces\ffmpeg.exe" echo Searching for FFmpeg... && goto installLibs
if not exist "ShulkerInterfaces\yt-dlp.exe" echo Searching for Yt-Dlp... && goto installLibs

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

:installLibs
if not exist "ShulkerInterfaces\ffmpegBin.7z" goto downloadLibs
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\ffmpegBin.7z"
if not exist "ShulkerInterfaces\ffmpeg.exe" echo FFmpeg still not found && pause && exit
if not exist "ShulkerInterfaces\yt-dlp.exe" echo Yt-Dlp still not found && pause && exit
del /Q "ShulkerInterfaces\ffmpegBin.7z"
goto FileVerify

:downloadLibs
if not exist "ShulkerInterfaces\PS\pwsh.exe" echo Error. The required files were not found. Please reinstall the release. && pause && exit
ShulkerInterfaces\PS\pwsh.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/r0t2e6b4z9n8yb9/ffmpegBin.7z?dl=1','%~p0\ShulkerInterfaces\ffmpegBin.7z')
if not exist "ShulkerInterfaces\ffmpegBin.7z" goto DoError
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\ffmpegBin.7z"
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
if not exist "ShulkerInterfaces\PS\pwsh.exe" echo Error. The required files were not found. Please reinstall the release. && pause && exit
echo One or more Powershell files were not found. Downloading them from the cloud...
ShulkerInterfaces\PS\pwsh.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/9qu8gv7yz9m6nvt/PSfunc.7z?dl=1','%~p0\ShulkerInterfaces\PSfunc.7z')
if not exist "ShulkerInterfaces\PSfunc.7z" goto DoError
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PSfunc.7z"
goto FileVerify

:GetPowerShell
cls
color e 
echo Installing compatibility package
if not exist "ShulkerInterfaces\PS.7z" goto PowerShellDownload
if not exist "ShulkerInterfaces\PScript.7z" goto PowerShellDownload
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PS.7z"
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PScript.7z"
if exist "ShulkerInterfaces\PS\pwsh.exe" del /Q "ShulkerInterfaces\PS.7z"
if exist "ShulkerInterfaces\compatibility.txt" del /Q "ShulkerInterfaces\PScript.7z"
goto checkOS

:PowerShellDownload
color 4
echo Error. The required files were not found. Please reinstall the release.
pause 
exit

:DoError
color 4
echo Error. The downloaded files could not be found.
echo Please download a compatible release
pause
exit

:start
cls
color e
echo I hope you like our tools
echo "<3" (Release 0.9.1 extps) - Click "R" to check lastest release
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
echo G : Our GitHub
echo C : Credits
echo ::::::::::::::::::::::::::
choice /C FDGCR /N

if %errorlevel%==1 cd ShulkerInterfaces && Ffmpeg_ComandlineInterfaceProject.bat
if %errorlevel%==2 cd ShulkerInterfaces && yt-dl_init.bat
if %errorlevel%==3 explorer.exe "https://github.com/SHULKERPLAY/FFpepeg"
if %errorlevel%==4 goto Credits
if %errorlevel%==5 explorer.exe "https://github.com/SHULKERPLAY/FFpepeg/releases"
goto start

:Credits
color b
echo Thank to ffmpeg.org for a wonderful tool: https://ffmpeg.org/
echo Windows builds of ffmpeg by BtbN: https://github.com/BtbN/FFmpeg-Builds/releases
echo For downloading Videos we use yt-dlp: https://github.com/yt-dlp/yt-dlp
echo Fork from yt-dl: https://github.com/ytdl-org/youtube-dl
echo Compression is provided by 7-zip: https://www.7-zip.org/
echo Thanks to PowerShell Team for your developments
echo For windows 7 we use an external powershell (v7.2.6) https://github.com/PowerShell/PowerShell
pause
goto start