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
echo �����㦥�� Windows XP
echo �� �� ����� ᮡ��� ५�� �� Windows 8 � ����
pause
exit

:W7
color c
echo �����㦥�� Windows 7
echo �� �� ����� ᮡ��� ५�� �� Windows 8 � ����
pause
exit

:W8
color 6
echo �����㦥�� Windows 8
echo �����㬥�� ࠡ�⠥� �⠡��쭮 �� Windows 8.1 � ���.
echo ��⠥��� �믮����� �ਯ�
pause
goto Builder

:W81
color 2
echo Windows 8.1 Detected...
goto Builder

:W10
color 2
echo �����㦥�� Windows 10 ��� 11...
goto Builder

:W11
color 2
echo �����㦥�� Windows 11...
goto Builder

:Unknown
color 6
echo � ��� �� ��諮 ��।����� ���� ����樮���� ��⥬�.
echo �����㬥�� ࠡ�⠥� �⠡��쭮 �� Windows 8.1 � ���. �� ����⠥��� �ᯮ����� �ਯ� � ������� Powershell
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
echo ��⮢�! ������� 䠩� RUN ����� ����� FFpepeg ������
pause
exit

:DoError
color 4
echo �訡��. ���砭� 䠩�� �� �������.
echo ��������, ᪠砩� ᮢ���⨬� ५��
pause
exit

:DoError1
color 4
echo �訡�� �ᯮ������ �ਯ�...
pause
exit