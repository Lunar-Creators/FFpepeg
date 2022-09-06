@echo off
rem Доступные переменные - %filepath% %inputaudio% %encoder% %outputformat% %outputname% %preset% %Profile% %tune% %vidbitrate% %audiocodec% %threads% %audiobitrate% %volume% %flags% %SUPERCUSTOMMODE% %outputfolder% %subencoder% %inputsubtitle% %disablevideo% %disableaudio% %disablesubtitles% %framerate% %size%
rem Конфигурация Copy - Запрос нового имени, Запрос нового формата
rem Конфигурация libx264 - Запрос подраздела кодировщика, пресет кодирования, Выбор профиля, Выбор опции, Изменить разрешение, CBR или CRF битрейт, задать значение, вывод аудио, Выбор кодека или стандартные настройки, задать значение битрейта аудио, Запрос субтитров, дополнительные ключи, Запрос нового имени, Запрос нового формата

:welcome
cls
color e
echo --ScriptVersion 0.4 -alpha --copyright "SHULKER Play" --ffmpeg.org
echo !!! Each person can have their own usage of this script and ffmpeg in general. 
echo !!! We can't check all the combinations ourselves. 
echo !!! If you have a problem, or you want to suggest a library to add to the menu, please contact us!
timeout /t 1
echo WELCOME TO FFMPEG ENCODE SCRIPT!

echo --------------------------
echo H - FFmpeg Help
echo Y - Select Preset
echo N - Configure Video Encoder
echo A - Configure only Audio Encoder
echo K - Audio to Video Encoding
echo C - Custom mode
echo X - Contact Us
echo V - Open Video Downloader (NEW RELEASE!)
echo E - Exit
echo --------------------------
choice /C YNHECAKXV /N

rem if %errorlevel%==1 goto preset
if %errorlevel%==1 echo IN DEVELOPMENT && pause && goto welcome
if %errorlevel%==2 goto configure
if %errorlevel%==3 goto helpff
if %errorlevel%==4 exit
if %errorlevel%==5 goto SUPERCUSTOMMODE
if %errorlevel%==6 echo IN DEVELOPMENT && pause && goto welcome
if %errorlevel%==7 echo IN DEVELOPMENT && pause && goto welcome
if %errorlevel%==8 explorer.exe "https://vk.com/im?sel=-120367298" && goto welcome
if %errorlevel%==9 yt-dl_init.bat
goto welcome

:SUPERCUSTOMMODE
color f
echo In this mode you can run your command with your flags for ffmpeg
echo Use this mode if you fully know what you are doing. "ffmpeg -h" for help. 
echo My working Example: (ffmpeg -i "E:\RENDERS\CONVERT TO WEBM\SceneOverlay.mov" -c:v libvpx -crf 16 -b:v 20000K -an -threads 8 -quality best -lag-in-frames 16 -auto-alt-ref 0 -f webm -y "E:\RENDERS\SceneOverlay.webm")
echo Close the window to exit
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

ffmpeg -%helptype%s
pause
goto lhelpselect

rem Доступные пресеты (В РАЗРАБОТКЕ) -------------------------------------------------------------------------------

:preset
echo Choose preset
echo --------------------------
echo 1 - Webm (No Audio, vp8, Best quality, bitrate 20mbps) [Transperent standart]
echo 2 - Webm (opus, vp8, best quality, bitrate 20mbps, audio bitrate 256kbps)
echo 3 - Webm (opus, vp9, Best quality, bitrate 20mbps, audio bitrate 256kbps)
echo 4 - GIF (gif, choose bitrate) [experimental]
echo 5 - mp4 (H.264, Visual lossless, audio bitrate 256kbps)
echo 6 - mp4 (H.265, Visual lossless, audio bitrate 256kbps)
echo 7 - mp4 (av1, Visual Lossless, audio bitrate 256kbps)
echo 8 - mp4 (SVT-AV1, Visual Lossless, audio bitrate 256kbps)
echo 9 - YouTube Preset (mp4, H.264 - SLOW, AAC, CRF 16, Audio Bitrate 256kbps, + FASTSTART) 
echo N - CONFIGURE 
echo --------------------------
echo !!! "Visual Lossless" means: -CRF 16
choice /C 123456789N /N

if %errorlevel%==1 goto Preset_vp8na
if %errorlevel%==2 goto Preset_vp8opus
if %errorlevel%==3 goto Preset_vp9
if %errorlevel%==4 goto Preset_gif
if %errorlevel%==5 goto Preset_h264
if %errorlevel%==6 goto Preset_h265
if %errorlevel%==7 goto Preset_av1
if %errorlevel%==8 goto Preset_svtav1
if %errorlevel%==9 goto Preset_YT
if %errorlevel%==10 goto configure

rem Конфигуратор (В РАЗРАБОТКЕ) -------------------------------------------------------------------------------

:configure
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
echo --------------------------
choice /C 12345 /N

