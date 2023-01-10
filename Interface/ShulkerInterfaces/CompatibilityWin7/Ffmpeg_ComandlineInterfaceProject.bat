@echo off
chcp 866
echo Скрипт основан на FFmpeg. FFmpeg - это полноценное, кроссплатформенное решение для записи, конвертирования и трансляции аудио и видео.
echo https://ffmpeg.org/
timeout /t 3
ffmpeg --enable-libfdk-aac --enable-nonfree
:welcome
title Main Menu - FFpepeg script (v0.11b)
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
echo --ScriptVersion 0.11 -beta --copyright "SHULKER Play" --ffmpeg.org (n5.1.1-1-g4424a6223b-20220905)
echo !!! Каждый человек может иметь свою цель использования этого скрипта и FFmpeg в целом. 
echo !!! Мы не можем проверить все возможные комбинации самостоятельно. 
echo !!! Если у вас возникла проблема, или вы хотите предложить пресет который можно добавить в меню, свяжитесь с нами!
timeout /t 1
echo ДОБРО ПОЖАЛОВАТЬ В СКРИПТ УПРАВЛЕНИЯ FFMPEG!

echo --------------------------
echo H - Помощь по FFmpeg
echo Y - Выбрать пресет видео
echo A - Аудио Конвертер
echo P - Фото Конвертер
echo T - Выбрать инструмент
echo N - Конфигуратор кодировщика видео (В разработке)
echo Q - Режим наполовину ручного ввода
echo C - Режим командной строки
echo X - Наш Github
echo V - Открыть загрузчик видео
echo E - Выход
echo --------------------------
choice /C YNHECQAXVPT /N

if %errorlevel%==1 goto preset
if %errorlevel%==2 goto configure
if %errorlevel%==3 goto helpff
if %errorlevel%==4 exit
if %errorlevel%==5 goto SUPERCUSTOMMODE
if %errorlevel%==6 goto Conf_Custom_Start
if %errorlevel%==7 goto audiopreset
if %errorlevel%==8 explorer.exe "https://github.com/SHULKERPLAY/FFpepeg"
if %errorlevel%==9 yt-dl_init.bat
if %errorlevel%==10 goto photoformat
if %errorlevel%==11 goto presetTool
goto welcome

:SUPERCUSTOMMODE
title Free CMD - FFpepeg script [FFmpeg]
color f
echo В этом режиме вы можете запустить ffmpeg со своими флагами
echo Используйте этот режим только если вы полностью уверены в том что делаете. "ffmpeg -h" for help. 
echo Мой рабочий пример: (ffmpeg -i "E:\RENDERS\CONVERT TO WEBM\SceneOverlay.mov" -c:v libvpx-vp9 -crf 16 -an -threads 8 -lag-in-frames 16 -auto-alt-ref 0 -y "E:\RENDERS\SceneOverlay.webm")
echo Для выхода закройте окно или напишите "goto welcome"
:SUPERCUSTOMMODE1
set /p SUPERCUSTOMMODE=
color a
color f
%SUPERCUSTOMMODE%
goto SUPERCUSTOMMODE1

:helpff
title FFmpeg Help - FFpepeg script [FFmpeg]
color f
echo Вся справка идёт из исполнительного файла ffmpeg, и она полностью на английском языке. Мы не станем переводить далее этот раздел
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
echo (Например: xsub)
echo (Например: libvpx)
echo (Например: yuv4mpegpipe)
echo (Например: buffersink)
echo (Например: vp9_superframe_split)
echo (Например: prompeg)
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

:preset
title Preset Selector - FFpepeg script [FFmpeg]
cls
echo Чтобы использовать дополнительные параметры, такие как смена цветового пространства - используйте конфигуратор, не пресеты. Также если вы хотите просто сменить видеоконтейнер, то попробуйте использовать ремультиплексирование. Поверьте, если вам нужно видео, например, в формате mkv, вы точно не захотите заново кодировать это в Mpeg или Xvid кодеки.
echo -
echo Выберите пресет кодирования
echo --------------------------
echo 1 - Webm [Поддержка прозрачности] [VP9, Opus, Аудиобитрейт 320kbps]
echo 2 - mpeg (Mpeg-1/2, аудиокодек mp3, Аудиобитрейт 320kbps)
echo 3 - avi (Mpeg-4/Xvid, аудиокодек mp3, Аудиобитрейт 320kbps)
echo 4 - GIF (gif, конфигурируемый)
echo 5 - mp4 (H.264, аудиокодек AAC, Аудиобитрейт 384kbps)
echo 6 - mp4 (H.265, аудиокодек AAC, Аудиобитрейт 384kbps)
echo 7 - mp4 (av1 или SVT-AV1, аудиокодек AAC, Аудиобитрейт 384kbps)
echo 9 - Оптимизировать для загрузки на YouTube
echo N - КОНФИГУРАТОР (В разработке)
echo --------------------------
choice /C 123456789N /N

if %errorlevel%==1 goto Preset_vp9ts
if %errorlevel%==2 goto Preset_mpeg
if %errorlevel%==3 goto Preset_mpeg4
if %errorlevel%==4 goto Preset_gif
if %errorlevel%==5 goto Preset_h264
if %errorlevel%==6 goto Preset_h265
if %errorlevel%==7 goto Preset_libaom
if %errorlevel%==8 goto Preset
if %errorlevel%==9 goto OptimizeYT
if %errorlevel%==10 goto configure
exit

:preset_libaom
title Preset AV1 - FFpepeg script [FFmpeg]
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите кодировщик
echo --------------------------
echo 1 - AV1 - Лучшее сжатие
echo 2 - SVT-AV1 - Повышенная скорость кодирования (Scalable Video Technology for AV1)
echo --------------------------

choice /C 123 /N

if %errorlevel%==1 set encoder=libaom-av1
if %errorlevel%==2 set encoder=libsvtav1

cls
echo --------------------------
echo E - Включить Аудио
echo D - Выключить Аудио
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a aac -b:a 384K -ar 48000
if %errorlevel%==2 set audiocodec=-an

cls
echo Выберите качество
echo --------------------------
echo 0 - Без потерь
echo 8 - CRF 8 - Больше размер файла, лучше качество
echo 6 - CRF 16
echo 4 - CRF 24
echo 2 - CRF 32 - Меньше размер файла, хуже качество
echo --------------------------
choice /C 08642 /N

if %errorlevel%==1 set vidbitrate=-crf 0
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32
cls
choice /c YN /N /T 3 /D Y /m "Y - Автоматически определить частоту кадров, N - Установить свою частоту кадров"
if %errorlevel%==2 cls && echo Введите частоту кадров (Например: 60) && set /p temp5=
if %errorlevel%==2 set framerate=-r %temp5%
set errorlevel=7
if %encoder%==libsvtav1 cls && echo Выберите пресет кодирования && echo Значения меньше создадут файл, весящий меньше с данным качеством изображения и также будет требовать больше времени для кодирования && echo -------------------------- && echo 1 - Чрезвычайно высокая эффективность сжатия, для моментов когда время кодирования не имеют значения и особую важность представляет соотношение вес/качество видео && echo 2 - Часто используется энтузиастами для соблюдения баланса между эффективностью сжатия и временем кодирования && echo 3 - Используется для быстрого кодирования && echo -------------------------- && choice /C 123 /N
if %errorlevel%==1 set preset=-preset 3
if %errorlevel%==2 set preset=-preset 5
if %errorlevel%==3 set preset=-preset 9

if %encoder%==libaom-av1 set preset=-cpu-used 5

cls
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mp4"
ffmpeg %filepath% -c:v %encoder% %preset% %audiocodec% %vidbitrate% %framerate% -y "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:preset_h265
title Preset H265/HEVC - FFpepeg script [FFmpeg]
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите кодировщик
echo H.265 == HEVC
echo --------------------------
echo 1 - H.265 (libx265) - Стандартный кодировщик HEVC. Использует ресурсы процессора
echo ::::::::::
echo 2 - AMF HEVC encoder (hevc_amf) - Кодировщик H265 с аппаратным ускорением AMD. Использует ресурсы видеокарты. Если ваша видеокарта AMD не поддерживает AMF HEVC, кодировщик вернёт ошибку
echo ::::::::::
echo 3 - NVENC HEVC Encoder (hevc_nvenc) - Кодировщик H265 с аппаратным ускорением AMD. Использует ресурсы видеокарты. Если ваша видеокарта Nvidia не поддерживает HEVC Nvenc, кодировщик вернёт ошибку
echo ::::::::::
echo 4 - HEVC QSV (Intel Quick Sync acceleration) Кодировщик H265 с аппаратным ускорением Intel. Использует ресурсы графического процессора. Если ваш графический процессор от Intel не поддерживает ускорение HEVC Intel Quick Sync, кодировщик вернёт ошибку
echo :::::::::: Прочие кодировщики
echo 5 - libkvazaar H.265 (libkvazaar)
echo 6 - HEVC via MediaFoundation (hevc_mf)
echo --------------------------

