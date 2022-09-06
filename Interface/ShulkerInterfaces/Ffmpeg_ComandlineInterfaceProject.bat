@echo off
rem Доступные переменные - %filepath% %inputaudio% %encoder% %outputformat% %outputname% %preset% %Profile% %tune% %vidbitrate% %maxbitrate% %audiocodec% %audiotype% %threads% %audiobitrate% %volume% %flags% %SUPERCUSTOMMODE% %outputfolder% %subencoder% %inputsubtitle% %disablevideo% %disableaudio% %disablesubtitles% %framerate% %size%
rem Конфигурация Copy - Запрос нового имени, Запрос нового формата
rem Конфигурация libx264 - Запрос подраздела кодировщика, пресет кодирования, Выбор профиля, Выбор опции, Изменить разрешение, CBR или CRF битрейт, задать значение, вывод аудио, Выбор кодека или стандартные настройки, задать значение битрейта аудио, Запрос субтитров, дополнительные ключи, Запрос нового имени, Запрос нового формата
ffmpeg --enable-libfdk-aac --enable-nonfree
:welcome
rem Список для очистки переменных во избежание разных ошибок
set filepath=
set inputaudio=
set encoder=
set outputformat=
set outputname=
set preset=
set Profile=
set tune=
set vidbitrate=
set audiocodec=
set threads=
set audiobitrate=
set flags=
set subencoder=
set outputfolder=
set inputsubtitle=
set disablevideo=
set disableaudio=
set framerate=
set size=
set volume=
set disablesubtitles=
set audiotype=
set maxbitrate=
set tempv=
set temp1=
set temp2=
set temp3=
set temp4=
set temp5=
set temp6=
set temp7=
set temp8=
set temp9=
set temp10=
set temp11=
set temp12=
cls
color e
echo --ScriptVersion 0.8 -alpha --copyright "SHULKER Play" --ffmpeg.org (n5.0.1-7-g7389a49fd3-20220713)
echo !!! Each person can have their own usage of this script and ffmpeg in general. 
echo !!! We can't check all the combinations ourselves. 
echo !!! If you have a problem, or you want to suggest a library to add to the menu, please contact us!
timeout /t 1
echo WELCOME TO FFMPEG ENCODE SCRIPT!

echo --------------------------
echo H - FFmpeg Help
echo Y - Select Preset or tool
echo N - Configure Video Encoder
echo Q - Half-Manual Mode
echo K - Audio to Video Encoding
echo C - Custom mode
echo X - Contact Us
echo V - Open Video Downloader (NEW RELEASE!)
echo E - Exit
echo --------------------------
choice /C YNHECQKXV /N

rem if %errorlevel%==1 goto preset
if %errorlevel%==1 goto preset
if %errorlevel%==2 goto configure
if %errorlevel%==3 goto helpff
if %errorlevel%==4 exit
if %errorlevel%==5 goto SUPERCUSTOMMODE
if %errorlevel%==6 goto Conf_custom
if %errorlevel%==7 echo IN DEVELOPMENT && pause && goto welcome
if %errorlevel%==8 explorer.exe "https://vk.com/im?sel=-120367298" && goto welcome
if %errorlevel%==9 yt-dl_init.bat
goto welcome

:SUPERCUSTOMMODE
color f
echo In this mode you can run your command with your flags for ffmpeg
echo Use this mode if you fully know what you are doing. "ffmpeg -h" for help. 
echo My working Example: (ffmpeg -i "E:\RENDERS\CONVERT TO WEBM\SceneOverlay.mov" -c:v libvpx -crf 16 -b:v 20000K -an -threads 8 -quality best -lag-in-frames 16 -auto-alt-ref 0 -f webm -y "E:\RENDERS\SceneOverlay.webm")
echo Close the window to exit or type goto welcome
:SUPERCUSTOMMODE1
set /p SUPERCUSTOMMODE=
color a
color f
%SUPERCUSTOMMODE%
goto SUPERCUSTOMMODE1

rem СПРАВКА ПОЛЬЗОВАТЕЛЮ -------------------------------------------------------------------------------

:helpff
color f
echo How can ffmpeg help you?
echo --------------------------
echo 1 - Standart list of help
echo 2 - Very long List of help
echo 3 - EXTREAMLY LONG LIST OF HELP
echo 4 - Flag help for ANY ffmpeg decoder/encoder/demuxer/muxer/filter/bsf/protocol
echo 5 - List of supported decoders/encoders/demuxers/muxers/filters/bsfs/protocols
echo N - quit help
echo --------------------------
echo NOTE! In custom mode, you can enter the help command with your arguments
choice /C N12345 /N

if %errorlevel%==1 goto welcome
if %errorlevel%==2 ffmpeg -h && goto helpff
if %errorlevel%==3 ffmpeg -h long && goto helpff
if %errorlevel%==4 ffmpeg -h full && goto helpff
if %errorlevel%==5 goto helpselect
if %errorlevel%==6 goto lhelpselect

:helpselect
color e
echo Select type
echo --------------------------
echo d - decoder
echo e - encoder
echo u - demuxer
echo m - muxer
echo f - filter
echo b - bsf
echo p - protocol
echo N - back to help
echo --------------------------
echo !!! Please Note that this script was created to configure the ENCODER. For the rest, use the custom mode for manual command input.

choice /C deumfbpn /N

if %errorlevel%==1 set helptype=decoder
if %errorlevel%==2 set helptype=encoder
if %errorlevel%==3 set helptype=demuxer
if %errorlevel%==4 set helptype=muxer
if %errorlevel%==5 set helptype=filter
if %errorlevel%==6 set helptype=bsf
if %errorlevel%==7 set helptype=protocol
if %errorlevel%==8 goto helpff

:helpselectlib
cls
color b
ffmpeg -%helptype%s
echo Enter the one you are interested in from the list
echo Enter the one you are interested in from the list
echo (example: xsub)
echo (example: libvpx)
echo (example: yuv4mpegpipe)
echo (example: buffersink)
echo (example: vp9_superframe_split)
echo (example: prompeg)
echo !!! Please Note that this script was created to configure the ENCODER. For the rest, use the custom mode for manual command input.

set /p helpname=
color a
color f
cls
ffmpeg -h %helptype%=%helpname%
pause
goto helpselect

:lhelpselect
color e
echo Select type
echo --------------------------
echo d - decoder
echo e - encoder
echo u - demuxer
echo m - muxer
echo f - filter
echo b - bsf
echo p - protocol
echo N - back to help
echo --------------------------
echo !!! Please Note that this script was created to configure the ENCODER. For the rest, use the custom mode for manual command input.

choice /C deumfbpn /N

if %errorlevel%==1 set helptype=decoder
if %errorlevel%==2 set helptype=encoder
if %errorlevel%==3 set helptype=demuxer
if %errorlevel%==4 set helptype=muxer
if %errorlevel%==5 set helptype=filter
if %errorlevel%==6 set helptype=bsf
if %errorlevel%==7 set helptype=protocol
if %errorlevel%==8 goto helpff

cls
ffmpeg -%helptype%s
pause
goto lhelpselect

rem Доступные пресеты (В РАЗРАБОТКЕ) -------------------------------------------------------------------------------

:preset
cls
echo To use additional parameters, such as changing the color space, use the configurator, not presets. Also, if you just want to change the video container, then try to use a remux. Believe me, if you need a video, for example in mkv format, you definitely should not reencode it in Mpeg or Xvid.
echo -
echo Choose encoding preset
echo --------------------------
echo 0 - Select tool preset
echo 1 - Webm [Transperent support] [VP9, Opus, audio bitrate 0kbps or 320kbps]
echo 2 - mpeg (Mpeg-1/2, audiocodec mp3, audio bitrate 0kbps or 320kbps)
echo 3 - avi (Mpeg-4/Xvid, audiocodec mp3, audio bitrate 0kbps or 320kbps)
echo 4 - GIF (gif, Configurable)
echo 5 - mp4 (H.264, audio bitrate 320kbps, stereo)
echo 6 - mp4 (H.265, audio bitrate 320kbps, stereo)
echo 7 - mp4 (av1 or SVT-AV1, audio bitrate 320kbps, stereo)
rem av1 имеет лучшую степень сжатия, в то время как svt-av1 обладает скоростью сжатия выше чем у предшественника
echo 8 - ... (-)
echo 9 - Optimize for Youtube Upload
echo N - CONFIGURE 
echo --------------------------
choice /C 123456789N0 /N

if %errorlevel%==1 goto Preset_vp9ts
if %errorlevel%==2 goto Preset_mpeg
if %errorlevel%==3 goto Preset_mpeg4
if %errorlevel%==4 goto Preset_gif
if %errorlevel%==5 goto Preset_h264
if %errorlevel%==6 goto Preset_h265
if %errorlevel%==7 goto Preset_libaom
if %errorlevel%==8 goto Preset_
if %errorlevel%==9 goto OptimizeYT
if %errorlevel%==10 goto configure
if %errorlevel%==11 goto presetTool
exit

:Preset_gif
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo This preset will create a gif with its own palette of colors
pause
:Preset_gifOpt
cls
echo Selecting a video fragment
echo --------------
echo 1 - Skip "n" seconds of video
echo 2 - Gif duration
echo F - Continue
echo --------------
echo Skip %temp1% second(s)
echo Duration %temp3% second(s)

choice /C 12F /N

if %errorlevel%==1 goto Preset_gifSkip
if %errorlevel%==2 goto Preset_gifDuration
if %errorlevel%==3 goto Preset_gifRes

