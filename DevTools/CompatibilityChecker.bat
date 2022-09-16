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
if not exist "ShulkerInterfaces\PS\pwsh.exe" echo �ॡ���� ����� ᮢ���⨬���...
color 5
echo �����㦥�� Windows XP
echo ��� �����㬥�� ����� �� ࠡ���� �� Windows XP. 
echo �� ���஡㥬 �ᯮ�짮���� ����� ᮢ���⨬���, �� �� �� ���஢��� ��������� ��襣� �����㬥�� �� �⮩ ��⥬�
pause
goto FileVerify
 
:W7
if not exist "ShulkerInterfaces\PS\pwsh.exe" echo compatibility package needed
color e
echo �����㦥�� Windows 7
echo �ᯮ��㥬 ����� ᮢ���⨬��� ��� ࠡ��� �����㬥�� �� Windows 7...
pause
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
if not exist "ShulkerInterfaces\ffmpeg.exe" echo FFmpeg �� ������
if not exist "ShulkerInterfaces\yt-dlp.exe" echo Yt-Dlp �� ������

if not exist "ShulkerInterfaces\Ffmpeg_ComandlineInterfaceProject.bat" echo Ffmpeg_ComandlineInterfaceProject.bat �� ������
if not exist "ShulkerInterfaces\yt-dl_init.bat" echo yt-dl_init.bat �� ������
if not exist "ShulkerInterfaces\GetAudioFileFullPath.ps1" echo GetAudioFileFullPath.ps1 �� ������
if not exist "ShulkerInterfaces\GetAVFileFullPath.ps1" echo GetAVFileFullPath.ps1 �� ������
if not exist "ShulkerInterfaces\GetFolderPath.ps1" echo GetFolderPath.ps1 not found
if not exist "ShulkerInterfaces\GetMediaFilename.ps1" echo GetMediaFilename.ps1 �� ������
if not exist "ShulkerInterfaces\GetPictureFileFullPath.ps1" echo GetPictureFileFullPath.ps1 �� ������
if not exist "ShulkerInterfaces\GetSubtitlesFileFullPath.ps1" echo GetSubtitlesFileFullPath.ps1 �� ������
if not exist "ShulkerInterfaces\GetVideoFileFullPath.ps1" echo GetVideoFileFullPath.ps1 �� ������
color a
echo �஢�ઠ �����襭�
pause