choice /C 1234567 /N

if %errorlevel%==1 set encoder=libx265
if %errorlevel%==2 set encoder=hevc_amf
if %errorlevel%==3 set encoder=hevc_nvenc
if %errorlevel%==4 set encoder=hevc_qsv
if %errorlevel%==5 set encoder=libkvazaar
if %errorlevel%==6 set encoder=hevc_mf

cls
echo --------------------------
echo E - Включить Аудио
echo D - Выключить Аудио
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a aac -b:a 384K -ar 48000
if %errorlevel%==2 set audiocodec=-an

cls
echo Выше битрейт = Больше размер файла = Лучше качество
echo Введите битрейт в kbps (CBR) (Например: 20000)
set /p temp2=
set vidbitrate=-b:v %temp2%K

cls
choice /c YN /N /T 3 /D Y /m "Y - Автоматически определить частоту кадров, N - Установить свою частоту кадров"
if %errorlevel%==2 cls && echo Введите частоту кадров (Например: 60) && set /p temp5=
if %errorlevel%==2 set framerate=-r %temp5%

if %encoder%==libx265 set globalredirect=preset_h26xF&&goto globalthreads
if %encoder%==libkvazaar set globalredirect=preset_h26xF&&goto globalthreads
if %encoder%==hevc_mf set globalredirect=preset_h26xF&&goto globalthreads

:preset_h26xF
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mp4"
ffmpeg %filepath% -c:v %encoder% %audiocodec% %threads% %vidbitrate% %framerate% -y "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:preset_h264
title Preset H264/AVC/MPEG-4 Part 10 - FFpepeg script [FFmpeg]
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите кодировщик
echo --------------------------
echo 1 - H.264 (libx264) - Стандартный кодировщик H264. Использует ресурсы процессора
echo ::::::::::
echo 2 - AMF H.264 Encoder (h264_amf) - Кодировщик H264 с аппаратным ускорением AMD. Использует ресурсы видеокарты. Если ваша видеокарта AMD не поддерживает AMF, кодировщик вернёт ошибку
echo ::::::::::
echo 3 - NVENC H.264 Encoder (h264_nvenc) - Кодировщик H264 с аппаратным ускорением AMD. Использует ресурсы видеокарты. Если ваша видеокарта Nvidia не поддерживает Nvenc, кодировщик вернёт ошибку
echo ::::::::::
echo 4 - H.264 QSV (Intel Quick Sync acceleration) Кодировщик H265 с аппаратным ускорением Intel. Использует ресурсы графического процессора. Если ваш графический процессор от Intel не поддерживает ускорение Intel Quick Sync, кодировщик вернёт ошибку
echo :::::::::: Прочие кодировщики
echo 5 - H.264 RGB (libx264rgb) - Подходит для кодирования без потерь
echo 6 - OpenH264 (libopenh264)
echo 7 - H264 via MediaFoundation (h264_mf)
echo --------------------------

choice /C 1234567 /N

if %errorlevel%==1 set encoder=libx264
if %errorlevel%==2 set encoder=h264_amf
if %errorlevel%==3 set encoder=h264_nvenc
if %errorlevel%==4 set encoder=h264_qsv
if %errorlevel%==5 set encoder=libx264rgb
if %errorlevel%==6 set encoder=libopenh264
if %errorlevel%==7 set encoder=h264_mf

cls
echo --------------------------
echo E - Включить Аудио
echo D - Выключить Аудио
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a aac -b:a 384K -ar 48000
if %errorlevel%==2 set audiocodec=-an

cls
echo Выше битрейт = Больше размер файла = Лучше качество
echo Введите битрейт в kbps (CBR) (Например: 20000)
set /p temp2=
set vidbitrate=-b:v %temp2%K

cls
choice /c YN /N /T 3 /D Y /m "Y - Автоматически определить частоту кадров, N - Установить свою частоту кадров"
if %errorlevel%==2 cls && echo Введите частоту кадров (Например: 60) && set /p temp5=
if %errorlevel%==2 set framerate=-r %temp5%

if %encoder%==libx264 set globalredirect=preset_h26xF&&goto globalthreads
if %encoder%==libx264rgb set globalredirect=preset_h26xF&&goto globalthreads
if %encoder%==libopenh264 set globalredirect=preset_h26xF&&goto globalthreads
if %encoder%==h264_mf set globalredirect=preset_h26xF&&goto globalthreads

:Preset_gif
title GIF Creating - FFpepeg script [FFmpeg]
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo This preset will create a gif with its own palette of colors
pause
:Preset_gifOpt
cls
echo Выбрать фрагмент из видео
echo --------------
echo 1 - Пропустить "n" секунд видео
echo 2 - Длительность GIF
echo F - Продолжить
echo --------------
echo Пропустить %temp1% секунд(у)
echo Длительность %temp3% секунд(а)

choice /C 12F /N

if %errorlevel%==1 goto Preset_gifSkip
if %errorlevel%==2 goto Preset_gifDuration
if %errorlevel%==3 goto Preset_gifRes

:Preset_gifSkip
cls
echo Впишите количество секунд от видео, которое нужно пропустить (Например: 120)
set /p temp1=
set temp2=-ss %temp1%
goto Preset_gifOpt

:Preset_gifDuration
cls
echo Впишите длинну Gif в секундах (Например: 5)
set /p temp3=
set temp4=-t %temp3%
goto Preset_gifOpt

:Preset_gifRes
title GIF Settings - FFpepeg script [FFmpeg]
cls
echo Выберите частоту кадров gif. Меньше частота кадров - меньше размер
echo --------------
echo 0 - 5 FPS
echo 1 - 10 FPS (Рекомендуется)
echo 2 - 15 FPS
echo 3 - 30 FPS
echo 4 - 50 FPS
echo 5 - 60 FPS
echo --------------

choice /C 012345 /N

if %errorlevel%==1 set temp5=fps=5
if %errorlevel%==2 set temp5=fps=10
if %errorlevel%==3 set temp5=fps=15
if %errorlevel%==4 set temp5=fps=30
if %errorlevel%==5 set temp5=fps=50
if %errorlevel%==6 set temp5=fps=60

cls
echo Выберите разрешение для Gif (Высота в пикселях). Меньше разрешение - меньше размер
echo --------------
echo 1 - 144px
echo 2 - 240px (Рекомендуется)
echo 3 - 360px
echo 4 - 480px
echo 5 - 720px
echo --------------

choice /C 12345 /N

if %errorlevel%==1 set temp6=scale=-2:144
if %errorlevel%==2 set temp6=scale=-2:240
if %errorlevel%==3 set temp6=scale=-2:360
if %errorlevel%==4 set temp6=scale=-2:480
if %errorlevel%==5 set temp6=scale=-2:720

cls
echo Как зациклить gif?
echo --------------
echo 0 - Бесконечное зацикливание (Рекомендуется)
echo 1 - Без зацикливания
echo 2 - Повторить определённое количество раз
echo --------------

choice /C 012 /N

if %errorlevel%==1 set temp7=-loop 0
if %errorlevel%==2 set temp7=-loop -1
if %errorlevel%==3 goto Preset_gifLoop

:Preset_gifEncode
cls
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.gif"
ffmpeg %temp2% %temp4% %filepath% -vf "%temp5%,%temp6%:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" %temp7% -y "%outputfolder%\%outputname%.gif"
color e
echo ::::::::::::::::::::
echo Проверьте размер GIF. Подходит ли он к вашим пределам?
echo Например, ограничение по размеру файла у Discord - 8MB
echo Вы хотите сменить настройки или продолжить?
choice /c YN /N /m "Y - Продолжить, N - Сменить настройки"
if %errorlevel%==2 goto Preset_gifRes
goto welcome