:Preset_gifSkip
cls
echo Set the number of seconds in the video file that you want to skip (example: 120)
set /p temp1=
set temp2=-ss %temp1%
goto Preset_gifOpt

:Preset_gifDuration
cls
echo Set the length of the gif in seconds (example: 5)
set /p temp3=
set temp4=-t %temp3%
goto Preset_gifOpt

:Preset_gifRes
cls
echo Select the gif framerate. Smaller framerate - smaller size
echo --------------
echo 0 - 5 FPS
echo 1 - 10 FPS (Recomended)
echo 2 - 15 FPS
echo 3 - 30 FPS
echo 4 - 50 FPS
echo 5 - 60 FPS
echo 9 - 100 FPS (Just for fun, this is the maximum gif frame rate, but it is not supported by anything. In browsers it will be slowed down to 10 FPS)
echo --------------

choice /C 0123459 /N

if %errorlevel%==1 set temp5=fps=5
if %errorlevel%==2 set temp5=fps=10
if %errorlevel%==3 set temp5=fps=15
if %errorlevel%==4 set temp5=fps=30
if %errorlevel%==5 set temp5=fps=50
if %errorlevel%==6 set temp5=fps=60
if %errorlevel%==7 set temp5=fps=100

cls
echo Select the gif resolution (height). Smaller resolution - smaller size
echo --------------
echo 1 - 144px
echo 2 - 240px (Recomended)
echo 3 - 360px
echo 4 - 480px
echo 5 - 720px
echo 6 - 1080px (Full hd gif? Funny.)
echo --------------

choice /C 1234567 /N

if %errorlevel%==1 set temp6=scale=-2:144
if %errorlevel%==2 set temp6=scale=-2:240
if %errorlevel%==3 set temp6=scale=-2:360
if %errorlevel%==4 set temp6=scale=-2:480
if %errorlevel%==5 set temp6=scale=-2:720
if %errorlevel%==6 set temp6=scale=-2:1080

cls
echo How to loop a gif?
echo --------------
echo 0 - Infinite looping (recomended)
echo 1 - No looping
echo 2 - Loop a specific number of times
echo --------------

choice /C 012 /N

if %errorlevel%==1 set temp7=-loop 0
if %errorlevel%==2 set temp7=-loop -1
if %errorlevel%==3 goto Preset_gifLoop

:Preset_gifEncode
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %temp2% %temp4% %filepath% -vf "%temp5%,%temp6%:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" %temp7% -y "%outputfolder%\%outputname%.gif"
pause
goto welcome

:Preset_gifLoop
cls
echo For example a value of 10 will cause the GIF to play 11 times
echo Enter a value (example: 10)
set /p temp8=
set temp7=-loop %temp8%
goto Preset_gifEncode

:preset_mpeg4
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Select a codec
echo --------------------------
echo 1 - Mpeg-4
echo 2 - Microsoft Mpeg-4 Ver.3 
echo 3 - Xvid
echo --------------------------

choice /C 123 /N

if %errorlevel%==1 set encoder=-c:v mpeg4
if %errorlevel%==2 set encoder=-c:v msmpeg4
if %errorlevel%==3 set encoder=-c:v libxvid

cls
echo --------------------------
echo E - Enable Audio
echo D - Disable Audio
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a libmp3lame -b:a 320K
if %errorlevel%==2 set audiocodec=-an

cls
echo Select quality
echo --------------------------
echo 0 - Best quality (Can output a bunch of warnings during encoding)
echo 1 - Good (recomended)
echo 2 - Medium
echo 3 - Low
echo 4 - The lowest quality (Low file size)
echo --------------------------
choice /C 01234 /N

if %errorlevel%==1 set vidbitrate=-qscale:v 1
if %errorlevel%==2 set vidbitrate=-qscale:v 7
if %errorlevel%==3 set vidbitrate=-qscale:v 15
if %errorlevel%==4 set vidbitrate=-qscale:v 23
if %errorlevel%==5 set vidbitrate=-qscale:v 31

cls
choice /c YN /N /m "Y - Autodetect Framerate, N - Set a custom frame rate"
if %errorlevel%==1 goto preset_mpeg4F
if %errorlevel%==2 cls
echo Enter the frame rate (example: 60)
set /p temp5=
set framerate=-r %temp5%

:preset_mpeg4F
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% %encoder% %audiocodec% %vidbitrate% %framerate% -f avi -y "%outputfolder%\%outputname%.avi"
pause
goto welcome

:preset_mpeg
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Select a codec
echo --------------------------
echo 1 - Mpeg-1
echo 2 - Mpeg-2
echo Q - Mpeg-2 with intel Quick Sync acceleration (Use only if you have it)
echo --------------------------

choice /C 12Q /N

if %errorlevel%==1 set encoder=-c:v mpeg1video
if %errorlevel%==2 set encoder=-c:v mpeg2video
if %errorlevel%==3 set encoder=-c:v mpeg2_qsv

cls
echo --------------------------
echo E - Enable Audio
echo D - Disable Audio
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a libmp3lame -b:a 320K
if %errorlevel%==2 set audiocodec=-an

cls
echo Select quality
echo --------------------------
echo 0 - Best quality (Highest file size)
echo 1 - Good (recomended)
echo 2 - Medium
echo 3 - Low
echo 4 - The lowest quality (Low file size)
echo --------------------------
choice /C 01234 /N

if %errorlevel%==1 set vidbitrate=-qscale:v 1
if %errorlevel%==2 set vidbitrate=-qscale:v 7
if %errorlevel%==3 set vidbitrate=-qscale:v 15
if %errorlevel%==4 set vidbitrate=-qscale:v 23
if %errorlevel%==5 set vidbitrate=-qscale:v 31

cls
choice /c YN /N /m "Y - Autodetect Framerate, N - Set a custom frame rate"
if %errorlevel%==1 goto preset_mpegF
if %errorlevel%==2 cls
echo Enter the frame rate (example: 60)
set /p temp5=
set framerate=-r %temp5%
:preset_mpegF
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% %encoder% %audiocodec% %vidbitrate% %framerate% -f mpeg -y "%outputfolder%\%outputname%.mpeg"
pause
goto welcome

:Preset_vp9ts
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo --------------------------
echo E - Enable Audio
echo D - Disable Audio
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a libopus -b:a 320K
if %errorlevel%==2 set audiocodec=-an

cls
echo Select quality
echo --------------------------
echo 0 - lossless
echo 8 - CRF 8 - Large file size, better quality
echo 6 - CRF 16
echo 4 - CRF 24
echo 2 - CRF 32 - Small file size, poor quality
echo --------------------------
choice /C 08642 /N

if %errorlevel%==1 set vidbitrate=-lossless 1
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32

cls
echo Select the number of threads to encode (It should NOT be more than the number of threads of your CPU)
echo We recommend leaving some free CPU cores. If you select all cores, your processor will probably be 100% loaded until the encoding is completed.
echo --------------------------
echo 1 - 1 thread
echo 2 - 2 threads
echo 4 - 4 threads
echo 6 - 6 threads
echo 8 - 8 threads
echo 9 - 12 threads
echo 0 - 16 threads
echo --------------------------
choice /C 1246890 /N
if %errorlevel%==1 set threads=-threads 1
if %errorlevel%==2 set threads=-threads 2
if %errorlevel%==3 set threads=-threads 4
if %errorlevel%==4 set threads=-threads 6
if %errorlevel%==5 set threads=-threads 8
if %errorlevel%==6 set threads=-threads 12
if %errorlevel%==7 set threads=-threads 16
cls
choice /c YN /N /m "Y - Autodetect Framerate, N - Set a custom frame rate"
if %errorlevel%==1 goto Preset_vp9tsF
if %errorlevel%==2 cls
echo Enter the frame rate (example: 60)
set /p temp5=
set framerate=-r %temp5%
:Preset_vp9tsF
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% -c:v libvpx-vp9 %audiocodec% %vidbitrate% %framerate% -lag-in-frames 0 -auto-alt-ref 0 -f webm -y "%outputfolder%\%outputname%.webm"
pause
goto welcome

rem Доступные Инструменты (В РАЗРАБОТКЕ) -------------------------------------------------------------------------------

:presetTool
cls
echo Choose tool preset (In Development)
echo --------------------------
echo 1 - Extract multiple audio streams from video (extract audio to .mp3 up to 6 streams) 
echo 2 - Upscale or downscale video using different algorithms
echo N - Back to encoding presets
choice /C N12 /N

if %errorlevel%==1 goto preset
if %errorlevel%==2 goto PresetTool_ExtractAll
if %errorlevel%==3 goto PresetTool_Upscaling

