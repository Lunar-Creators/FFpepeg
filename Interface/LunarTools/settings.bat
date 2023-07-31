@echo off
if not exist settings\valid.lc goto set_reset
:DisplaySettings
rem add checks for settings. Settings are applied by variables
rem Powershell
if exist settings\pwshdisable.lc set set-powershell=DISABLED
if exist settings\pwsh.lc set /p set-powershell=<settings\pwsh.lc
if not exist settings\pwshdisable.lc if not exist settings\pwsh.lc set set-powershell=SYSTEM
rem ffmpeg package
if exist settings\ffmpeg.lc (set /p set-ffmpeg=<settings\ffmpeg.lc) else set set-ffmpeg=DEFAULT
rem ytdlp package
if exist settings\ytdlp.lc (set /p set-ytdlp=<settings\ytdlp.lc) else set set-ytdlp=DEFAULT
rem LANG
if exist settings\lang.lcl set set-lang=English
if exist settings\langru.lcl set set-lang=Russian
rem explorer
if exist settings\enablexplr.lc (set set-explorer=ALWAYS) else set set-explorer=NEVER
rem Experimental Features
if exist settings\experimental.lc (set set-experimental=ENABLED) else set set-experimental=DISABLED
rem FFMPEG LICENSE
if exist settings\default.lcx set set-fflicense=DEFAULT (GPL)
cls
echo ::::::::::::::::::::::::::
echo Q - Powershell directory
echo %set-powershell%
echo W - FFmpeg package
echo %set-ffmpeg%
echo E - Open Output folder after Encoding?
echo %set-explorer%
echo R - Yt-DLP package
echo %set-ytdlp%
echo L - Language (Does not affect this menu)
echo %set-lang%
echo O - Enable experimental features
echo %set-experimental%
echo P - FFmpeg license
echo %set-fflicense%
echo X - Exit
echo .
echo M - Reset Defaults
echo ::::::::::::::::::::::::::
choice /C QWEOPXMRL /N

if %errorlevel%==1 goto set_powershell
if %errorlevel%==2 goto set_FFmpeg
if %errorlevel%==3 goto set_explorer
if %errorlevel%==4 goto set_experimental
if %errorlevel%==5 goto set_fflicense
if %errorlevel%==6 cd ..&run.bat
if %errorlevel%==7 goto set_reset
if %errorlevel%==8 goto set_Ytdlp
if %errorlevel%==9 goto set_lang
goto DisplaySettings

:set_reset
cls
echo Reset in progress...
rd /s /q settings
md settings
echo Lunar Creators File>settings\valid.lc
echo FFmpeg License. Lunar Creators File>settings\default.lcx
echo Display explorer. Lunar Creators File>settings\enablexplr.lc
echo Lunar Creators Language File>settings\lang.lcl
goto DisplaySettings

:set_lang
cls
echo ::::::::::::::::::::::::::
echo Q - English (Default)
echo X - Russian
echo E - Return
echo ::::::::::::::::::::::::::
choice /C QXE /N
if %errorlevel%==1 del /f /q settings\*.lcl& echo Lunar Creators Language File>settings\lang.lcl
if %errorlevel%==2 del /f /q settings\*.lcl& echo Lunar Creators Language File>settings\langru.lcl
goto DisplaySettings

:set_fflicense
cls
echo Selected license significantly affects the list of encoders available for use according to their license
echo ::::::::::::::::::::::::::
echo Q - GPL (Default)
echo E - Return
echo ::::::::::::::::::::::::::
echo ! We are still working on licenses. Now you can only use the default GPL license
choice /C QE /N
goto DisplaySettings

:set_explorer
if exist settings\enablexplr.lc (del /f /q settings\enablexplr.lc) else settings\enablexplr.lc echo Display explorer. Lunar Creators File>settings\enablexplr.lc

goto DisplaySettings

:set_experimental
if exist settings\experimental.lc (del /f /q settings\experimental.lc) else echo Enable experimental features. Lunar Creators File>settings\experimental.lc
goto DisplaySettings

:set_powershell
cls
echo ::::::::::::::::::::::::::
echo Q - System powershell (Default)
echo X - Set Custom Powershell
echo N - DISABLE POWERSHELL
echo E - Return
echo ::::::::::::::::::::::::::
echo ! If you disable powershell then you will have to enter the paths to files and folders manually
choice /C QXNE /N
if %errorlevel%==1 del /f /q settings\pwsh.lc& del /f /q settings\pwshdisable.lc& goto DisplaySettings
if %errorlevel%==3 echo Powershell was disabled. Lunar Creators File>settings\pwshdisable.lc& del /f /q settings\pwsh.lc& goto DisplaySettings
if %errorlevel%==4 goto DisplaySettings
cls
echo Select powershell executable (pwsh.exe or powershell.exe)
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 8`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set pstemp=%decode2:?= %
echo "%pstemp%">settings\pwsh.lc
del /s /q settings\pwshdisable.lc
goto DisplaySettings

:set_FFmpeg
cls
echo ::::::::::::::::::::::::::
echo Q - Default FFmpeg
echo X - Set Custom FFmpeg
echo E - Return
echo ::::::::::::::::::::::::::
choice /C QXE /N
if %errorlevel%==1 del /f /q settings\ffmpeg.lc& goto DisplaySettings
if %errorlevel%==3 goto DisplaySettings
echo Select FFmpeg executable (ffmpeg.exe)
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 8`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set fftemp=%decode2:?= %
echo "%fftemp%">settings\ffmpeg.lc
goto DisplaySettings

:set_Ytdlp
cls
echo ::::::::::::::::::::::::::
echo Q - Default Yt-DLP
echo X - Set Custom Yt-DLP
echo E - Return
echo ::::::::::::::::::::::::::
choice /C QXE /N
if %errorlevel%==1 del /f /q settings\ytdlp.lc& goto DisplaySettings
if %errorlevel%==3 goto DisplaySettings
echo Select Yt-DLP executable (yt-dlp.exe)
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 8`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set yttemp=%decode2:?= %
echo "%yttemp%">settings\ytdlp.lc
goto DisplaySettings