:Preset_gifLoop
cls
echo Наприпер число 10 заставит повторить GIF 11 раз
echo Введите число (Например: 10)
set /p temp8=
set temp7=-loop %temp8%
goto Preset_gifEncode

:preset_mpeg4
title Preset MPEG-4/Xvid - FFpepeg script [FFmpeg]
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите кодировщик
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
echo E - Включить Аудио
echo D - Выключить Аудио
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a libmp3lame -b:a 320K
if %errorlevel%==2 set audiocodec=-an

cls
echo Выберите качество
echo --------------------------
echo 0 - Лучшее качество (Может выводить кучу предупреждений во время кодирования)
echo 1 - Хорошее (Рекомендуется)
echo 2 - Среднее
echo 3 - Низкое
echo 4 - Наинизшее (Маленький размер файла)
echo --------------------------
choice /C 01234 /N

if %errorlevel%==1 set vidbitrate=-qscale:v 1
if %errorlevel%==2 set vidbitrate=-qscale:v 7
if %errorlevel%==3 set vidbitrate=-qscale:v 15
if %errorlevel%==4 set vidbitrate=-qscale:v 23
if %errorlevel%==5 set vidbitrate=-qscale:v 31

cls
choice /c YN /N /T 3 /D Y /m "Y - Автоматически определить частоту кадров, N - Установить свою частоту кадров"
if %errorlevel%==2 cls && echo Введите частоту кадров (Например: 60) && set /p temp5=
if %errorlevel%==2 set framerate=-r %temp5%

echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.avi"
ffmpeg %filepath% %encoder% %audiocodec% %vidbitrate% %framerate% -y "%outputfolder%\%outputname%.avi"
pause
goto welcome

:preset_mpeg
title Preset MPEG-1/MPEG-2 - FFpepeg script [FFmpeg]
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите кодировщик
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
echo E - Включить Аудио
echo D - Выключить Аудио
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a libmp3lame -b:a 320K
if %errorlevel%==2 set audiocodec=-an

cls
echo Выберите качество
echo --------------------------
echo 0 - Лучшее качество (Может выводить кучу предупреждений во время кодирования)
echo 1 - Хорошее (Рекомендуется)
echo 2 - Среднее
echo 3 - Низкое
echo 4 - Наинизшее (Маленький размер файла)
echo --------------------------
choice /C 01234 /N

if %errorlevel%==1 set vidbitrate=-qscale:v 1
if %errorlevel%==2 set vidbitrate=-qscale:v 7
if %errorlevel%==3 set vidbitrate=-qscale:v 15
if %errorlevel%==4 set vidbitrate=-qscale:v 23
if %errorlevel%==5 set vidbitrate=-qscale:v 31

cls
choice /c YN /N /T 3 /D Y /m "Y - Автоматически определить частоту кадров, N - Установить свою частоту кадров"
if %errorlevel%==2 cls && echo Введите частоту кадров (Например: 60) && set /p temp5=
if %errorlevel%==2 set framerate=-r %temp5%

echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mpeg"
ffmpeg %filepath% %encoder% %audiocodec% %vidbitrate% %framerate% -y "%outputfolder%\%outputname%.mpeg"
pause
goto welcome

:Preset_vp9ts
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo --------------------------
echo E - Включить Аудио
echo D - Выключить Аудио
echo --------------------------

choice /C ED /N

if %errorlevel%==1 set audiocodec=-c:a libopus -b:a 320K
if %errorlevel%==2 set audiocodec=-an

cls
echo Выберите качество
echo --------------------------
echo 0 - Без потерь
echo 8 - CRF 8 - Больше размер файла, лучше качество
echo 6 - CRF 16
echo 4 - CRF 24
echo 2 - CRF 32 - Меньше размер файла, хуже качество
echo --------------------------
choice /C 08642 /N

if %errorlevel%==1 set vidbitrate=-lossless 1
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32

cls
choice /c YN /N /T 3 /D Y /m "Y - Автоматически определить частоту кадров, N - Установить свою частоту кадров"
if %errorlevel%==2 cls && echo Введите частоту кадров (Например: 60) && set /p temp5=
if %errorlevel%==2 set framerate=-r %temp5%

echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.webm"
ffmpeg %filepath% -c:v libvpx-vp9 %audiocodec% %vidbitrate% %framerate% -lag-in-frames 0 -auto-alt-ref 0 -y "%outputfolder%\%outputname%.webm"
pause
goto welcome

:photoformat
title Image Converting - FFpepeg script [FFmpeg]
cls
echo Используя множество программ похожих на Photoshop, вы можете понять что просто сменив название файла после точки недостаточно чтобы сменить формат фото на поддерживаемый. Мы создали это чтобы помочь
pause
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetPictureFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите формат в который будет конвертировано фото
echo Бета. Новые функции появятся позже
echo --------------------------
echo P - PNG (Portable Network Graphics)
echo J - JPG (Популярный метод сжатия с потерями для цифровых изображений)
echo W - WEBP (Файл изображения разработанный Google. Основан на VP8. Поддерживает прозрачность, анимацию, и сохраняет малый размер файла. Программы от Adobe и некоторые другие не поддерживают его, но браузеры понимают этот формат, он особенно годен для сжатия изображений для сайтов.)
echo T - TIFF (Tagged Image File Format)
echo B - BMP (Windows bitmap)
echo --------------------------
choice /C PJWTB /N

if %errorlevel%==1 set outputformat=png
if %errorlevel%==2 set outputformat=jpg
if %errorlevel%==3 set outputformat=webp
if %errorlevel%==4 set outputformat=tiff
if %errorlevel%==5 set outputformat=bmp

cls
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.png!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

ffmpeg %filepath% -y -strict -2 "%outputfolder%\%outputname%.%outputformat%"
pause
goto welcome

:audiopreset_wav
title WAVE AUDIO CONVERTING - FFpepeg script [FFmpeg]
cls
echo F - PCM 32-bit floating point little-endian (pcm_f32le)
echo D - PCM 64-bit floating point little-endian (pcm_f64le)
echo 1 - PCM signed 16-bit little-endian (pcm_s16le)
echo 2 - PCM signed 24-bit little-endian (pcm_s24le)
echo 3 - PCM signed 32-bit little-endian (pcm_s32le)
echo 4 - PCM signed 64-bit little-endian (pcm_s64le)
echo ::::::::::::::::::::::::::
echo Adobe Audition Default: pcm_f32le
echo SELECT YOUR PREFERRED AUDIOCODEC
choice /C FD1234 /N
if %errorlevel%==1 set audiocodec=-c:a pcm_f32le
if %errorlevel%==2 set audiocodec=-c:a pcm_f64le
if %errorlevel%==3 set audiocodec=-c:a pcm_s16le
if %errorlevel%==4 set audiocodec=-c:a pcm_s24le
if %errorlevel%==5 set audiocodec=-c:a pcm_s32le
if %errorlevel%==6 set audiocodec=-c:a pcm_s64le
goto audiopreset_encode

:audiopreset
title Audio Converting - FFpepeg script [FFmpeg]
echo Выберите аудио или видеофайл
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetAVFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите кодек в который будет конвертирован файл
echo --------------------------
echo M - MP3 (Формат кодирования для цифрового аудио)
echo A - AAC (Advanced Audio Coding)
echo O - Opus (Opus это формат кодирования аудио с потерями для эффективного кодирования речи и аудио в целом в одном формате при этом оставаясь кодеком с низкой задержкой)
echo V - Vorbis (.ogg. Свободный проект с открытым исходным кодом)
echo F - FLAC (Free Lossless Audio Codec)
echo L - ALAC (Apple Lossless Audio Codec (Mediacontainer .m4a))
echo W - WAV (Несжатый PCM)
echo --------------------------
choice /C MAOVFLW /N

