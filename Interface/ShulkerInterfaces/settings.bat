@echo off
if not exist settings\valid.lc goto set_reset

:DisplaySettings
rem add checks for settings. Settings are applied by variables
rem set /p xxxx=<yyyy.lc
cls
echo ::::::::::::::::::::::::::
echo Q - Powershell directory
echo %set-powershell%
echo W - FFmpeg package
echo %set-ffmpeg%
echo E - Open Explorer Window After Encoding?
echo %set-explorer%
echo O - Enable experimental features
echo %set-experimental%
echo P - FFmpeg license
echo %set-fflicense%
echo A - Apply changes
echo X - Exit Without Applying
echo .
echo H - Help
echo M - Reset Defaults
echo ::::::::::::::::::::::::::
choice /C ERU /N

if %errorlevel%==1 goto set_powershell
if %errorlevel%==2 goto set_FFmpeg
if %errorlevel%==3 goto set_explorer
if %errorlevel%==4 goto set_experimental
if %errorlevel%==5 goto set_fflicense
if %errorlevel%==6 goto set_apply
if %errorlevel%==7 cd ..&run.bat
if %errorlevel%==8 goto set_help
if %errorlevel%==9 goto set_reset
goto start

:set_reset
cls
echo Reset in progress...
rd /s /q settings
md settings
echo Lunar Creators File>settings\valid.lc
echo FFmpeg License. Lunar Creators>settings\default.lcx
echo Display explorer. Lunar Creators File>settings\enablexplr.lc
goto DisplaySettings

:set_explorer
if exist settings\enablexplr.lc del /f /q settings\enablexplr.lc
if not exist settings\enablexplr.lc echo Display explorer. Lunar Creators File>settings\enablexplr.lc
goto DisplaySettings

:set_powershell
cls
echo Select powershell executable (pwsh.exe or powershell.exe)
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 8`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set pstemp=%decode2:?= %
echo "%pstemp%">settings\pwsh.lc
goto DisplaySettings

:set_FFmpeg
cls
echo Select FFmpeg executable (ffmpeg.exe)
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 8`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set fftemp=%decode2:?= %
echo "%fftemp%">settings\ffmpeg.lc
goto DisplaySettings