@echo off
rem :::::::::::::::::::: CHECKING OS
chcp 866
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
echo �����㦥�� Windows XP
echo ��� �����㬥�� ����� �� ࠡ���� �� Windows XP. 
echo �� ���஡㥬 �ᯮ�짮���� ����� ᮢ���⨬���, �� �� �� ���஢��� ��������� ��襣� �����㬥�� �� �⮩ ��⥬�
goto FileVerify
 
:W7
if not exist "ShulkerInterfaces\PS\pwsh.exe" goto GetPowerShell
color e
echo �����㦥�� Windows 7
echo �ᯮ��㥬 ����� ᮢ���⨬��� ��� ࠡ��� �����㬥�� �� Windows 7...
goto FileVerify

:W8
color e
echo �����㦥�� Windows 8
echo �����㬥�� ࠡ�⠥� �⠡��쭮 �� Windows 8.1 � ���. �᫨ � ��� ��������� �஡���� � ࠡ�⮩, ᪠砩� ५�� ��� Windows 7
pause
goto FileVerify

:W81
color 2
echo �����㦥�� Windows 8.1...
goto FileVerify

:W10
color 2
echo �����㦥�� Windows 10 ��� 11...
goto FileVerify

:W11
color 2
echo �����㦥�� Windows 11...
goto FileVerify

:Unknown
color 6
echo � ��� �� ��諮 ��।����� ���� ����樮���� ��⥬�.
echo �����㬥�� ࠡ�⠥� �⠡��쭮 �� Windows 8.1 � ���. �᫨ � ��� ��������� �஡���� � ࠡ�⮩, ᪠砩� ५�� ��� Windows 7
pause
goto FileVerify

rem :::::::::::::::::::: CHECKING FILES
:FileVerify
if not exist "ShulkerInterfaces\7z\7za.exe" echo ������. 7-ZIP �� ������! && color c && pause && exit
if not exist "ShulkerInterfaces\ffmpeg.exe" echo �饬 FFmpeg... && goto installLibs
if not exist "ShulkerInterfaces\yt-dlp.exe" echo �饬 Yt-Dlp... && goto installLibs

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
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/r0t2e6b4z9n8yb9/ffmpegBin.7z?dl=1','%~p0\ShulkerInterfaces\ffmpegBin.7z')
if not exist "ShulkerInterfaces\ffmpegBin.7z" goto DoError
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\ffmpegBin.7z"
if not exist "ShulkerInterfaces\ffmpeg.exe" echo FFmpeg still not found && pause && exit
if not exist "ShulkerInterfaces\yt-dlp.exe" echo Yt-Dlp still not found && pause && exit
del /Q "ShulkerInterfaces\ffmpegBin.7z"
goto FileVerify

:ScriptNotFound
color 4
echo ���� ��� ����� �ਯ⮢ ����������. ���砩� ५�� ������.
echo ��室...
pause
exit

:PsScriptNotFound
color 4
echo ���� ��� ��᪮�쪮 �ਯ⮢ Powershell �� �������. ���稢��� �� � ������...
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/9qu8gv7yz9m6nvt/PSfunc.7z?dl=1','%~p0\ShulkerInterfaces\PSfunc.7z')
if not exist "ShulkerInterfaces\PSfunc.7z" goto DoError
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PSfunc.7z"
goto FileVerify

:GetPowerShell
cls
color e 
echo ��⠭�������� ����� ᮢ���⨬���
if not exist "ShulkerInterfaces\PS.7z" goto PowerShellDownload
if not exist "ShulkerInterfaces\PScript.7z" goto PowerShellDownload
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PS.7z"
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PScript.7z"
if exist "ShulkerInterfaces\PS\pwsh.exe" del /Q "ShulkerInterfaces\PS.7z"
if exist "ShulkerInterfaces\compatibility.txt" del /Q "ShulkerInterfaces\PScript.7z"
goto checkOS

:PowerShellDownload
echo ����� ᮢ���⨬��� �� 㤠��, ��� �� ᪠砭 ५�� ��� Win 8.1 � ���. 
echo ���稢��� ��᫥���� ����� ᮢ���⨬��� � ������...
echo ������祭�� � dropbox...
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/2i1a4b9n7522aqn/PS.7z?dl=1','%~p0\ShulkerInterfaces\PS.7z')
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/ercpl507ujp0qnh/PScript.7z?dl=1','%~p0\ShulkerInterfaces\PScript.7z')
if not exist "ShulkerInterfaces\PS.7z" goto DoError
timeout /t 5
goto GetPowerShell

:DoError
color 4
echo �訡��. ���砭� 䠩�� �� �������.
echo ��������, ᪠砩� ᮢ���⨬� ५��
pause
exit

:start
cls
color e
echo �� �������� ��� �ࠢ���� ��� �����㬥���
echo "<3" (����� 0.9.1 sysps RU) - ������ "R" �⮡� ��ᬮ���� ��᫥���� ५���
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
echo F : �������� ����䥩� FFmpeg
echo D : �������� ���⨯����ଥ��� �����稪 ����� (STABLE!)
echo G : ��� GitHub
echo C : �������୮��
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
echo ���ᨡ� ffmpeg.org �� �४��� �����㬥��: https://ffmpeg.org/
echo ���ઠ ffmpeg ��� Windows �� BtbN: https://github.com/BtbN/FFmpeg-Builds/releases
echo ��� ᪠稢���� ����� �� �ᯮ��㥬 yt-dlp: https://github.com/yt-dlp/yt-dlp
echo Fork from yt-dl: https://github.com/ytdl-org/youtube-dl
echo ���⨥ ५���� ��������� 7-zip: https://www.7-zip.org/
echo ���ᨡ� ������� PowerShell �� ��� ࠧࠡ�⪨
echo ��� windows 7 �� �ᯮ��㥬 ���譨� powershell (v7.2.6) https://github.com/PowerShell/PowerShell
pause
goto start