if %errorlevel%==1 set outputformat=mp3&& set audiocodec=-c:a libmp3lame
if %errorlevel%==2 set outputformat=aac&& set audiocodec=-c:a aac
if %errorlevel%==3 set outputformat=opus&& set audiocodec=-c:a libopus
if %errorlevel%==4 set outputformat=ogg&& set audiocodec=-c:a libvorbis
if %errorlevel%==5 set outputformat=flac&& set audiocodec=-c:a flac
if %errorlevel%==6 set outputformat=m4a&& set audiocodec=-c:a alac
if %errorlevel%==7 set outputformat=wav&& goto audiopreset_wav
cls
if %outputformat%==flac goto audiopreset_encode
if %outputformat%==m4a goto audiopreset_encode
echo Выберите битрейт аудио
echo --------------------------
echo 1 - 96 kbps - Обычно используется для речи или стриминга в низком качестве.
echo 2 - 128 kbps - Качество близкое к среднему.
echo 3 - 192 kbps - Среднее качество.
echo 4 - 256 kbps - Популярный битрейт с высоким качеством звука.
echo 5 - 320 kbps - Наивысший уровень поддерживаемый стандартом MP3.
echo 6 - 384 kbps - Рекомендация Youtube для стерео
echo 7 - 512 kbps - Рекомендация Youtube для 5.1 звука
echo --------------------------
choice /C 1234567 /N

if %errorlevel%==1 set audiobitrate=-b:a 96K
if %errorlevel%==2 set audiobitrate=-b:a 128K
if %errorlevel%==3 set audiobitrate=-b:a 192K
if %errorlevel%==4 set audiobitrate=-b:a 256K
if %errorlevel%==5 set audiobitrate=-b:a 320K
if %errorlevel%==6 set audiobitrate=-b:a 384K
if %errorlevel%==7 set audiobitrate=-b:a 512K
cls
if %outputformat%==ogg goto audiopreset_encode
echo Выберите частоту дескритизации аудио
echo (Следите за клавишами!)
echo --------------------------
echo 1 - 8 kHz
echo 2 - 12 kHz
echo 3 - 16 kHz
echo 4 - 24 kHz
if NOT %outputformat%==opus echo 5 - 32 kHz
if NOT %outputformat%==opus echo 6 - 44.1 kHz
echo 7 - 48 kHz (Рекомендуется)
if %outputformat%==aac echo 8 - 64 kHz
if %outputformat%==aac echo 9 - 96 kHz
echo --------------------------
choice /C 123456789 /N

if %errorlevel%==1 set samplerate=-ar 8000
if %errorlevel%==2 set samplerate=-ar 12000
if %errorlevel%==3 set samplerate=-ar 16000
if %errorlevel%==4 set samplerate=-ar 24000
if %errorlevel%==5 set samplerate=-ar 32000
if %errorlevel%==6 set samplerate=-ar 44100
if %errorlevel%==7 set samplerate=-ar 48000
if %errorlevel%==8 set samplerate=-ar 64000
if %errorlevel%==9 set samplerate=-ar 96000

:audiopreset_encode
cls
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.png!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.%outputformat%"
ffmpeg %filepath% %audiocodec% %audiobitrate% %samplerate% -vn -y -strict -2 "%outputfolder%\%outputname%.%outputformat%"
pause
goto welcome

rem Доступные Инструменты (В РАЗРАБОТКЕ) -------------------------------------------------------------------------------

:presetTool
cls
echo Выберите инструмент (В разработке)
echo --------------------------
echo 1 - Извлечь несколько аудиодорожек из видео (извлечь аудио в .mp3 или .mka вплоть до 6 разных потоков) 
echo 2 - Повысить или понизиить разрешение видео используя разные алгоритмы
echo N - Вернуться в главное меню
choice /C N12 /N

if %errorlevel%==1 goto welcome
if %errorlevel%==2 goto PresetTool_ExtractAll
if %errorlevel%==3 goto PresetTool_Upscaling

:PresetTool_ExtractAll
title Extract multiple audio streams from video - FFpepeg script [FFmpeg]
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Введите префикс к именам файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %
cls
color e
echo Так как большинство аудиокодеков очень разные, большинство требует отдельный медиаконтейнер.
echo Большинство кодеков может быть кодировано в .mka контейнер, но некоторые программы могут не принимать .mka.
pause
cls
echo Поэтому вам предстоит выбор. Вы можете быстро, без перекодирования, извлечь все потоки в файлы .mka (Matroska audio). Это будет особенно полезно если у вас очень длинное видео (например, час)
echo Но если вам нужен именно .mp3 вы можете потратить больше времени перекодируя файлы. Почему? Допустим, в OBS вы записываете звук видео по умолчанию с кодеком AAC, но он не может быть вставлен в mp3 контейнер без перекодирования в mp3
pause
echo --------------------
echo Ваш выбор:
echo 1 - Перенести все потоки в .mka (Очень быстро)
echo 2 - Кодировать потоки в .mp3 (Медленно)
echo --------------------

choice /C 12 /N
if %errorlevel%==1 set audiocodec=-c:a copy && set outputformat=mka
if %errorlevel%==2 set audiocodec=-c:a libmp3lame -b:a 384K && set outputformat=mp3

ffmpeg %filepath% -vn -map 0:a:0 %audiocodec% "%outputfolder%\%outputname%_audio0.%outputformat%" -map 0:a:1? %audiocodec% "%outputfolder%\%outputname%_audio1.%outputformat%" -map 0:a:2? %audiocodec% "%outputfolder%\%outputname%_audio2.%outputformat%" -map 0:a:3? %audiocodec% "%outputfolder%\%outputname%_audio3.%outputformat%" -map 0:a:4? %audiocodec% "%outputfolder%\%outputname%_audio4.%outputformat%" -map 0:a:5? %audiocodec% "%outputfolder%\%outputname%_audio5.%outputformat%" -y -strict -2
pause
goto welcome

:PresetTool_Upscaling
title Scaling Tool - FFpepeg script [FFmpeg]
cls
echo Выберите алгоритм масштабирования
echo --------------------------
echo 1 - Lanczos (Хорошее качество, медленнее, самый популярный)
echo 2 - Sinc (Лучшее качество, возможны "призрачные" артефакты которые видны при приближении картинки)
echo 3 - Spline
echo 4 - Bicubic (Стандартное)
echo 5 - Bilinear (Быстрый но мыльный)
echo 6 - Fast Bilinear
echo 7 - Neighbor (Не рекомендуется. Используйте только если вам нужно увеличить или уменьшить изображение ровно в 2 раза)
echo 8 - Gauss
echo H - (Появится в будущих версиях) Помогите, я нихрена не понимаю. Что мне стоит выбрать?
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
if %errorlevel%==9 goto PresetTool_Upscaling

cls
echo Выберите разрешение в которое вы хотите масштабировать видео сохраняя исходное соотношение сторон
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

echo Введите ширину в пикселях (Например: 1280)
set /p temp3=
color af
color 5f
cls
echo Введите высоту в пикселях (Например: 720)
set /p temp4=
color af
color 5f
set temp2=%temp3%:%temp4%

:PresetTool_Upscaling_Encode
set size=-vf scale=%temp2%:%temp1%
cls
echo Видео будет кодированно кодировщиком libx264 используя процессор. Поддержка других кодеков может появиться в будущем
pause
cls
echo Выберите качество
echo --------------------------
echo 0 - Без потерь (CRF 0)
echo 8 - CRF 8 - Больше размер файла, лучше качество
echo 6 - CRF 16
echo 4 - CRF 24
echo 2 - CRF 32 - Меньше размер файла, хуже качество
echo --------------------------
choice /C 08642 /N

if %errorlevel%==1 set vidbitrate=-crf 0
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32
cls
choice /c YN /N /T 3 /D Y /m "Y - Автоматически определить частоту кадров, N - Установить свою частоту кадров"
if %errorlevel%==2 cls && echo Введите частоту кадров (Например: 60) && set /p temp5=
if %errorlevel%==2 set framerate=-r %temp5%

echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
color a
color f
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mp4"
ffmpeg %filepath% -c:v libx264 -c:a copy %size% %vidbitrate% %framerate% -y "%outputfolder%\%outputname%.mp4"
pause
goto welcome

rem Конфигуратор (В РАЗРАБОТКЕ) -------------------------------------------------------------------------------

:configure
title IN DEVELOPMENT
cls
color f
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
color a
color f
echo Выберите кодировщик
echo --------------------------
echo 0 - Копировать настройки кодировщика из входного файла (Ремультиплексирование)
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
title Remux - FFpepeg script [FFmpeg]
cls
rem Задаёт переменную кодировщика
set encoder=-c:v copy
choice /c YN /N /m "Y - Сменить аудиокодек, N - Копировать аудиокодек"
if %errorlevel%==1 goto conf_copy_AC
if %errorlevel%==2 set audiocodec=-c:a copy && goto Conf_Copy_S

