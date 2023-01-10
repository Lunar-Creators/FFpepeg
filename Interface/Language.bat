@echo off
chcp 866
:start
cls
color b
echo Обратите внимание, если у вас нет локальных файлов языка, они будут скачаны на основе последнего релиза. Если у вас старая или автоматическая собранная сборка, она будет перезаписана файлами последнего релиза.
echo Выберите язык
echo ::::::::::::::::::::::::::
echo E : Английский
echo R : Русский
echo U - ОБНОВИТЬ ФАЙЛЫ ЯЗЫКА
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
echo ГОТОВО!
pause
exit

:Russian
if not exist "ShulkerInterfaces\Lang\ru-ru.7z" goto DlLang
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\Lang\ru-ru.7z"
color a
echo .
echo .
echo .
echo ГОТОВО!
pause
exit

:DlLang
echo Обновление языковых файлов...
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/xq71atprad9bqa0/LangW7.7z?dl=1','%~p0\ShulkerInterfaces\LangW7.7z')
if not exist "ShulkerInterfaces\LangW7.7z" goto DoError
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\LangW7.7z"
echo .
echo .
echo .
echo Теперь вы можете сменить язык
pause
goto Start

:DoError
color 4
echo Ошибка. Загруженные файлы не были найдены. Это может произойти из-за проблем с интернет соединением.
pause
goto start