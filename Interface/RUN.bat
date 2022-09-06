@echo off
color e
echo I hope you like our tools
echo "<3"
echo --------------------------
echo F - Start FFmpeg Interface
echo D - Start Multiplatform Video Downloader (STABLE!)
echo --------------------------
choice /C FD /N

if %errorlevel%==1 cd ShulkerInterfaces && Ffmpeg_ComandlineInterfaceProject.bat
if %errorlevel%==2 cd ShulkerInterfaces && yt-dl_init.bat
pause