:conf_copy_AC
cls
echo Выберите Аудиокодек
echo --------------------------
echo 1 - AAC (Advanced Audio Coding)
echo 2 - AAC via MediaFoundation (Кодек aac)
echo 3 - FLAC (Free Lossless Audio Codec)
echo 4 - MP3 
echo 5 - libopus Opus (Кодек opus)
echo --------------------------

choice /C 12345 /N

if %errorlevel%==1 set audiocodec=-c:a aac
if %errorlevel%==2 set audiocodec=-c:a aac_mf
if %errorlevel%==3 set audiocodec=-c:a flac
if %errorlevel%==4 set audiocodec=-c:a libmp3lame
if %errorlevel%==5 set audiocodec=-c:a libopus

cls
echo Выберите битрейт аудио
echo --------------------------
echo 1 - 96 kbps - Обычно используется для речи или стриминга в низком качестве.
echo 2 - 128 kbps - Качество близкое к среднему.
echo 3 - 192 kbps - Среднее качество.
echo 4 - 256 kbps - Популярный битрейт с высоким качеством звука.
echo 5 - 320 kbps - Наивысший уровень поддерживаемый стандартом MP3.
echo 6 - 384 kbps - Рекомендация Youtube для стерео
echo 7 - 512 kbps - Рекомендация Youtube для 5.1 звука
echo --------------------------
choice /C 1234567 /N

if %errorlevel%==1 set audiobitrate=-b:a 96K && goto Conf_Copy_S
if %errorlevel%==2 set audiobitrate=-b:a 128K && goto Conf_Copy_S
if %errorlevel%==3 set audiobitrate=-b:a 192K && goto Conf_Copy_S
if %errorlevel%==4 set audiobitrate=-b:a 256K && goto Conf_Copy_S
if %errorlevel%==5 set audiobitrate=-b:a 320K && goto Conf_Copy_S
if %errorlevel%==6 set audiobitrate=-b:a 384K && goto Conf_Copy_S
if %errorlevel%==7 set audiobitrate=-b:a 512K && goto Conf_Copy_S

:Conf_Copy_S
cls
choice /c YNC /N /m "Y - Добавить субтитры без перекодирования видео, N - Отключить субтитры, C - Копировать субтитры из исходного файла"
if %errorlevel%==1 goto Conf_Copy_selectSC
if %errorlevel%==2 set disablesubtitles=-sn && goto copyLib
if %errorlevel%==3 set subencoder=-c:s copy && goto copyLib

:Conf_Copy_selectSC
cls
echo Выберите файл субтитров
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetSubtitlesFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set temp11=%decode1:?= %
set inputsubtitle=-i "%temp11%"
cls
echo Выберите формат субтитров
echo --------------------------
echo 1 - DVD subtitles (Кодек dvd_subtitle)
echo 2 - 3GPP Timed Text subtitle
echo 3 - SubRip subtitle (Кодек subrip)
echo 4 - ASS (Advanced SubStation Alpha) subtitle (Кодек ass)
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
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Введите новый формат файла (Например: mkv [НЕ .mkv!!!])
set /p outputformat=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.%outputformat%"
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
:OptimizeYT
title Optimize For YouTube - FFpepeg script [FFmpeg]
cls
echo В этом разделе, вы можете подогнать своё видео к рекомендуемым параметрам загружаемых видео с минимальной потерей качества.
echo Видео будет оптимизировано для Youtube, но оно также может подойти для остальных сервисов

echo Что вы хотите сделать с видео?
echo --------------------------
echo 1 - Просто добавить быстрый старт* в моё видео (Самое быстрое) (мультиплексирование в mp4)
echo 2 - Кодировать моё видео с рекомендуемыми для YouTube параметрами
echo 3 - Кодировать моё HDR видео с рекомендуемыми для YouTube параметрами (ЭКСПЕРЕМЕНТАЛЬНАЯ ФУНКЦИЯ)
echo --------------------------
echo *Быстрый старт, оптимизирует файл MP4, двигая moov atom в начало файла видео, чтобы браузеры могли легко найти moov atom для загрузки и проигрывания видео быстрее, и оно могло постепенно подгружаться при воспроизведении. Вам не нужно будет ожидать окончания загрузки для воспроизведения.
choice /C 123 /N

if %errorlevel%==1 goto OptimizeYT_faststart
if %errorlevel%==2 goto OptimizeYT_Encode
if %errorlevel%==3 goto OptimizeYT_EncodeHDR

:OptimizeYT_faststart
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mp4"
ffmpeg %filepath% -c copy -movflags +faststart "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:OptimizeYT_Encode
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите пресет кодирования x264
echo ultrafast и superfast? Серьёзно? Не используйте их. К тому же Youtube рекомендует использовать CABAC который не используется в тех пресетах
echo --------------------------
echo 1 - veryfast - Быстрое кодирование, ниже качество
echo 2 - faster
echo 3 - fast
echo 4 - medium (По умолчанию)
echo 5 - slow (Рекомендуется)
echo 6 - slower
echo 7 - veryslow - Лучшее качество, самое медленное кодирование (Не считая placebo естественно)
echo --------------------------
echo PLACEBO? Ты должно быть шутишь, верно? Я хотел бы видеть ХОТЬ ОДНОГО человека который использует этот пресет чтобы выкладывать видео в интернет.
choice /C 1234567 /N

if %errorlevel%==1 set preset=-preset veryfast
if %errorlevel%==2 set preset=-preset faster
if %errorlevel%==3 set preset=-preset fast
if %errorlevel%==4 set preset=-preset medium
if %errorlevel%==5 set preset=-preset slow
if %errorlevel%==6 set preset=-preset slower
if %errorlevel%==7 set preset=-preset veryslow

cls
echo Выберите количество потоков для кодирования, чем больше значения, тем больше ресурсов процессора будет использоваться для кодирования
echo Мы рекомендуем оставить немного свободных ядер процессора. Если вы выберите все ядра, ваш процессор вероятно будет загружен на все 100% до окончания кодирования.
echo --------------------------
echo 1 - Автоматически
echo 2 - 2 потока
echo 4 - 4 потока
echo 6 - 6 потоков
echo 8 - 8 потоков
echo 9 - 12 потоков
echo 0 - 16 потоков
echo Q - 24 потокоа
echo E - 32 потокоа
echo --------------------------
choice /C 1246890QE /N
if %errorlevel%==1 set threads=
if %errorlevel%==2 set threads=-threads 2
if %errorlevel%==3 set threads=-threads 4
if %errorlevel%==4 set threads=-threads 6
if %errorlevel%==5 set threads=-threads 8
if %errorlevel%==6 set threads=-threads 12
if %errorlevel%==7 set threads=-threads 16
if %errorlevel%==8 set threads=-threads 24
if %errorlevel%==9 set threads=-threads 32

cls
echo Заметка про аудиокодек. Для AAC-LC мы используем AAC вместо libfdk_aac. Лицензия libfdk_aac не совместима с GPL, так что GPL не разрешает распространение двоичных файлов содержащих несовместимый код когда код с лицензией GPL также в комплекте. В любом случае, этот кодировщик помечен как "не бесплатный", и вы не сможете заранее скачать сборку ffmpeg которая его поддерживает. Это может быть решено если вы компилируете сборку ffmpeg самостоятельно.
echo -----
echo Выберите тип аудио
echo --------------------------
echo 0 - Моно
echo 1 - Стерео (Рекомендуется)
echo 2 - 5.1
echo --------------------------
choice /C 012 /N

if %errorlevel%==1 set audiotype=-ac 1 && set audiobitrate=-b:a 128k
if %errorlevel%==2 set audiotype=-ac 2 && set audiobitrate=-b:a 384k
if %errorlevel%==3 set audiotype=-ac 6 && set audiobitrate=-b:a 512k

cls 
echo Следовать рекомендуемым ограничениям битрейта для Youtube?
echo --------------------------
echo Y - Рекомендумый битрейт
echo N - Битрейт без ограничений 
echo --------------------------
choice /C YN /N

if %errorlevel%==1 goto OptimizeYT_Encode_Follow
if %errorlevel%==2 goto OptimizeYT_Encode_Unlimited