:PresetTool_ExtractAll
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Input filenames prefix (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %
ffmpeg %filepath% -map 0:v -c copy "%outputfolder%\%outputname%video0.mkv" -map 0:a:0 -c:a mp3_mf -b:a 320K "%outputfolder%\%outputname%audio0.mp3" -map 0:a:1? -c:a mp3_mf -b:a 320K "%outputfolder%\%outputname%audio1.mp3" -map 0:a:2? -c:a mp3_mf -b:a 320K "%outputfolder%\%outputname%audio2.mp3" -map 0:a:3? -c:a mp3_mf -b:a 320K "%outputfolder%\%outputname%audio3.mp3" -map 0:a:4? -c:a mp3_mf -b:a 320K "%outputfolder%\%outputname%audio4.mp3" -map 0:a:5? -c:a mp3_mf -b:a 320K "%outputfolder%\%outputname%audio5.mp3" -y -strict -2
pause
goto welcome

:PresetTool_Upscaling
cls
echo Choose a scaling algorithm
echo --------------------------
echo 1 - Lanczos (Good Quality, slower, recommended)
echo 2 - Sinc (Good Quality, A ghostly artifacts is possible when the image is zoomed in)
echo 3 - Spline
echo 4 - Bicubic (default)
echo 5 - Bilinear (Fast but blurry)
echo 6 - Fast Bilinear
echo 7 - Neighbor (The fastest, but just takes the color of the pixel from the neighboring ones)
echo 8 - Gauss
echo H - Help me, I don't understand a damn thing. What should I choose?
echo --------------------------
choice /C 12345678H /N
if %errorlevel%==1 set temp1=flags=lanczos
if %errorlevel%==2 set temp1=flags=sinc
if %errorlevel%==3 set temp1=flags=spline
if %errorlevel%==4 set temp1=flags=bicubic
if %errorlevel%==5 set temp1=flags=bilinear
if %errorlevel%==6 set temp1=flags=fast_bilinear
if %errorlevel%==7 set temp1=flags=neighbor
if %errorlevel%==8 set temp1=flags=gauss
if %errorlevel%==9 exit

rem -vf scale=2560:-1:sws_flags=lanczos 
rem sinc		187 fps
rem lanczos		500 fps
rem bicubic		660 fps
rem fast_bilinear	1260 fps
rem neighbor	1300 fps
cls
echo Select the resolution to scale with the original aspect ratio preserved
echo --------------------------
echo 1 - 144px
echo 2 - 240px
echo 3 - 360px
echo 4 - 480px
echo 5 - 720px (HD)
echo 6 - 1080px (Full HD)
echo 7 - 1440px (2K)
echo 8 - 2160px (4K)
echo 9 - 4320px (8K)
echo C - Custom resolution
echo --------------------------
choice /C 12345678H /N
if %errorlevel%==1 set temp2=-2:144&& goto PresetTool_Upscaling_Encode
if %errorlevel%==2 set temp2=-2:240&& goto PresetTool_Upscaling_Encode
if %errorlevel%==3 set temp2=-2:360&& goto PresetTool_Upscaling_Encode
if %errorlevel%==4 set temp2=-2:480&& goto PresetTool_Upscaling_Encode
if %errorlevel%==5 set temp2=-2:720&& goto PresetTool_Upscaling_Encode
if %errorlevel%==6 set temp2=-2:1080&& goto PresetTool_Upscaling_Encode
if %errorlevel%==7 set temp2=-2:1440&& goto PresetTool_Upscaling_Encode
if %errorlevel%==8 set temp2=-2:2160&& goto PresetTool_Upscaling_Encode
if %errorlevel%==9 set temp2=-2:4320&& goto PresetTool_Upscaling_Encode
if %errorlevel%==10 cls

echo Enter the width in pixels (example: 1280)
set /p temp3=
color af
color 5f
cls
echo Enter the height in pixels (example: 720)
set /p temp4=
color af
color 5f
set temp2=%temp3%:%temp4%

:PresetTool_Upscaling_Encode
set size=-vf scale=%temp2%:%temp1%
cls
echo The video will be encoded by the libx264 codec using the CPU. Support for other codecs for this tool may appear in the future
pause
cls
echo Select quality
echo --------------------------
echo 0 - lossless (CRF 0)
echo 8 - CRF 8 - Large file size, better quality
echo 6 - CRF 16
echo 4 - CRF 24
echo 2 - CRF 32 - Small file size, poor quality
echo --------------------------
choice /C 08642 /N

if %errorlevel%==1 set vidbitrate=-crf 0
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32
cls
choice /c YN /N /m "Y - Autodetect Framerate, N - Set a custom frame rate"
if %errorlevel%==1 goto PresetTool_Upscaling_EncodeF
if %errorlevel%==2 cls
echo Enter the frame rate (example: 60)
set /p temp5=
set framerate=-r %temp5%

:PresetTool_Upscaling_EncodeF
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
color a
color f
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% -c:v libx264 -c:a copy %size% %vidbitrate% %framerate% -f mp4 -y "%outputfolder%\%outputname%.mp4"
pause
goto welcome

rem Конфигуратор (В РАЗРАБОТКЕ) -------------------------------------------------------------------------------

:configure
rem CLS Очищает экран командной строки
cls
color f
rem Ввод имени входящего файла
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
color a
color f
rem Выбор библиотеки кодировщика
echo Select encoder
echo --------------------------
echo 0 - Copy Encoder settings from Input File (Remux)
echo 1 - libx264 (H.264)
echo 2 - libx265 (H.265 aka. HEVC)
echo 3 - libsvtav1 (SVT-AV1)
echo 4 - libaom-av1 (av1)
echo 5 - libvpx (VP8)
echo 6 - libvpx-vp9 (VP9)
echo 7 - GIF
echo Q - Custom (half-manual)
echo --------------------------
echo In Development - mpeg4, mpeg1video, mpeg2video

choice /C 01234567q /N

if %errorlevel%==1 goto Conf_copy
if %errorlevel%==2 goto Conf_h264
if %errorlevel%==3 goto Conf_hevc
if %errorlevel%==4 goto Conf_svtav1
if %errorlevel%==5 goto Conf_av1
if %errorlevel%==6 goto Conf_vp8
if %errorlevel%==7 goto Conf_vp9
if %errorlevel%==8 goto Conf_gif
if %errorlevel%==9 goto Conf_Custom

rem КОНФИГУРАЦИЯ РЕМУЛЬТИПЛЕКСИРОВАНИЯ (Протестированна) -------------------------------------------------------------------------------

:Conf_copy
cls
rem Задаёт переменную кодировщика
set encoder=-c:v copy
choice /c YN /N /m "Y - Change Audiocodec, N - Copy Audiocodec"
if %errorlevel%==1 goto conf_copy_AC
if %errorlevel%==2 set audiocodec=-c:a copy && goto Conf_Copy_S

:conf_copy_AC
cls
echo Select Audiocodec
echo --------------------------
echo 1 - AAC (Advanced Audio Coding)
echo 2 - AAC via MediaFoundation (codec aac)
echo 3 - FLAC (Free Lossless Audio Codec)
echo 4 - MP3 via MediaFoundation (codec mp3)
echo 5 - libopus Opus (codec opus)
echo --------------------------

choice /C 12345 /N

if %errorlevel%==1 set audiocodec=-c:a aac
if %errorlevel%==2 set audiocodec=-c:a aac_mf
if %errorlevel%==3 set audiocodec=-c:a flac
if %errorlevel%==4 set audiocodec=-c:a mp3_mf
if %errorlevel%==5 set audiocodec=-c:a libopus

cls
echo Select Audio Bitrate
echo --------------------------
echo 1 - 96 kbps - generally used for speech or low-quality streaming.
echo 2 - 128 kbps - mid-range bitrate quality.
echo 3 - 192 kbps - medium quality bitrate.
echo 4 - 256 kbps - a commonly used high-quality bitrate.
echo 5 - 320 kbps - highest level supported by the MP3 standard.
echo 6 - 384 kbps - Youtube recommended: Stereo
echo 7 - 512 kbps - Youtube recommended: Stereo + 5.1
echo --------------------------
choice /C 1234567 /N

if %errorlevel%==1 set set audiobitrate=-b:a 96K && goto Conf_Copy_S
if %errorlevel%==2 set audiobitrate=-b:a 128K && goto Conf_Copy_S
if %errorlevel%==3 set audiobitrate=-b:a 192K && goto Conf_Copy_S
if %errorlevel%==4 set audiobitrate=-b:a 256K && goto Conf_Copy_S
if %errorlevel%==5 set audiobitrate=-b:a 320K && goto Conf_Copy_S
if %errorlevel%==6 set audiobitrate=-b:a 384K && goto Conf_Copy_S
if %errorlevel%==7 set audiobitrate=-b:a 512K && goto Conf_Copy_S

:Conf_Copy_S
cls
choice /c YNC /N /m "Y - Add subtitles to encoded video, N - Disable Subtitles, C - Copy subtitles from videofile"
if %errorlevel%==1 goto Conf_Copy_selectSC
if %errorlevel%==2 set disablesubtitles=-sn && goto copyLib
if %errorlevel%==3 set subencoder=-c:s copy && goto copyLib

:Conf_Copy_selectSC
cls
echo Select Subtitles File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetSubtitlesFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set temp11=%decode1:?= %
set inputsubtitle=-i "%temp11%"
cls
echo Choose subtitles format
echo --------------------------
echo 1 - DVD subtitles (codec dvd_subtitle)
echo 2 - 3GPP Timed Text subtitle
echo 3 - SubRip subtitle (codec subrip)
echo 4 - ASS (Advanced SubStation Alpha) subtitle (codec ass)
echo 5 - TTML subtitle
echo 6 - Raw text subtitle
echo 7 - WebVTT subtitle
echo --------------------------
choice /C 1234567 /N

if %errorlevel%==1 set subencoder=-c:s dvdsub && goto copyLib
if %errorlevel%==2 set subencoder=-c:s mov_text && goto copyLib
if %errorlevel%==3 set subencoder=-c:s srt && goto copyLib
if %errorlevel%==4 set subencoder=-c:s ssa && goto copyLib
if %errorlevel%==5 set subencoder=-c:s ttml && goto copyLib
if %errorlevel%==6 set subencoder=-c:s text && goto copyLib
if %errorlevel%==7 set subencoder=-c:s webvtt && goto copyLib

:copyLib
rem Имя выходного файла
cls
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo Input new file format (example: mkv [NOT .mkv!!!])
set /p outputformat=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% %inputsubtitle% %encoder% %audiocodec% %subencoder% %audiobitrate% %disablesubtitles% -y -strict -2 "%outputfolder%\%outputname%.%outputformat%"
pause
goto welcome

rem КОНФИГУРАЦИЯ H264 -------------------------------------------------------------------------------

:Conf_h264
echo Choose H.264 encoder
echo --------------------------
echo 1 - libx264 (H.264)
echo 2 - libx264rgb (RGB Colorspace, Perfect for Lossless encoding)
echo 3 - libopenh264 (Open H.264)
echo 4 - h264_amf (AMD AMF H.264 Encoder)
echo 5 - h264_mf (H264 via MediaFoundation)
echo 6 - h264_nvenc (NVIDIA NVENC H.264 encoder)
echo 7 - h264_qsv (Intel Quick Sync Video acceleration)
echo --------------------------
choice /C 1234567 /N

if %errorlevel%==1 set encoder=-c:v libx264 && goto next_libx264
if %errorlevel%==2 set encoder=-c:v libx264rgb && goto next_libx264rgb
if %errorlevel%==3 set encoder=-c:v libopenh264 && goto next_libopenh264
if %errorlevel%==4 set encoder=-c:v h264_amf&& goto next_h264_amf
if %errorlevel%==5 set encoder=-c:v h264_mf && goto next_h264_mf
if %errorlevel%==6 set encoder=-c:v h264_nvenc && goto next_h264_nvenc
if %errorlevel%==7 set encoder=-c:v h264_qsv && goto next_h264_qsv

:next_libx264

:next_libx264rgb

:next_libopenh264

:next_h264_amf

:next_h264_mf

:next_h264_nvenc

:next_h264_qsv

rem Флаги h264_nvenc - ffmpeg -h encoder=h264_nvenc
rem ОПТИМИЗАЦИЯ РОЛИКА ДЛЯ YOUTUBE -------------------------------------------------------------------------------
:OptimizeYT
cls
echo In this section, you can adjust your video to the recommended uploading parameters and with minimal loss of quality.
echo The video will be optimized for Youtube, but it will also be suitable for other services

echo What to do with the video?
echo --------------------------
echo 1 - Just add faststart* in my video (fastest) (remux to mp4)
echo 2 - Encode my video to the YouTube recommended parameters
echo 3 - Encode my HDR video to the YouTube recommended parameters (EXPERIMENTAL)
echo --------------------------
echo *Fast Start refers to, by optimizing MP4, moving the moov atom to the beginning of a video, so that browser will easily locate the moov atom to load and play the video faster, it can progressively stream while it's buffering. You don't have to wait for it to finish downloading.
choice /C 123 /N

if %errorlevel%==1 goto OptimizeYT_faststart
if %errorlevel%==2 goto OptimizeYT_Encode
if %errorlevel%==3 goto OptimizeYT_EncodeHDR

:OptimizeYT_faststart
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% -c copy -movflags +faststart "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:OptimizeYT_Encode
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Choose x264 encoding preset
echo ultrafast and superfast? Seriously? Don't use them. In addition Youtube recommends using CABAC which is not used in these presets
echo --------------------------
echo 1 - veryfast - Fast encoding, The quality is worse
echo 2 - faster
echo 3 - fast
echo 4 - medium (Default)
echo 5 - slow (RECOMENDED)
echo 6 - slower
echo 7 - veryslow - Best Quality, Slowest encoding (excluding placebo of course)
echo --------------------------
echo PLACEBO? You're kidding me, right? I would like to see AT LEAST ONE person who uses this preset to upload videos to the Internet.
choice /C 1234567 /N

if %errorlevel%==1 set preset=-preset veryfast
if %errorlevel%==2 set preset=-preset faster
if %errorlevel%==3 set preset=-preset fast
if %errorlevel%==4 set preset=-preset medium
if %errorlevel%==5 set preset=-preset slow
if %errorlevel%==6 set preset=-preset slower
if %errorlevel%==7 set preset=-preset veryslow

cls
echo Select the number of threads to encode (It should NOT be more than the number of threads of your CPU)
echo We recommend leaving some free CPU cores. If you select all cores, your processor will probably be 100% loaded until the encoding is completed.
echo --------------------------
echo 1 - 1 thread
echo 2 - 2 threads
echo 4 - 4 threads
echo 6 - 6 threads
echo 8 - 8 threads
echo 9 - 12 threads
echo 0 - 16 threads
echo --------------------------
choice /C 1246890 /N
if %errorlevel%==1 set threads=-threads 1
if %errorlevel%==2 set threads=-threads 2
if %errorlevel%==3 set threads=-threads 4
if %errorlevel%==4 set threads=-threads 6
if %errorlevel%==5 set threads=-threads 8
if %errorlevel%==6 set threads=-threads 12
if %errorlevel%==7 set threads=-threads 16

cls
echo Note about Audiocodec. For AAC-LC We use aac instead of libfdk_aac. The license of libfdk_aac is not compatible with GPL, so the GPL does not permit distribution of binaries containing incompatible code when GPL-licensed code is also included. Therefore this encoder have been designated as "non-free", and you cannot download a pre-built ffmpeg that supports it. This can be resolved by compiling ffmpeg yourself.
echo -----
echo Select the audio type
echo --------------------------
echo 0 - mono
echo 1 - Stereo (RECOMENDED)
echo 2 - 5.1
echo --------------------------
choice /C 012 /N

if %errorlevel%==1 set audiotype=-ac 1 && set audiobitrate=-b:a 128k
if %errorlevel%==2 set audiotype=-ac 2 && set audiobitrate=-b:a 384k
if %errorlevel%==3 set audiotype=-ac 6 && set audiobitrate=-b:a 512k

cls 
echo Follow the recommended Youtube bitrate?
echo --------------------------
echo Y - Recomended bitrate
echo N - Unlimited bitrate
echo --------------------------
choice /C YN /N

if %errorlevel%==1 goto OptimizeYT_Encode_Follow
if %errorlevel%==2 goto OptimizeYT_Encode_Unlimited

:OptimizeYT_Encode_Follow
cls
echo Please select quality. This will help us stay within the recommended bitrate
echo --------------------------
echo V - 144p
echo B - 240p
echo N - 360p
echo M - 480p
echo Q - HD, 24-30 FPS (720p)
echo W - HD, 48-60 FPS (720p50/720p60)
echo E - Full HD, 24-30 FPS (1080p)
echo R - Full HD, 48-60 FPS (1080p50/1080p60)
echo T - 2K, 24-30 FPS (1440p)
echo Y - 2K, 48-60 FPS (1440p50/1440p60)
echo U - 4K, 24-30 FPS (2160p)
echo I - 4K, 48-60 FPS (2160p50/2160p60)
echo O - 8K, 24-30 FPS (4320p)
echo P - 8K, 48-60 FPS (4320p50/4320p60)
echo --------------------------
echo Choose the REAL quality of your video. Otherwise we will not be able to follow the recommended values
choice /C VBNMQWERTYUIOP /N

if %errorlevel%==1 set vidbitrate=-b:v 1000K -maxrate 1500K -bufsize 2000K -g 15
if %errorlevel%==2 set vidbitrate=-b:v 1000K -maxrate 1500K -bufsize 2000K -g 15
if %errorlevel%==3 set vidbitrate=-b:v 1000K -maxrate 1500K -bufsize 2000K -g 15
if %errorlevel%==4 set vidbitrate=-b:v 4M -minrate 3M -maxrate 4M -bufsize 8M -g 15
if %errorlevel%==5 set vidbitrate=-b:v 5M -minrate 4M -maxrate 5.5M -bufsize 10M -g 15
if %errorlevel%==6 set vidbitrate=-b:v 7.5M -minrate 7M -maxrate 8M -bufsize 14M -g 30
if %errorlevel%==7 set vidbitrate=-b:v 8M -minrate 7M -maxrate 8.5M -bufsize 16M -g 15
if %errorlevel%==8 set vidbitrate=-b:v 12M -minrate 11M -maxrate 12.5M -bufsize 24M -g 30
if %errorlevel%==9 set vidbitrate=-b:v 16M -minrate 15M -maxrate 17M -bufsize 32M -g 15
if %errorlevel%==10 set vidbitrate=-b:v 24M -minrate 22M -maxrate 25M -bufsize 48M -g 30
if %errorlevel%==11 set vidbitrate=-b:v 43M -minrate 35M -maxrate 45M -bufsize 86M -g 15
if %errorlevel%==12 set vidbitrate=-b:v 66M -minrate 53M -maxrate 68M -bufsize 132M -g 30
if %errorlevel%==13 set vidbitrate=-b:v 150M -minrate 80M -maxrate 160M -bufsize 240M -g 15
if %errorlevel%==14 set vidbitrate=-b:v 220M -minrate 120M -maxrate 240M -bufsize 360M -g 30

cls
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% -c:v libx264 %preset% %vidbitrate% -c:a aac %audiobitrate% %audiotype% -pix_fmt yuv420p -profile:v high -bf 2 -movflags +faststart %threads% "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:OptimizeYT_Encode_Unlimited
cls
echo Please select quality. This will help us stay within the recommended bitrate
echo --------------------------
echo 1 - CRF 0 (x264 LOSSLESS)
echo 2 - CRF 8 - Large file size, better quality
echo 3 - CRF 16 (RECOMENDED)
echo 4 - CRF 24
echo 5 - CRF 32 - Small file size, poor quality
echo --------------------------
choice /C 12345 /N

if %errorlevel%==1 set vidbitrate=-crf 0
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32

cls
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% -c:v libx264 %preset% %vidbitrate% -c:a aac %audiobitrate% %audiotype% -pix_fmt yuv420p -profile:v high -bf 2 -movflags +faststart %threads% "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:OptimizeYT_EncodeHDR
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Choose x264 encoding preset
echo ultrafast and superfast? Seriously? Don't use them. In addition Youtube recommends using CABAC which is not used in these presets
echo --------------------------
echo 1 - veryfast - Fast encoding, The quality is worse
echo 2 - faster
echo 3 - fast
echo 4 - medium (Default)
echo 5 - slow (RECOMENDED)
echo 6 - slower
echo 7 - veryslow - Best Quality, Slowest encoding (excluding placebo of course)
echo --------------------------
echo PLACEBO? You're kidding me, right? I would like to see AT LEAST ONE person who uses this preset to upload videos to the Internet.
choice /C 1234567 /N

if %errorlevel%==1 set preset=-preset veryfast
if %errorlevel%==2 set preset=-preset faster
if %errorlevel%==3 set preset=-preset fast
if %errorlevel%==4 set preset=-preset medium
if %errorlevel%==5 set preset=-preset slow
if %errorlevel%==6 set preset=-preset slower
if %errorlevel%==7 set preset=-preset veryslow

cls
echo Select the number of threads to encode (It should NOT be more than the number of threads of your CPU)
echo We recommend leaving some free CPU cores. If you select all cores, your processor will probably be 100% loaded until the encoding is completed.
echo --------------------------
echo 1 - 1 thread
echo 2 - 2 threads
echo 4 - 4 threads
echo 6 - 6 threads
echo 8 - 8 threads
echo 9 - 12 threads
echo 0 - 16 threads
echo --------------------------
choice /C 1246890 /N
if %errorlevel%==1 set threads=-threads 1
if %errorlevel%==2 set threads=-threads 2
if %errorlevel%==3 set threads=-threads 4
if %errorlevel%==4 set threads=-threads 6
if %errorlevel%==5 set threads=-threads 8
if %errorlevel%==6 set threads=-threads 12
if %errorlevel%==7 set threads=-threads 16

cls
echo Note about Audiocodec. For AAC-LC We use aac instead of libfdk_aac. The license of libfdk_aac is not compatible with GPL, so the GPL does not permit distribution of binaries containing incompatible code when GPL-licensed code is also included. Therefore this encoder have been designated as "non-free", and you cannot download a pre-built ffmpeg that supports it. This can be resolved by compiling ffmpeg yourself.
echo -----
echo Select the audio type
echo --------------------------
echo 0 - mono
echo 1 - Stereo (RECOMENDED)
echo 2 - 5.1
echo --------------------------
choice /C 012 /N

if %errorlevel%==1 set audiotype=-ac 1 && set audiobitrate=-b:a 128k
if %errorlevel%==2 set audiotype=-ac 2 && set audiobitrate=-b:a 384k
if %errorlevel%==3 set audiotype=-ac 6 && set audiobitrate=-b:a 512k

cls 
echo Follow the recommended Youtube bitrate?
echo --------------------------
echo Y - Recomended bitrate
echo N - Unlimited bitrate
echo --------------------------
choice /C YN /N

if %errorlevel%==1 goto OptimizeYT_EncodeHDR_Follow
if %errorlevel%==2 goto OptimizeYT_EncodeHDR_Unlimited

:OptimizeYT_EncodeHDR_Follow
cls
echo Please select quality. This will help us stay within the recommended bitrate
echo --------------------------
echo Lower resolutions for HDR are not Supported on YouTube
echo Q - HD, 24-30 FPS (720p)
echo W - HD, 48-60 FPS (720p50/720p60)
echo E - Full HD, 24-30 FPS (1080p)
echo R - Full HD, 48-60 FPS (1080p50/1080p60)
echo T - 2K, 24-30 FPS (1440p)
echo Y - 2K, 48-60 FPS (1440p50/1440p60)
echo U - 4K, 24-30 FPS (2160p)
echo I - 4K, 48-60 FPS (2160p50/2160p60)
echo O - 8K, 24-30 FPS (4320p)
echo P - 8K, 48-60 FPS (4320p50/4320p60)
echo --------------------------
echo Choose the REAL quality of your video. Otherwise we will not be able to follow the recommended values
choice /C QWERTYUIOP /N

if %errorlevel%==1 set vidbitrate=-b:v 6.5M -minrate 6M -maxrate 7M -bufsize 13M -g 15
if %errorlevel%==2 set vidbitrate=-b:v 9.5M -minrate 9M -maxrate 10M -bufsize 20M -g 30
if %errorlevel%==3 set vidbitrate=-b:v 10M -minrate 9M -maxrate 11M -bufsize 20M -g 15
if %errorlevel%==4 set vidbitrate=-b:v 15M -minrate 14M -maxrate 16M -bufsize 30M -g 30
if %errorlevel%==5 set vidbitrate=-b:v 20M -minrate 18M -maxrate 21M -bufsize 40M -g 15
if %errorlevel%==6 set vidbitrate=-b:v 30M -minrate 28M -maxrate 31M -bufsize 60M -g 30
if %errorlevel%==7 set vidbitrate=-b:v 54M -minrate 44M -maxrate 56M -bufsize 100M -g 15
if %errorlevel%==8 set vidbitrate=-b:v 80M -minrate 66M -maxrate 85M -bufsize 160M -g 30
if %errorlevel%==9 set vidbitrate=-b:v 180M -minrate 100M -maxrate 200M -bufsize 360M -g 15
if %errorlevel%==10 set vidbitrate=-b:v 250M -minrate 150M -maxrate 300M -bufsize 500M -g 30

cls
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% -c:v libx264 %preset% %vidbitrate% -c:a aac %audiobitrate% %audiotype% -pix_fmt yuv420p10le -bf 2 -color_primaries bt2020 -color_trc smpte2084 -colorspace bt2020nc -movflags +faststart %threads% -y "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:OptimizeYT_EncodeHDR_Unlimited
cls
echo Please select quality. This will help us stay within the recommended bitrate
echo --------------------------
echo 1 - CRF 0 (x264 LOSSLESS)
echo 2 - CRF 8 - Large file size, better quality (RECOMENDED)
echo 3 - CRF 16
echo 4 - CRF 24
echo 5 - CRF 32 - Small file size, poor quality
echo --------------------------
choice /C 12345 /N

if %errorlevel%==1 set vidbitrate=-crf 0
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32

cls
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% -c:v libx264 %preset% %vidbitrate% -c:a aac %audiobitrate% %audiotype% -pix_fmt yuv420p10le -bf 2 -color_primaries bt2020 -color_trc smpte2084 -colorspace bt2020nc -movflags +faststart %threads% -y "%outputfolder%\%outputname%.mp4"
pause
goto welcome


rem КОНФИГУРАЦИЯ HEVC -------------------------------------------------------------------------------

rem КОНФИГУРАЦИЯ SVT-AV1 -------------------------------------------------------------------------------

rem КОНФИГУРАЦИЯ AV1 -------------------------------------------------------------------------------

rem КОНФИГУРАЦИЯ VP8 -------------------------------------------------------------------------------

rem КОНФИГУРАЦИЯ VP9 -------------------------------------------------------------------------------

rem КОНФИГУРАЦИЯ GIF -------------------------------------------------------------------------------

rem КОНФИГУРАЦИЯ MPEG-1 -------------------------------------------------------------------------------

rem КОНФИГУРАЦИЯ MPEG-2 -------------------------------------------------------------------------------

rem КОНФИГУРАЦИЯ MPEG-4 -------------------------------------------------------------------------------

rem РУЧНАЯ КОНФИГУРАЦИЯ -------------------------------------------------------------------------------

:Conf_Custom
cls
color e
echo In this mode, you can practice any magic that you like. This is a kind of half-manual input mode.
pause
cls
echo Sounds cool doesn't it?
choice /c YN
if %errorlevel%==2 goto Conf_Custom_joke
echo !Be aware that this mode is experimental, and some codecs may not support the parameters you entered.
pause
cls
echo Errors are also possible due to various incorrect codec combinations, as well as due to the fact that codecs do not fit standard flags
pause
echo Do you want to continue?
choice /c YN
if %errorlevel%==1 goto Conf_Custom_Start
if %errorlevel%==2 goto welcome

:Conf_Custom_joke
color 4
echo Hey! It was very hurtful by the way :(
pause
cls
color c
echo Since you said that this script is bad, then I won't run it for you.
pause
cls
echo Goodbye...
pause
cls
color 8
TIMEOUT /T 15 /NOBREAK
cls
color e
echo It's okay, I'm just kidding. I know this script is cool
pause
cls
echo !Be aware that this mode is experimental, and some codecs may not support the parameters you entered.
pause
cls
echo Errors are also possible due to various incorrect codec combinations, as well as due to the fact that codecs do not fit standard flags
pause
echo Do you want to continue?
choice /c YN
if %errorlevel%==2 goto welcome
cls
color b
echo And again... Don't say hurtful things to anyone.
pause
cls
echo Even if it's just a script...
pause
cls
echo Please...
pause
cls
goto Conf_Custom_Start

:Conf_Custom_Start
:1
cls
color e
echo All settings are optional. Choose everything you need.
echo To turn off the video/audio, go to the codecs section and enter the value you need to turn off the video/audio. The value is written out separately
echo When you set what you want, start encoding by pressing "1"
timeout /T 1
echo ----------------
echo VIDEO SETTINGS
echo Q - Set Video codec
echo W - Set Video bitrate
echo E - Set Video Resolution
echo Y - Set Video Framerate
echo R - Input Videofile
echo P - RESET VIDEO SETTINGS
echo file: %filepath%
echo ----------------
echo AUDIO SETTINGS
echo A - Set Audio codec
echo S - Set Audio bitrate
echo D - Input Audiofile (Do not specify a file to take audio from a video file)
echo L - RESET AUDIO SETTINGS
echo file: %inputaudio%
echo ----------------
echo SUBTITLE SETTINGS
echo X - Set Subtitle Codec
echo C - Input Subtitles file (Do not specify a file to take subtitles from a video file)
echo M - RESET SUBTITLE SETTINGS
echo file: %inputsubtitle%
echo ----------------
echo OTHER
echo T - Select Threads Count
echo I - Enter Custom Flags
echo K - RESET Custom Flags
echo Custom Flags: %flags%
echo ----------------
echo 1 - START ENCODING
echo FFmpeg Arguments: %filepath% %inputaudio% %inputsubtitle% %encoder% %audiocodec% %subencoder% %vidbitrate% %size% %framerate% %disablevideo% %audiobitrate% %volume% %disableaudio% %threads% %flags% %disablesubtitles% -f (your format) -y -strict -2 "(path)"
echo ----------------
echo 5 - Back to main Menu
echo ----------------
echo Does NOT output an error when Codec is selected:
if not novid==%temp1% echo Videocodec: %temp1%, Bitrate: %vidbitrate%, %temp3%x%temp4%, %temp5% FPS
if novid==%temp1% echo VIDEO DISABLED
if noaud==%temp7% echo AUDIO DISABLED
if not noaud==%temp7% echo Audiocodec: %temp7%, Audio bitrate: %temp9% kbps
if nosub==%temp12% echo SUBTITLES DISABLED
if not nosub==%temp12% echo Subtitles: %temp12%

choice /C QWERPASDLXCMTIK51Y /N

if %errorlevel%==1 goto Conf_Custom_VCodec
if %errorlevel%==2 goto Conf_Custom_Vbitrate
if %errorlevel%==3 goto Conf_Custom_Resolution
if %errorlevel%==4 goto Conf_Custom_VInput
if %errorlevel%==5 set disablevideo= && set encoder= && set vidbitrate= && set size= && set framerate= && set temp1= && set temp2= && set temp3= && set temp4= && set temp5= && set filepath= && goto Conf_Custom_Start
if %errorlevel%==6 goto Conf_Custom_ACodec
if %errorlevel%==7 goto Conf_Custom_ABitrate
if %errorlevel%==8 goto Conf_Custom_AInput
if %errorlevel%==9 set disableaudio= && set audiocodec= && set audiobitrate= && set inputaudio= && set temp7= && set temp8= && set temp9= && set temp10= && set temp6= && goto Conf_Custom_Start
if %errorlevel%==10 goto Conf_Custom_SCodec
if %errorlevel%==11 goto Conf_Custom_SubInput
if %errorlevel%==12 set disablesubtitles= && set subencoder= && set inputsubtitle= && set temp11= && set temp12= && goto Conf_Custom_Start
if %errorlevel%==13 goto Conf_Custom_threads
if %errorlevel%==14 goto Conf_Custom_flags
if %errorlevel%==15 set flags= && goto Conf_Custom_Start
if %errorlevel%==16 goto welcome
if %errorlevel%==17 goto Conf_Custom_Render
if %errorlevel%==18 goto Conf_Custom_Framerate

:Conf_Custom_threads
cls
echo Select the number of threads to encode (It should NOT be more than the number of threads of your CPU)
echo !!! NOTE that some encoders DO NOT SUPPORT multithreading and may crash ffmpeg. If you are not sure of your actions, select "Unset".
echo Also the number of threads more than 16 is NOT recommended for some codecs
echo We recommend leaving some free CPU cores. If you select all cores, your processor will probably be 100% loaded until the encoding is completed.
echo --------------------------
echo 1 - Unset (Default recomended)
echo 2 - 2 threads
echo 4 - 4 threads
echo 6 - 6 threads
echo 8 - 8 threads
echo 9 - 12 threads
echo 0 - 16 threads
echo --------------------------
choice /C 1246890 /N
if %errorlevel%==1 set threads=
if %errorlevel%==2 set threads=-threads 2
if %errorlevel%==3 set threads=-threads 4
if %errorlevel%==4 set threads=-threads 6
if %errorlevel%==5 set threads=-threads 8
if %errorlevel%==6 set threads=-threads 12
if %errorlevel%==7 set threads=-threads 16
goto Conf_Custom_Start

:Conf_Custom_VInput
cls
echo Input Videofile
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
goto Conf_Custom_Start

:Conf_Custom_VCodec
cls
echo V..... = Video
echo .F.... = Frame-level multithreading
echo ..S... = Slice-level multithreading
echo ...X.. = Codec is experimental
echo ....B. = Supports draw_horiz_band
echo .....D = Supports direct rendering method 1
echo V....D a64multi             Multicolor charset for Commodore 64 (codec a64_multi)
echo V....D a64multi5            Multicolor charset for Commodore 64, extended with 5th color (colram) (codec a64_multi5)
echo V..... alias_pix            Alias/Wavefront PIX image
echo V..... amv                  AMV Video
echo V....D apng                 APNG (Animated Portable Network Graphics) image
echo V..... asv1                 ASUS V1
echo V..... asv2                 ASUS V2
echo V....D libaom-av1           libaom AV1 (codec av1)
echo V....D librav1e             librav1e AV1 (codec av1)
echo V..... libsvtav1            SVT-AV1(Scalable Video Technology for AV1) encoder (codec av1)
echo V....D avrp                 Avid 1:1 10-bit RGB Packer
echo V....D libxavs2             libxavs2 AVS2-P2/IEEE1857.4 (codec avs2)
echo V..X.D avui                 Avid Meridien Uncompressed
echo V....D ayuv                 Uncompressed packed MS 4:4:4:4
echo VF...D bitpacked            Bitpacked
echo V....D bmp                  BMP (Windows and OS/2 bitmap)
echo VF.... cfhd                 GoPro CineForm HD
echo V..... cinepak              Cinepak
echo V....D cljr                 Cirrus Logic AccuPak
echo V.S..D vc2                  SMPTE VC-2 (codec dirac)
echo VFS..D dnxhd                VC3/DNxHD
echo V....D dpx                  DPX (Digital Picture Exchange) image
echo VFS..D dvvideo              DV (Digital Video)
echo VF...D exr                  OpenEXR image
echo V.S... ffv1                 FFmpeg video codec #1
echo VF.... ffvhuff              Huffyuv FFmpeg variant
echo V....D fits                 Flexible Image Transport System
echo V..... flashsv              Flash Screen Video
echo V..... flashsv2             Flash Screen Video Version 2
echo V..... flv                  FLV / Sorenson Spark / Sorenson H.263 (Flash Video) (codec flv1)
echo V..... gif                  GIF (Graphics Interchange Format)
echo V..... h261                 H.261
echo V..... h263                 H.263 / H.263-1996
echo V.S... h263p                H.263+ / H.263-1998 / H.263 version 2
echo V....D libx264              libx264 H.264 / AVC / MPEG-4 AVC / MPEG-4 part 10 (codec h264)
echo V....D libx264rgb           libx264 H.264 / AVC / MPEG-4 AVC / MPEG-4 part 10 RGB (codec h264)
echo V....D libopenh264          OpenH264 H.264 / AVC / MPEG-4 AVC / MPEG-4 part 10 (codec h264)
echo V....D h264_amf             AMD AMF H.264 Encoder (codec h264)
echo V....D h264_mf              H264 via MediaFoundation (codec h264)
echo V....D h264_nvenc           NVIDIA NVENC H.264 encoder (codec h264)
echo V..... h264_qsv             H.264 / AVC / MPEG-4 AVC / MPEG-4 part 10 (Intel Quick Sync Video acceleration) (codec h264)
echo V....D libx265              libx265 H.265 / HEVC (codec hevc)
echo V....D hevc_amf             AMD AMF HEVC encoder (codec hevc)
echo V....D hevc_mf              HEVC via MediaFoundation (codec hevc)
echo V....D hevc_nvenc           NVIDIA NVENC hevc encoder (codec hevc)
echo V..... hevc_qsv             HEVC (Intel Quick Sync Video acceleration) (codec hevc)
echo VF.... huffyuv              Huffyuv / HuffYUV
echo V..... jpeg2000             JPEG 2000
echo VF.... libopenjpeg          OpenJPEG JPEG 2000 (codec jpeg2000)
echo VF...D jpegls               JPEG-LS
echo VF.... ljpeg                Lossless JPEG
echo VF.... magicyuv             MagicYUV video
echo VFS... mjpeg                MJPEG (Motion JPEG)
echo V..... mjpeg_qsv            MJPEG (Intel Quick Sync Video acceleration) (codec mjpeg)
echo V.S... mpeg1video           MPEG-1 video
echo V.S... mpeg2video           MPEG-2 video
echo V..... mpeg2_qsv            MPEG-2 video (Intel Quick Sync Video acceleration) (codec mpeg2video)
echo V.S... mpeg4                MPEG-4 part 2
echo V..... libxvid              libxvidcore MPEG-4 part 2 (codec mpeg4)
echo V..... msmpeg4v2            MPEG-4 part 2 Microsoft variant version 2
echo V..... msmpeg4              MPEG-4 part 2 Microsoft variant version 3 (codec msmpeg4v3)
echo V..... msvideo1             Microsoft Video-1
echo V....D pam                  PAM (Portable AnyMap) image
echo V....D pbm                  PBM (Portable BitMap) image
echo V..... pcx                  PC Paintbrush PCX image
echo V....D pfm                  PFM (Portable FloatMap) image
echo V....D pgm                  PGM (Portable GrayMap) image
echo V....D pgmyuv               PGMYUV (Portable GrayMap YUV) image
echo VF.... png                  PNG (Portable Network Graphics) image
echo V....D ppm                  PPM (Portable PixelMap) image
echo VF.... prores               Apple ProRes
echo VF.... prores_aw            Apple ProRes (codec prores)
echo VFS... prores_ks            Apple ProRes (iCodec Pro) (codec prores)
echo V..... qtrle                QuickTime Animation (RLE) video
echo V....D r10k                 AJA Kona 10-bit RGB Codec
echo V....D r210                 Uncompressed RGB 10-bit
echo VF...D rawvideo             raw video
echo V..... roqvideo             id RoQ video (codec roq)
echo V..... rpza                 QuickTime video (RPZA)
echo V..... rv10                 RealVideo 1.0
echo V..... rv20                 RealVideo 2.0
echo V..... sgi                  SGI image
echo V..... smc                  QuickTime Graphics (SMC)
echo V..... snow                 Snow
echo V..... speedhq              NewTek SpeedHQ
echo V..... sunrast              Sun Rasterfile image
echo V..... svq1                 Sorenson Vector Quantizer 1 / Sorenson Video 1 / SVQ1
echo V..... targa                Truevision Targa image
echo V....D libtheora            libtheora Theora (codec theora)
echo VF.... tiff                 TIFF image
echo VF.... utvideo              Ut Video
echo VF...D v210                 Uncompressed 4:2:2 10-bit
echo V....D v308                 Uncompressed packed 4:4:4
echo V....D v408                 Uncompressed packed QT 4:4:4:4
echo V....D v410                 Uncompressed 4:4:4 10-bit
echo V....D libvpx               libvpx VP8 (codec vp8)
echo V....D libvpx-vp9           libvpx VP9 (codec vp9)
echo V..... vp9_qsv              VP9 video (Intel Quick Sync Video acceleration) (codec vp9)
echo V....D libwebp_anim         libwebp WebP image (codec webp)
echo V....D libwebp              libwebp WebP image (codec webp)
echo V..... wmv1                 Windows Media Video 7
echo V..... wmv2                 Windows Media Video 8
echo V..... wrapped_avframe      AVFrame to AVPacket passthrough
echo V..... xbm                  XBM (X BitMap) image
echo V....D xface                X-face image
echo V....D xwd                  XWD (X Window Dump) image
echo V....D y41p                 Uncompressed YUV 4:1:1 12-bit
echo V....D yuv4                 Uncompressed packed 4:2:0
echo VF.... zlib                 LCL (LossLess Codec Library) ZLIB
echo -------------               copy          Copies the codec of the source file
echo -------------               novid         Sets the -vn flag to disable the video
echo If the encoder name is incorrect, ffmpeg throws an error at the end of the process!!!
echo WRITE "novid" TO DISABLE THE VIDEO
echo Use copy for using the codec of the source file. This will save you from completely reencoding the video, and save a lot of time.
echo For normal purposes, we strongly recommend libx264, libx265 or libaom-av1 (.MP4/.mkv). Also you could use libvpx/libvpx-vp9 (.webm/.mkv).
echo Use Ctrl+F to search
echo WRITE THE NAME OF YOUR PREFERRED ENCODER (Example: libx264)
set /p temp1=
color 2
if %temp1%==novid set disablevideo=-vn && set encoder= && set vidbitrate= && set size= && set framerate= && goto Conf_Custom_Start
set encoder=-c:v %temp1%
set disablevideo=
goto Conf_Custom_Start

:Conf_Custom_Vbitrate
cls
echo What type of bitrate do you want to choose?
echo --------
echo 1 - CBR (The usual value in kbps. Works great everywhere. Recommended)
echo 2 - CRF (Constant Rate Factor, Variable bitrate that depends on the complexity of the image. Not all codecs support CRF, but the most popular ones understand it.)
echo 3 - QP (Like CRF, lower value means higher quality. However, the maximum value may be different in different codecs)
echo --------
choice /c 123 /N
if %errorlevel%==1 goto Conf_Custom_VbitrateCBR
if %errorlevel%==2 goto Conf_Custom_VbitrateCRF
if %errorlevel%==3 goto Conf_Custom_VbitrateQP

:Conf_Custom_VbitrateCBR
cls
echo The minimum and maximum bitrate values can be specified with custom flags using -minrate and -maxrate
echo Enter the video bitrate in kbps (CBR) (example: 20000)
set /p temp2=
color 2
set vidbitrate=-b:v %temp2%K
goto Conf_Custom_Start

:Conf_Custom_VbitrateCRF
cls
echo The minimum and maximum bitrate values can be specified with custom flags using -minrate and -maxrate
echo Enter the CRF value (0-51) (example: 17)
set /p temp2=
color 2
set vidbitrate=-crf %temp2%
goto Conf_Custom_Start

:Conf_Custom_VbitrateQP
cls
echo The minimum and maximum bitrate values can be specified with custom flags using -minrate and -maxrate
echo Enter the QP value (0-51 in x264) (example: 14)
set /p temp2=
color 2
set vidbitrate=-qp %temp2%
goto Conf_Custom_Start

:Conf_Custom_Resolution
cls
echo Enter the width in pixels (example: 1280)
set /p temp3=
color 2
color f
cls
echo Enter the height in pixels (example: 720)
set /p temp4=
color 2
set size=-s %temp3%x%temp4%
goto Conf_Custom_Start

:Conf_Custom_Framerate
cls
echo Enter the frame rate (example: 60)
set /p temp5=
set framerate=-r %temp5%
goto Conf_Custom_Start

:Conf_Custom_AInput
cls
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetAudioFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set temp6=%decode1:?= %
set inputaudio=-i "%temp6%"
goto Conf_Custom_Start

:Conf_Custom_ACodec
cls
echo A..... = Audio
echo .F.... = Frame-level multithreading
echo ..S... = Slice-level multithreading
echo ...X.. = Codec is experimental
echo ....B. = Supports draw_horiz_band
echo .....D = Supports direct rendering method 1
echo A..... aac                  AAC (Advanced Audio Coding)
echo A....D aac_mf               AAC via MediaFoundation (codec aac)
echo A....D ac3                  ATSC A/52A (AC-3)
echo A....D ac3_fixed            ATSC A/52A (AC-3) (codec ac3)
echo A....D ac3_mf               AC3 via MediaFoundation (codec ac3)
echo A....D adpcm_adx            SEGA CRI ADX ADPCM
echo A....D adpcm_argo           ADPCM Argonaut Games
echo A....D g722                 G.722 ADPCM (codec adpcm_g722)
echo A....D g726                 G.726 ADPCM (codec adpcm_g726)
echo A....D g726le               G.726 little endian ADPCM ("right-justified") (codec adpcm_g726le)
echo A....D adpcm_ima_alp        ADPCM IMA High Voltage Software ALP
echo A....D adpcm_ima_amv        ADPCM IMA AMV
echo A....D adpcm_ima_apm        ADPCM IMA Ubisoft APM
echo A....D adpcm_ima_qt         ADPCM IMA QuickTime
echo A....D adpcm_ima_ssi        ADPCM IMA Simon and Schuster Interactive
echo A....D adpcm_ima_wav        ADPCM IMA WAV
echo A....D adpcm_ima_ws         ADPCM IMA Westwood
echo A....D adpcm_ms             ADPCM Microsoft
echo A....D adpcm_swf            ADPCM Shockwave Flash
echo A....D adpcm_yamaha         ADPCM Yamaha
echo A..... alac                 ALAC (Apple Lossless Audio Codec)
echo A..... libopencore_amrnb    OpenCORE AMR-NB (Adaptive Multi-Rate Narrow-Band) (codec amr_nb)
echo A....D aptx                 aptX (Audio Processing Technology for Bluetooth)
echo A....D aptx_hd              aptX HD (Audio Processing Technology for Bluetooth)
echo A....D comfortnoise         RFC 3389 comfort noise generator
echo A..X.D dca                  DCA (DTS Coherent Acoustics) (codec dts)
echo A....D eac3                 ATSC A/52 E-AC-3
echo A....D flac                 FLAC (Free Lossless Audio Codec)
echo A....D g723_1               G.723.1
echo A..X.. mlp                  MLP (Meridian Lossless Packing)
echo A..... mp2                  MP2 (MPEG audio layer 2)
echo A..... mp2fixed             MP2 fixed point (MPEG audio layer 2) (codec mp2)
echo A..... libtwolame           libtwolame MP2 (MPEG audio layer 2) (codec mp2)
echo A....D libmp3lame           libmp3lame MP3 (MPEG audio layer 3) (codec mp3)
echo A....D mp3_mf               MP3 via MediaFoundation (codec mp3)
echo A....D nellymoser           Nellymoser Asao
echo A..X.. opus                 Opus
echo A..... libopus              libopus Opus (codec opus)
echo A....D pcm_alaw             PCM A-law / G.711 A-law
echo A....D pcm_dvd              PCM signed 16/20/24-bit big-endian for DVD media
echo A....D pcm_f32be            PCM 32-bit floating point big-endian
echo A....D pcm_f32le            PCM 32-bit floating point little-endian
echo A....D pcm_f64be            PCM 64-bit floating point big-endian
echo A....D pcm_f64le            PCM 64-bit floating point little-endian
echo A....D pcm_mulaw            PCM mu-law / G.711 mu-law
echo A....D pcm_s16be            PCM signed 16-bit big-endian
echo A....D pcm_s16be_planar     PCM signed 16-bit big-endian planar
echo A....D pcm_s16le            PCM signed 16-bit little-endian
echo A....D pcm_s16le_planar     PCM signed 16-bit little-endian planar
echo A....D pcm_s24be            PCM signed 24-bit big-endian
echo A....D pcm_s24daud          PCM D-Cinema audio signed 24-bit
echo A....D pcm_s24le            PCM signed 24-bit little-endian
echo A....D pcm_s24le_planar     PCM signed 24-bit little-endian planar
echo A....D pcm_s32be            PCM signed 32-bit big-endian
echo A....D pcm_s32le            PCM signed 32-bit little-endian
echo A....D pcm_s32le_planar     PCM signed 32-bit little-endian planar
echo A....D pcm_s64be            PCM signed 64-bit big-endian
echo A....D pcm_s64le            PCM signed 64-bit little-endian
echo A....D pcm_s8               PCM signed 8-bit
echo A....D pcm_s8_planar        PCM signed 8-bit planar
echo A....D pcm_u16be            PCM unsigned 16-bit big-endian
echo A....D pcm_u16le            PCM unsigned 16-bit little-endian
echo A....D pcm_u24be            PCM unsigned 24-bit big-endian
echo A....D pcm_u24le            PCM unsigned 24-bit little-endian
echo A....D pcm_u32be            PCM unsigned 32-bit big-endian
echo A....D pcm_u32le            PCM unsigned 32-bit little-endian
echo A....D pcm_u8               PCM unsigned 8-bit
echo A....D pcm_vidc             PCM Archimedes VIDC
echo A....D real_144             RealAudio 1.0 (14.4K) (codec ra_144)
echo A....D roq_dpcm             id RoQ DPCM
echo A..X.D s302m                SMPTE 302M
echo A....D sbc                  SBC (low-complexity subband codec)
echo A..X.. sonic                Sonic
echo A..X.. sonicls              Sonic lossless
echo A..X.. truehd               TrueHD
echo A..... tta                  TTA (True Audio)
echo A..X.. vorbis               Vorbis
echo A....D libvorbis            libvorbis (codec vorbis)
echo A..... wavpack              WavPack
echo A..... wmav1                Windows Media Audio 1
echo A..... wmav2                Windows Media Audio 2
echo -------------               copy          Copies the codec of the source file
echo -------------               noaud         Sets the -an flag to disable the audio
echo If the encoder name is incorrect, ffmpeg throws an error at the end of the process!!!
echo WRITE "noaud" TO DISABLE THE AUDIO
echo For normal purposes, we strongly recommend: aac, mp3_mf.
echo Also you could use lossless: flac or pcm (.wav).
echo Use copy for using the codec of the source file
echo Use Ctrl+F to search
echo WRITE THE NAME OF YOUR PREFERRED AUDIOCODEC (Example: aac)
set /p temp7=
color 2
if %temp7%==noaud set disableaudio=-an && set audiocodec= && set audiobitrate= && goto Conf_Custom_Start
set audiocodec=-c:a %temp7%
set disableaudio=
goto Conf_Custom_Start

:Conf_Custom_ABitrate
cls
echo Enter the audio bitrate in kbps (example: 256)
set /p temp9=
color 2
set audiobitrate=-b:a %temp9%K
goto Conf_Custom_Start

:Conf_Custom_SubInput
cls
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetSubtitlesFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set temp11=%decode1:?= %
set inputsubtitle=-i "%temp11%"
goto Conf_Custom_Start

:Conf_Custom_SCodec
cls
echo S..... = Subtitle
echo .F.... = Frame-level multithreading
echo ..S... = Slice-level multithreading
echo ...X.. = Codec is experimental
echo ....B. = Supports draw_horiz_band
echo .....D = Supports direct rendering method 1
echo S..... ssa                  ASS (Advanced SubStation Alpha) subtitle (codec ass)
echo S..... ass                  ASS (Advanced SubStation Alpha) subtitle
echo S..... dvbsub               DVB subtitles (codec dvb_subtitle)
echo S..... dvdsub               DVD subtitles (codec dvd_subtitle)
echo S..... mov_text             3GPP Timed Text subtitle
echo S..... srt                  SubRip subtitle (codec subrip)
echo S..... subrip               SubRip subtitle
echo S..... text                 Raw text subtitle
echo S..... ttml                 TTML subtitle
echo S..... webvtt               WebVTT subtitle
echo S..... xsub                 DivX subtitles (XSUB)
echo -------------               copy          Copies the codec of the source file
echo -------------               nosub         Sets the -sn flag to disable subtitles
echo If the encoder name is incorrect, ffmpeg throws an error at the end of the process!!!
echo WRITE "nosub" TO DISABLE SUBTITLES
echo We recommend: srt or ssa. webvtt For webm converter (supports Opus and vp8/vp9)
echo Use copy for using the codec of the source file
echo Use Ctrl+F to search
echo WRITE THE NAME OF YOUR PREFERRED AUDIOCODEC (Example: subrip)
set /p temp12=
color 2
if %temp12%==nosub set disablesubtitles=-sn && set subencoder= && goto Conf_Custom_Start
set disablesubtitles=
set subencoder=-c:s %temp12%
goto Conf_Custom_Start

:Conf_Custom_flags
cls
color 4
color e
echo Do not make mistakes, otherwise ffmpeg may return an error
echo Run this one again in a new window and use the flags help (Press H, then 4, select "encoder" and then enter the name of the codec you are interested in)
echo See the help for information about supported color spaces and sampling rates for different codecs
echo Parameters such as color space, sampling rate, min/max rate, audio/video filters are set only by manually entering the flags
pause
cls
echo Enter your flags for the encoder (example: -preset slow -aq-mode 2 -rc-lookahead 60)
set /p flags=
goto Conf_Custom_Start

:Conf_Custom_Render
cls
echo Input NEW filename (example: lol0 [NOT lol0.mkv!!!])
set /p outputname=
color a
color f
cls
echo Note that the codec must support this format. Many support .mkv, libvpx (vp8/vp/opus) supports .webm, mpeg-1/2 supports .mpeg, mpeg-4/xvid supports .avi, and so on
echo Input new file format (example: mkv [NOT .mkv!!!])
set /p outputformat=
color a
color f
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %
cls
if not novid==%temp1% echo Videocodec: %temp1%, Bitrate: %vidbitrate%, %temp3%x%temp4%, %temp5% FPS
if novid==%temp1% echo VIDEO DISABLED
echo file: %filepath%
if noaud==%temp7% echo AUDIO DISABLED
if not noaud==%temp7% echo Audiocodec: %temp7%, Audio bitrate: %temp9% kbps
echo file: %inputaudio%
if nosub==%temp12% echo SUBTITLES DISABLED
if not nosub==%temp12% echo Subtitles: %temp12%
echo file: %inputsubtitle%
echo Custom Flags: %flags%
echo ----------------
echo FFmpeg Arguments: %filepath% %inputaudio% %inputsubtitle% %encoder% %audiocodec% %subencoder% %vidbitrate% %size% %framerate% %disablevideo% %audiobitrate% %volume% %disableaudio% %threads% %flags% %disablesubtitles% -f %outputformat% -y -strict -2 "%outputfolder%\%outputname%.%outputformat%"
pause
color 8f
echo !!! Starting FFMPEG
TIMEOUT /T 5

ffmpeg %filepath% %inputaudio% %inputsubtitle% %encoder% %audiocodec% %subencoder% %vidbitrate% %size% %framerate% %disablevideo% %audiobitrate% %volume% %disableaudio% %threads% %flags% %disablesubtitles% -f %outputformat% -y -strict -2 "%outputfolder%\%outputname%.%outputformat%"
color f
pause
echo Are you sure you want to exit? This will erase the ffmpeg log
pause
goto welcome

rem НЕРАБОЧАЯ ОБЛАСТЬ -------------------------------------------------------------------------------
exit
#:ex
set /p gnida=
pause
echo %gnida%
pause

#:libvpx-vp9
ffmpeg -i "E:\RENDERS\CONVERT TO WEBM\SceneOverlay.mov" -c:v libvpx-vp9 -crf 8 -an -threads 8 -lag-in-frames 0 -auto-alt-ref 0 -f webm -y "E:\RENDERS\SceneOverlayvp9.webm"
pause

#:example
ffmpeg -i "E:\RENDERS\CONVERT TO WEBM\SceneOverlay.mov" -c:v libvpx -crf 16 -b:v 20000K -an -threads 8 -quality best -lag-in-frames 16 -auto-alt-ref 0 -f webm -y "E:\RENDERS\SceneOverlay.webm"
pause