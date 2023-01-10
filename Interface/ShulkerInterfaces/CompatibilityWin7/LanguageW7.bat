@echo off
chcp 866
:start
if not exist "ShulkerInterfaces\PS\pwsh.exe" goto GetPowerShell
cls
color b
echo ����� ��������, �᫨ � ��� ��� �������� 䠩��� �몠, ��� ���� ᪠砭� �� �᭮�� ��᫥����� ५���. �᫨ � ��� ���� ��� ��⮬���᪠� ᮡ࠭��� ᡮઠ, ��� �㤥� ��१���ᠭ� 䠩���� ��᫥����� ५���.
echo �롥�� ��
echo ::::::::::::::::::::::::::
echo E : ������᪨�
echo R : ���᪨�
echo U - �������� ����� �����
echo ::::::::::::::::::::::::::
choice /C ERU /N

if %errorlevel%==1 goto English
if %errorlevel%==2 goto Russian
if %errorlevel%==3 goto DlLang
goto start

:English
if not exist "ShulkerInterfaces\Lang\en-us.7z" goto DlLang
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\Lang\en-us.7z"
color a
echo .
echo .
echo .
echo ������!
pause
exit

:Russian
if not exist "ShulkerInterfaces\Lang\ru-ru.7z" goto DlLang
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\Lang\ru-ru.7z"
color a
echo .
echo .
echo .
echo ������!
pause
exit

:DlLang
echo ���������� �몮��� 䠩���...
ShulkerInterfaces\PS\pwsh.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/xq71atprad9bqa0/LangW7.7z?dl=1','%~p0\ShulkerInterfaces\LangW7.7z')
if not exist "ShulkerInterfaces\LangW7.7z" goto DoError
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\LangW7.7z"
echo .
echo .
echo .
echo ������ �� ����� ᬥ���� ��
pause
goto Start

:DoError
color 4
echo �訡��. ����㦥��� 䠩�� �� �뫨 �������. �� ����� �ந���� ��-�� �஡��� � ���୥� ᮥ��������.
pause
goto start

:GetPowerShell
cls
color e 
echo ��⠭���� ����� ᮢ���⨬���
if not exist "ShulkerInterfaces\PS.7z" goto PowerShellDownload
if not exist "ShulkerInterfaces\PScript.7z" goto PowerShellDownload
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PS.7z"
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\PScript.7z"
if exist "ShulkerInterfaces\PS\pwsh.exe" del /Q "ShulkerInterfaces\PS.7z"
if exist "ShulkerInterfaces\compatibility.txt" del /Q "ShulkerInterfaces\PScript.7z"
goto checkOS

:PowerShellDownload
color 4
echo �訡��. ����室��� 䠩�� �� �뫨 �������. ��������, �����⠭���� ५��.
pause 
exit