:OptimizeYT_Encode_Follow
title Following YouTube Bitrate - FFpepeg script [FFmpeg]
cls
echo Пожалуйста Выберите качество. Это поможет нам оставаться в рамках рекомендуемого битрейта
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
echo Выбирайте НАСТОЯЩЕЕ разрешение вашего видео. В противном случае мы не сможем следовать рекомендованным значениям
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
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mp4"
ffmpeg %filepath% -c:v libx264 %preset% %vidbitrate% -c:a aac %audiobitrate% %audiotype% -pix_fmt yuv420p -profile:v high -bf 2 -movflags +faststart %threads% "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:OptimizeYT_Encode_Unlimited
title Optimize Video - Unlimited Bitrate - FFpepeg script [FFmpeg]
cls
echo Пожалуйста выберите качество.
echo --------------------------
echo 1 - CRF 0 (x264 БЕЗ ПОТЕРЬ)
echo 2 - CRF 8 - Больше размер файла, лучше качество
echo 3 - CRF 16 (Рекомендуется)
echo 4 - CRF 24
echo 5 - CRF 32 - Меньше размер файла, хуже качество
echo --------------------------
choice /C 12345 /N

if %errorlevel%==1 set vidbitrate=-crf 0
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32

cls
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mp4"
ffmpeg %filepath% -c:v libx264 %preset% %vidbitrate% -c:a aac %audiobitrate% %audiotype% -pix_fmt yuv420p -profile:v high -bf 2 -movflags +faststart %threads% "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:OptimizeYT_EncodeHDR
title Optimizing HDR video for YouTube - FFpepeg script [FFmpeg]
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
cls
echo Выберите пресет кодирования x264
echo ultrafast и superfast? Серьёзно? Не используйте их. К тому же Youtube рекомендует использовать CABAC который не используется в тех пресетах
echo --------------------------
echo 1 - veryfast - Быстрое кодирование, ниже качество
echo 2 - faster
echo 3 - fast
echo 4 - medium (По умолчанию)
echo 5 - slow (Рекомендуется)
echo 6 - slower
echo 7 - veryslow - Лучшее качество, самое медленное кодирование (Не считая placebo естественно)
echo --------------------------
echo PLACEBO? Ты должно быть шутишь, верно? Я хотел бы видеть ХОТЬ ОДНОГО человека который использует этот пресет чтобы выкладывать видео в интернет.
choice /C 1234567 /N

if %errorlevel%==1 set preset=-preset veryfast
if %errorlevel%==2 set preset=-preset faster
if %errorlevel%==3 set preset=-preset fast
if %errorlevel%==4 set preset=-preset medium
if %errorlevel%==5 set preset=-preset slow
if %errorlevel%==6 set preset=-preset slower
if %errorlevel%==7 set preset=-preset veryslow

cls
echo Выберите количество потоков для кодирования, чем больше значения, тем больше ресурсов процессора будет использоваться для кодирования
echo Мы рекомендуем оставить немного свободных ядер процессора. Если вы выберите все ядра, ваш процессор вероятно будет загружен на все 100% до окончания кодирования.
echo --------------------------
echo 1 - Автоматически
echo 2 - 2 потока
echo 4 - 4 потока
echo 6 - 6 потоков
echo 8 - 8 потоков
echo 9 - 12 потоков
echo 0 - 16 потоков
echo Q - 24 потокоа
echo E - 32 потокоа
echo --------------------------
choice /C 1246890QE /N
if %errorlevel%==1 set threads=
if %errorlevel%==2 set threads=-threads 2
if %errorlevel%==3 set threads=-threads 4
if %errorlevel%==4 set threads=-threads 6
if %errorlevel%==5 set threads=-threads 8
if %errorlevel%==6 set threads=-threads 12
if %errorlevel%==7 set threads=-threads 16
if %errorlevel%==8 set threads=-threads 24
if %errorlevel%==9 set threads=-threads 32

cls
echo Заметка про аудиокодек. Для AAC-LC мы используем AAC вместо libfdk_aac. Лицензия libfdk_aac не совместима с GPL, так что GPL не разрешает распространение двоичных файлов содержащих несовместимый код когда код с лицензией GPL также в комплекте. В любом случае, этот кодировщик помечен как "не бесплатный", и вы не сможете заранее скачать сборку ffmpeg которая его поддерживает. Это может быть решено если вы компилируете сборку ffmpeg самостоятельно.
echo -----
echo Выберите тип аудио
echo --------------------------
echo 0 - Моно
echo 1 - Стерео (Рекомендуется)
echo 2 - 5.1
echo --------------------------
choice /C 012 /N

if %errorlevel%==1 set audiotype=-ac 1 && set audiobitrate=-b:a 128k
if %errorlevel%==2 set audiotype=-ac 2 && set audiobitrate=-b:a 384k
if %errorlevel%==3 set audiotype=-ac 6 && set audiobitrate=-b:a 512k

cls 
echo Следовать рекомендуемым ограничениям битрейта для Youtube?
echo --------------------------
echo Y - Рекомендумый битрейт
echo N - Битрейт без ограничений 
echo --------------------------
choice /C YN /N

if %errorlevel%==1 goto OptimizeYT_EncodeHDR_Follow
if %errorlevel%==2 goto OptimizeYT_EncodeHDR_Unlimited

:OptimizeYT_EncodeHDR_Follow
title Following Bitrate for HDR - FFpepeg script [FFmpeg]
cls
echo Пожалуйста Выберите качество. Это поможет нам оставаться в рамках рекомендуемого битрейта
echo --------------------------
echo Низкие разрешения HDR видео не поддерживаются на YouTube
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
echo Выбирайте НАСТОЯЩЕЕ разрешение вашего видео. В противном случае мы не сможем следовать рекомендованным значениям
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
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mp4"
ffmpeg %filepath% -c:v libx264 %preset% %vidbitrate% -c:a aac %audiobitrate% %audiotype% -pix_fmt yuv420p10le -bf 2 -color_primaries bt2020 -color_trc smpte2084 -colorspace bt2020nc -movflags +faststart %threads% -y "%outputfolder%\%outputname%.mp4"
pause
goto welcome

:OptimizeYT_EncodeHDR_Unlimited
title HDR unlimited bitrate - FFpepeg script [FFmpeg]
cls
echo Пожалуйста выберите качество.
echo --------------------------
echo 1 - CRF 0 (x264 БЕЗ ПОТЕРЬ)
echo 2 - CRF 8 - Больше размер файла, лучше качество
echo 3 - CRF 16 (Рекомендуется)
echo 4 - CRF 24
echo 5 - CRF 32 - Меньше размер файла, хуже качество
echo --------------------------
choice /C 12345 /N

if %errorlevel%==1 set vidbitrate=-crf 0
if %errorlevel%==2 set vidbitrate=-crf 8
if %errorlevel%==3 set vidbitrate=-crf 16
if %errorlevel%==4 set vidbitrate=-crf 24
if %errorlevel%==5 set vidbitrate=-crf 32

cls
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.mp4"
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
title Configurator - FFpepeg script [FFmpeg]
cls
color e
echo В этом режиме вы можете творить любую магию которую вы захотите. Это что-то вроде наполовину ручного режима.
pause
cls
echo Звучит круто, не так ли?
choice /c YN
if %errorlevel%==2 goto Conf_Custom_joke
echo !Обратите внимание что этот режим эксперементален, и некоторые кодеки могут не поддерживать введённые вами параметры.
pause
cls
echo Также возможны ошибки из-за неверных комбинаций кодеков, а также потому что некоторые кодеки не поддерживают стандартные флаги
pause
echo Вы хотите продолжить?
choice /c YN
if %errorlevel%==1 goto Conf_Custom_Start
if %errorlevel%==2 goto welcome

