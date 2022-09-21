@echo off
:start
cls
color b
echo Note that if you do not have local language files, they will be downloaded based on the latest release. If you have an old or self-compiled release, it will be overwritten by the files of the last current release.
echo Select a language
echo ::::::::::::::::::::::::::
echo E : English
echo R : Russian
echo U - UPDATE LANGUAGE FILES
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
echo DONE!
pause
exit

:Russian
if not exist "ShulkerInterfaces\Lang\ru-ru.7z" goto DlLang
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\Lang\ru-ru.7z"
color a
echo .
echo .
echo .
echo DONE!
pause
exit

:DlLang
echo Updating Language files
powershell.exe -Command (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/871xrbnckqts0zw/LangW10.7z?dl=1','%~p0\ShulkerInterfaces\LangW10.7z')
if not exist "ShulkerInterfaces\LangW10.7z" goto DoError
ShulkerInterfaces\7z\7za.exe x -scrcSHA256 -y -bt "ShulkerInterfaces\LangW10.7z"
echo .
echo .
echo .
echo Now you can change the Language
pause
goto Start

:DoError
color 4
echo Error. The downloaded files could not be found. This may also relate to internet connection issues.
pause
goto start