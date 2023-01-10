@echo off
chcp 866
:start
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
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/xq71atprad9bqa0/LangW7.7z?dl=1','%~p0\ShulkerInterfaces\LangW7.7z')
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