:Conf_Custom_joke
color 4
echo Эй! Это было обидно между прочим :(
pause
cls
color c
echo Раз этот скрипт по твоему мнению плохой, тогда я не запущу его для тебя.
pause
cls
echo Прощай...
pause
cls
color 8
TIMEOUT /T 15 /NOBREAK
cls
color e
echo Всё нормально, я просто шучу. Я знаю что этот скрипт крутой
pause
cls
echo !Обратите внимание что этот режим эксперементален, и некоторые кодеки могут не поддерживать введённые вами параметры.
pause
cls
echo Также возможны ошибки из-за неверных комбинаций кодеков, а также потому что некоторые кодеки не поддерживают стандартные флаги
pause
echo Вы хотите продолжить?
choice /c YN
if %errorlevel%==2 goto welcome
cls
color b
echo И ещё раз... Не говори никому ничего плохого.
pause
cls
echo Даже если это просто скрипт...
pause
cls
echo Пожалуйста...
pause
cls
goto Conf_Custom_Start

:Conf_Custom_Start
cls
color e
echo Все настройки необязательны. Выбирайте всё что вам нужно.
echo Чтобы отключить Видео или Аудио, войдите в раздел кодеков и введите значение которое нужно для отключения Видео или Аудио. Эти значения выписаны отдельно.
echo When you set what you want, start encoding by pressing "1"
timeout /T 1
echo ----------------
echo НАСТРОЙКИ ВИДЕО
echo Q - Выбрать видеокодек
echo W - Выбрать битрейт видео
echo E - Выбрать разрешение видео
echo Y - Выбрать частоту кадров видео
echo R - Укажите видеофайл...
echo P - СБРОСИТЬ НАСТРОЙКИ ВИДЕО
echo Файл: %filepath%
echo ----------------
echo НАСТРОЙКИ АУДИО
echo A - Выбрать аудиокодек
echo S - Выбрать битрейт аудио
echo D - Укажите аудиофайл... (Не указывайте файл чтобы взять аудио из видеофайла)
echo L - СБРОСИТЬ НАСТРОЙКИ АУДИО
echo Файл: %inputaudio%
echo ----------------
echo НАСТРОЙКИ СУБТИТРОВ
echo X - Выбрать кодек субтитров
echo C - Укажите файл субтитров... (Не указывайте файл чтобы взять субтитры из видеофайла)
echo M - СБРОСИТЬ НАСТРОЙКИ СУБТИТРОВ
echo Файл: %inputsubtitle%
echo ----------------
echo ПРОЧЕЕ
echo T - Выбрать количество потоков для кодирования
echo I - Ввести пользовательские флаги
echo K - СБРОСИТЬ ПОЛЬЗОВАТЕЛЬСКИЕ ФЛАГИ
echo Пользовательские флаги: %flags%
echo ----------------
echo 1 - ЗАПУСТИТЬ КОДИРОВАНИЕ
echo Аргументы FFmpeg: %filepath% %inputaudio% %inputsubtitle% %encoder% %audiocodec% %subencoder% %vidbitrate% %size% %framerate% %disablevideo% %audiobitrate% %volume% %disableaudio% %threads% %flags% %disablesubtitles% -y -strict -2 "(path)"
echo ----------------
echo 5 - Вернуться в главное меню
echo ----------------
echo НЕ выводит ошибку когда вы выберете кодек:
if not novid==%temp1% echo Видеокодек: %temp1%, Битрейт: %vidbitrate%, %temp3%x%temp4%, %temp5% FPS
if novid==%temp1% echo ВИДЕО ОТКЛЮЧЕНО
if noaud==%temp7% echo АУДИО ОТКЛЮЧЕНО
if not noaud==%temp7% echo Аудиокодек: %temp7%, Аудио битрейт: %temp9% kbps
if nosub==%temp12% echo СУБТИТРЫ ОТКЛЮЧЕНЫ
if not nosub==%temp12% echo Субтитры: %temp12%

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
title Threads - Configure - FFpepeg script [FFmpeg]
cls
echo Выберите количество потоков для кодирования, чем больше значения, тем больше ресурсов процессора будет использоваться для кодирования
echo !!! ЗАМЕТЬТЕ что НЕ ВСЕ кодировщики поддерживают многопоточность, и могут крашнуть ffmpeg. Если вы не уверены в своих действиях, выберите "Не назначено".
echo Мы рекомендуем оставить немного свободных ядер процессора. Если вы выберите все ядра, ваш процессор вероятно будет загружен на все 100% до окончания кодирования.
echo --------------------------
echo 1 - Не назначено (По умолчанию. Рекомендуется)
echo 2 - 2 потока
echo 4 - 4 потока
echo 6 - 6 потоков
echo 8 - 8 потоков
echo 9 - 12 потоков
echo 0 - 16 потоков
echo Q - 24 потокоа
echo E - 32 потокоа
echo --------------------------
choice /C 1246890QE /N
if %errorlevel%==1 set threads=
if %errorlevel%==2 set threads=-threads 2
if %errorlevel%==3 set threads=-threads 4
if %errorlevel%==4 set threads=-threads 6
if %errorlevel%==5 set threads=-threads 8
if %errorlevel%==6 set threads=-threads 12
if %errorlevel%==7 set threads=-threads 16
if %errorlevel%==8 set threads=-threads 24
if %errorlevel%==9 set threads=-threads 32
goto Conf_Custom_Start

:Conf_Custom_VInput
title Input File - FFpepeg script [FFmpeg]
cls
echo Выберите видеофайл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetVideoFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set tempv=%decode1:?= %
set filepath=-i "%tempv%"
goto Conf_Custom_Start

:Conf_Custom_VCodec
title Videocodec - Configure - FFpepeg script [FFmpeg]
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
echo V....D libkvazaar           libkvazaar H.265 / HEVC (codec hevc)
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
echo VF.... zlib                 LCL (Lossless Codec Library) ZLIB
echo V....D zmbv                 Zip Motion Blocks Video
echo -------------               copy          Берёт кодек из исходного файла
echo -------------               novid         Ставит -vn флаг чтобы отключить видео
echo Если имя кодировщика введено неверно, ffmpeg выдаст ошибку в конце процесса!!!
echo НАПИШИТЕ "novid" ЧТОБЫ ОТКЛЮЧИТЬ ВИДЕО
echo Используйте "copy" чтобы использовать кодек исходного файла. это спасёт вас от полного перекодирования видео и спасёт кучу времени.
echo Для обычных применений мы рекомендуем libx264, libx265 или libaom-av1 (.MP4/.mkv). Также вы можете использовать libvpx/libvpx-vp9 (.webm/.mkv).
echo Используйте Ctrl+F Для поиска
echo ВПИШИТЕ ИМЯ ПРЕДПОЧИТАЕМОГО КОДЕКА (Например: libx264)
set /p temp1=
color 2
if %temp1%==novid set disablevideo=-vn && set encoder= && set vidbitrate= && set size= && set framerate= && goto Conf_Custom_Start
set encoder=-c:v %temp1%
set disablevideo=
goto Conf_Custom_Start

:Conf_Custom_Vbitrate
title Video bitrate - Configure - FFpepeg script [FFmpeg]
cls
echo Какой тип битрейта вы хотите выбрать?
echo --------
echo 1 - CBR (Постоянное количество в kbps. Везде работает отлично. Рекомендуется)
echo 2 - CRF (Constant Rate Factor, Переменный битрейт который зависит от сложности картинки. Не все кодеки поддерживают CRF, но самые популярные понимают его.)
echo 3 - QP (Как CRF, низкие значения означают высокое качество. Тем не менее, максимальное значение может быть разным в разных кодеках.)
echo --------
choice /c 123 /N
if %errorlevel%==1 goto Conf_Custom_VbitrateCBR
if %errorlevel%==2 goto Conf_Custom_VbitrateCRF
if %errorlevel%==3 goto Conf_Custom_VbitrateQP

:Conf_Custom_VbitrateCBR
cls
echo Минимальные и максимальные значения битрейта можно указать во флагах используя -minrate и -maxrate
echo Введите битрейт в kbps (CBR) (Например: 20000)
set /p temp2=
color 2
set vidbitrate=-b:v %temp2%K
goto Conf_Custom_Start

:Conf_Custom_VbitrateCRF
cls
echo Минимальные и максимальные значения битрейта можно указать во флагах используя -minrate и -maxrate
echo Введите значение CRF (0-51) (Например: 17)
set /p temp2=
color 2
set vidbitrate=-crf %temp2%
goto Conf_Custom_Start

:Conf_Custom_VbitrateQP
cls
echo Минимальные и максимальные значения битрейта можно указать во флагах используя -minrate и -maxrate
echo Введите значение QP (0-51 in x264) (Например: 14)
set /p temp2=
color 2
set vidbitrate=-qp %temp2%
goto Conf_Custom_Start

:Conf_Custom_Resolution
title Resolution - Configure - FFpepeg script [FFmpeg]
cls
echo Введите ширину в пикселях (Например: 1280)
set /p temp3=
color 2
color f
cls
echo Введите высоту в пикселях (Например: 720)
set /p temp4=
color 2
set size=-s %temp3%x%temp4%
goto Conf_Custom_Start

:Conf_Custom_Framerate
title Framerate - Configure - FFpepeg script [FFmpeg]
cls
echo Введите частоту кадров (Например: 60)
set /p temp5=
set framerate=-r %temp5%
goto Conf_Custom_Start

:Conf_Custom_AInput
title Input File - FFpepeg script [FFmpeg]
cls
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetAudioFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set temp6=%decode1:?= %
set inputaudio=-i "%temp6%"
goto Conf_Custom_Start

:Conf_Custom_ACodec
title Audiocodec - Configure - FFpepeg script [FFmpeg]
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
echo A....D libvorbis            libvorbis (codec vorbis)
echo A..... wavpack              WavPack
echo A..... wmav1                Windows Media Audio 1
echo A..... wmav2                Windows Media Audio 2
echo -------------               copy          Берёт кодек из исходного файла
echo -------------               noaud         Ставит -an флаг чтобы отключить аудио
echo Если имя кодировщика введено неверно, ffmpeg выдаст ошибку в конце процесса!!!
echo НАПИШИТЕ "noaud" ЧТОБЫ ОТКЛЮЧИТЬ АУДИО
echo Используйте "copy" чтобы использовать кодек исходного файла.
echo Для обычных применений мы рекомендуем: aac, libmp3lame.
echo Также вы можете использовать кодеки без потерь: flac or pcm (.wav).
echo Используйте Ctrl+F Для поиска
echo ВПИШИТЕ ИМЯ ПРЕДПОЧИТАЕМОГО АУДИОКОДЕКА (Например: aac)
set /p temp7=
color 2
if %temp7%==noaud set disableaudio=-an && set audiocodec= && set audiobitrate= && goto Conf_Custom_Start
set audiocodec=-c:a %temp7%
set disableaudio=
goto Conf_Custom_Start

:Conf_Custom_ABitrate
title Audio Bitrate - Configure - FFpepeg script [FFmpeg]
cls
echo Введите аудиобитрейт в kbps (Например: 256)
set /p temp9=
color 2
set audiobitrate=-b:a %temp9%K
goto Conf_Custom_Start

:Conf_Custom_SubInput
title Input File - FFpepeg script [FFmpeg]
cls
echo Выберите файл...
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetSubtitlesFileFullPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode1=%%a
set temp11=%decode1:?= %
set inputsubtitle=-i "%temp11%"
goto Conf_Custom_Start

:Conf_Custom_SCodec
title Subtitle Codec - Configure - FFpepeg script [FFmpeg]
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
echo -------------               copy          Берёт кодек из исходного файла
echo -------------               nosub         Ставит -sn флаг для отключения субтитров
echo Если имя кодировщика введено неверно, ffmpeg выдаст ошибку в конце процесса!!!
echo НАПИШИТЕ "nosub" ЧТОБЫ ОТКЛЮЧИТЬ СУБТИТРЫ
echo Мы рекомендуем: srt или ssa. webvtt для webm контейнер (Поддерживает Opus и vp8/vp9)
echo Используйте "copy" чтобы использовать кодек исходного файла.
echo Используйте Ctrl+F Для поиска
echo ВПИШИТЕ ИМЯ ПРЕДПОЧИТАЕМОГО КОДЕКА СУБТИТРОВ (Например: subrip)
set /p temp12=
color 2
if %temp12%==nosub set disablesubtitles=-sn && set subencoder= && goto Conf_Custom_Start
set disablesubtitles=
set subencoder=-c:s %temp12%
goto Conf_Custom_Start

:Conf_Custom_flags
title FFmpeg Custom Flags - Configure
cls
color e
echo Не делайте опечаток, иначе FFmpeg может вернуть вам ошибку
echo Вы можете запустить скрипт в новом окну и использовать помощь по флагам (Нажмите H, замем 4, выберите "encoder" и введите имя кодировщика который вам нужен)
echo Смотрите помощь за информацией о поддержке цветовых пространст в разных кодеков
echo Такие параметры как цветовое пространство, частота сэмплов, минимальный/максимальный битрейт, аудио/видео фильтры могут быть выставлены только флагами вручную
pause
cls
echo Введите ваши флаги для кодировщика (Например: -preset slow -aq-mode 2 -rc-lookahead 60)
set /p flags=
goto Conf_Custom_Start

:Conf_Custom_Render
title Preparing - Configure [FFmpeg]
cls
echo Введите НОВОЕ имя файла (Например: lol0 [НЕ lol0.mkv!!!])
set /p outputname=
color a
color f
cls
echo Заметьте что кодек должен поддерживать этот формат. Многие поддерживают .mkv, libvpx (vp8/vp/opus) поддерживают .webm, mpeg-1/2 поддерживают .mpeg, mpeg-4/xvid поддерживают .avi, и так далее
echo Введите новый формат файла (Например: mkv [НЕ .mkv!!!])
set /p outputformat=
color a
color f
echo Выберите папку вывода
for /F "usebackq" %%a in (`PS\pwsh.exe -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set outputfolder=%decode2:?= %
cls
if not novid==%temp1% echo Видеокодек: %temp1%, Битрейт: %vidbitrate%, %temp3%x%temp4%, %temp5% FPS
if novid==%temp1% echo ВИДЕО ОТКЛЮЧЕНО
echo Файл: %filepath%
if noaud==%temp7% echo АУДИО ОТКЛЮЧЕНО
if not noaud==%temp7% echo Аудиокодек: %temp7%, Аудио битрейт: %temp9% kbps
echo Файл: %inputaudio%
if nosub==%temp12% echo СУБТИТРЫ ОТКЛЮЧЕНЫ
if not nosub==%temp12% echo Субтитры: %temp12%
echo Файл: %inputsubtitle%
echo Пользовательские флаги: %flags%
echo ----------------
echo Аргументы FFmpeg: %filepath% %inputaudio% %inputsubtitle% %encoder% %audiocodec% %subencoder% %vidbitrate% %size% %framerate% %disablevideo% %audiobitrate% %volume% %disableaudio% %threads% %flags% %disablesubtitles% -y -strict -2 "%outputfolder%\%outputname%.%outputformat%"
pause
color 8f
echo !!! Запуск FFMPEG
TIMEOUT /T 5

title ENCODING [FFmpeg] "%outputfolder%\%outputname%.%outputformat%"
ffmpeg %filepath% %inputaudio% %inputsubtitle% %encoder% %audiocodec% %subencoder% %vidbitrate% %size% %framerate% %disablevideo% %audiobitrate% %volume% %disableaudio% %threads% %flags% %disablesubtitles% -y -strict -2 "%outputfolder%\%outputname%.%outputformat%"
color f
echo ::::::::::::::::::::::::::::::::::::
title Configure - FFpepeg script [FFmpeg]
echo E - Выйти в главное меню
echo Q - Вернуться в конфигуратор
choice /c EQ
if %errorlevel%==1 goto welcome
if %errorlevel%==2 goto Conf_Custom_Start
pause
exit

rem GLOBAL FUNCTIONS -------------------------------------------------------------------------------
:globalthreads
title GLOBAL THREADS SELECTOR - FFpepeg script [FFmpeg]
cls
echo Выберите количество потоков для кодирования, чем больше значения, тем больше ресурсов процессора будет использоваться для кодирования
echo Мы рекомендуем оставить немного свободных ядер процессора. Если вы выберите все ядра, ваш процессор вероятно будет загружен на все 100% до окончания кодирования.
echo --------------------------
echo 1 - Автоматически
echo 2 - 2 потока
echo 4 - 4 потока
echo 6 - 6 потоков
echo 8 - 8 потоков
echo 9 - 12 потоков
echo 0 - 16 потоков
echo Q - 24 потокоа
echo E - 32 потокоа
echo --------------------------
choice /C 1246890QE /N
if %errorlevel%==1 set threads=
if %errorlevel%==2 set threads=-threads 2
if %errorlevel%==3 set threads=-threads 4
if %errorlevel%==4 set threads=-threads 6
if %errorlevel%==5 set threads=-threads 8
if %errorlevel%==6 set threads=-threads 12
if %errorlevel%==7 set threads=-threads 16
if %errorlevel%==8 set threads=-threads 24
if %errorlevel%==9 set threads=-threads 32
goto %globalredirect%


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