if %errorlevel%==1 set set audiobitrate=-b:a 96K && goto Conf_Copy_S
if %errorlevel%==2 set audiobitrate=-b:a 128K && goto Conf_Copy_S
if %errorlevel%==3 set audiobitrate=-b:a 192K && goto Conf_Copy_S
if %errorlevel%==4 set audiobitrate=-b:a 256K && goto Conf_Copy_S
if %errorlevel%==5 set audiobitrate=-b:a 320K && goto Conf_Copy_S



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
rem Имя выходного файлаc
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

:Conf_Custom_Start
color 5f
cls
echo Select the number of threads to encode (It should NOT be more than the number of threads of your CPU)
echo !!! NOTE that some encoders DO NOT SUPPORT multithreading and may crash ffmpeg. If you are not sure of your actions, enter 1. 1 - the default stable value
echo Also the number of threads more than 16 is NOT recommended for ffmpeg
echo --------------------------
echo 1 - 1 (default safe thread count)
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
set filepath=
cls
choice /c YN /N /m "Y - Enable Video, N - Disable Video"
if %errorlevel%==1 goto Conf_Custom_StartVC
if %errorlevel%==2 set disablevideo=-vn && goto Conf_Custom_A

:Conf_Custom_StartVC
echo Input Videofile
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
color a
color f
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
echo V..... libjxl               libjxl JPEG XL (codec jpegxl)
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
echo V....D phm                  PHM (Portable HalfFloatMap) image
echo VF.... png                  PNG (Portable Network Graphics) image
echo V....D ppm                  PPM (Portable PixelMap) image
echo VF.... prores               Apple ProRes
echo VF.... prores_aw            Apple ProRes (codec prores)
echo VFS... prores_ks            Apple ProRes (iCodec Pro) (codec prores)
echo VF.... qoi                  QOI (Quite OK Image format) image
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
echo V.S..D vbn                  Vizrt Binary Image
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
echo V....D zmbv                 Zip Motion Blocks Video
echo -------------               copy          Copies the codec of the source file
echo If the encoder name is incorrect, ffmpeg throws an error at the end of the process!!!
echo Use copy for using the codec of the source file
echo For normal purposes, we strongly recommend libx264, libx265.
echo Also you could use libvpx/libvpx-vp9 or mpeg4.
echo Use Ctrl+F to search
echo WRITE THE NAME OF YOUR PREFERRED ENCODER (Example: libx264)
set /p temp1=
color af
color 5f
set encoder=-c:v %temp1%
cls
echo ENCODER: %temp1%
if %temp1%==copy goto Conf_Custom_A
echo Do you want to add bitrate settings and other parameters?
echo You can skip the user settings, if you use the "copy" codec, all settings will be taken from the source file. This will save you from transcoding and will take less time
choice /c YN /N /m "Y - Add custom Settings, N - Skip Custom Settings"
if %errorlevel%==1 goto Conf_Custom_VC_Setup
if %errorlevel%==2 goto Conf_Custom_A

:Conf_Custom_VC_Setup
echo !!! To reduce the number of errors, the CRF bitrate can only be used in normal mode with the H264 and HEVC encoders. 
echo Enter the video bitrate in kbps (CBR) (example: 20000)
set /p temp2=
color af
color 5f
set vidbitrate=-b:v %temp2%K
cls
echo ENCODER: %temp1%, Bitrate %temp2% kbps
echo Do you want to choose a custom resolution and frame rate?
choice /c YN /N /m "Y - Yes, N - No"
if %errorlevel%==1 goto Conf_Custom_VC_visual
if %errorlevel%==2 goto Conf_Custom_A

:Conf_Custom_VC_visual
cls
echo Enter the width in pixels (example: 1280)
set /p temp3=
color af
color 5f
cls
echo Enter the height in pixels (example: 720)
set /p temp4=
color af
color 5f
set size=-s %temp3%x%temp4%
cls
echo Enter the frame rate (example: 60)
set /p temp5=
set framerate=-r %temp5%
cls
echo ENCODER: %temp1%, Bitrate %temp2% kbps, %temp3%x%temp4%, %temp5% FPS
pause
goto Conf_Custom_A

:Conf_Custom_A
choice /c YN /N /m "Y - Enable Audio, N - Disable Audio"
if %errorlevel%==1 goto Conf_Custom_StartA
if %errorlevel%==2 set disableaudio=-an && goto Conf_Custom_S

:Conf_Custom_StartA
choice /c YN /N /m "Y - Take Audio from videofile, N - Select Custom Audiofile"
if %errorlevel%==1 goto Conf_Custom_AC
if %errorlevel%==2 goto Conf_Custom_SelectA

:Conf_Custom_SelectA
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetAudioFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set temp6=%decode1:?= %
set inputaudio=-i "%temp6%"
goto Conf_Custom_AC

:Conf_Custom_AC
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
echo A....D adpcm_ima_ssi        ADPCM IMA Simon & Schuster Interactive
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
echo A....D dfpwm                DFPWM1a audio
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
echo A....D pcm_bluray           PCM signed 16/20/24-bit big-endian for Blu-ray media
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
echo -------------               copy          Copies the codec of the source file
echo If the encoder name is incorrect, ffmpeg throws an error at the end of the process!!!
echo For normal purposes, we strongly recommend: aac, libopus, mp3_mf.
echo Also you could use lossless: flac.
echo Use copy for using the codec of the source file
echo Use Ctrl+F to search
echo WRITE THE NAME OF YOUR PREFERRED AUDIOCODEC (Example: aac)
set /p temp7=
color af
color 5f
set audiocodec=-c:a %temp7%
cls
echo AUDIOCODEC: %temp7%
if %temp7%==copy goto Conf_Custom_S
echo Do you want to set bitrate and audio sampling rate or volume?
echo You can skip the user settings, if you use the "copy" codec, all settings will be taken from the source file. This will save you from transcoding and will take less time
choice /c YN /N /m "Y - Add custom Settings, N - Skip Custom Settings"
if %errorlevel%==1 goto Conf_Custom_AC_Setup
if %errorlevel%==2 goto Conf_Custom_S

:Conf_Custom_AC_Setup
echo Enter the audio bitrate in kbps (example: 256)
set /p temp9=
color af
color 5f
set audiobitrate=-b:a %temp9%K
cls 
echo AUDIOCODEC: %temp7%, bitrate: %temp9% kbps
echo Enter the volume multiplier (example: 1.5) (0.5 = 50% volume, 1.5 = 150% volume)
echo Enter 1.0 to not change the volume
set /p temp10=
set volume=-filter:a "volume=%temp10%"
cls
echo AUDIOCODEC: %temp7%, bitrate: %temp9% kbps, Volume %temp10%
pause
goto Conf_Custom_S

:Conf_Custom_S
choice /c YNC /N /m "Y - Select Subtitle file, N - Disable Subtitles, C - Copy subtitles from videofile"
if %errorlevel%==1 goto Conf_Custom_selectSC
if %errorlevel%==2 set disablesubtitles=-sn && goto Conf_Custom_flags
if %errorlevel%==3 set subencoder=-c:s copy && goto Conf_Custom_flags

:Conf_Custom_selectSC
echo Select Input File
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetSubtitlesFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set temp11=%decode1:?= %
set inputsubtitle=-i "%temp11%"
goto Conf_Custom_SC

:Conf_Custom_SC
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
echo If the encoder name is incorrect, ffmpeg throws an error at the end of the process!!!
echo We recommend: srt or ssa. webvtt For webm converter (supports Opus and vp8/vp9)
echo Use copy for using the codec of the source file
echo Use Ctrl+F to search
echo WRITE THE NAME OF YOUR PREFERRED AUDIOCODEC (Example: aac)
set /p temp12=
color af
color 5f
set subencoder=-c:s %temp12%
cls
echo Subtitle codec: %temp12%, Selected file: %temp11%
pause
goto Conf_Custom_flags

:Conf_Custom_flags
cls
echo Parameters such as color space and sampling rate are set only by manually entering the flags
choice /c YN /N /m "Y - Manually type custom flags, N - Start ffmpeg"
if %errorlevel%==1 goto Conf_Custom_flagstype
if %errorlevel%==2 set flags= && goto Conf_Custom_Render

:Conf_Custom_flagstype
cls
color f
echo You can use your additional flags for ffmpeg
echo Do not make mistakes, otherwise ffmpeg may return an error
echo Run this one again in a new window and use the flags help (Press H, then 4, select "encoder" and then enter the name of the codec you are interested in)
pause
echo Leave the field empty and press enter if you don't want to enter anything
pause
cls
echo Enter your flags for the encoder (example: -preset slow -aq-mode 2 -rc-lookahead 60)
set /p flags=
goto Conf_Custom_Render

:Conf_Custom_Render
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

echo VIDEO CODEC: %temp1%
echo Video Container: %outputformat%
echo Video bitrate: %temp2% kbps
echo Resolution %temp3%x%temp4%
echo %temp5% Frames Per Second
echo AUDIO CODEC: %temp7%
echo Audio bitrate: %temp9% kbps
echo Volume %temp10%
echo SUBTITLE CODEC: %temp12%
echo Output Folder: %outputfolder%
echo Name: %outputname%.%outputformat%
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

#:libvpx
ffmpeg -i "E:\RENDERS\CONVERT TO WEBM\%filepath%" -c:v libvpx -crf 16 -b:v 20000K -an -threads 8 -lag-in-frames 0 -auto-alt-ref 0 -f webm -y "E:\RENDERS\SceneOverlay.webm"
pause

#:example
ffmpeg -i "E:\RENDERS\CONVERT TO WEBM\SceneOverlay.mov" -c:v libvpx -crf 16 -b:v 20000K -an -threads 8 -quality best -lag-in-frames 16 -auto-alt-ref 0 -f webm -y "E:\RENDERS\SceneOverlay.webm"
pause