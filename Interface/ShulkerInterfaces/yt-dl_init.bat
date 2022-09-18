@echo off
rem Available variables: %url% %thumbnail% %descriptions% %subtitles% %thumbpath% %subpath% %folder% %subfolder% %formats%
yt-dlp --rm-cache-dir
chcp 866
cls
color a
echo Пожалуйста дайте нам знать какие функции можно добавить в инструмент или какую ошибку мы можем исправить.
echo Скрипт основан на yt-dlp. yt-dlp это ответвление youtube-dl основанного на ныне неактивном youtube-dlc.
echo https://github.com/yt-dlp/yt-dlp
timeout /t 3
cls
:welcome
color e
set url=
set thumbnail=
set descriptions=
set subtitles=
set thumbpath=
set subpath=
set folder=
set subfolder=
cls
echo Used Libraries
echo yt-dlp: Ответвление youtube-dl с дополнительными функциями и фиксами
echo ОТВЕТВЛЕНИЕ ОТ: youtube-dl - Программа для командной строки для загрузки видео и аудио с Youtube и других сайтов
echo --Script-version 1.3 -stable --copyright "SHULKER Play" --yt-dlp (2022.09.01)
echo //////////////////////////////
echo ДОБРО ПОЖАЛОВАТЬ В УНИВЕРСАЛЬНЫЙ ЗАГРУЗЧИК ВИДЕО (или аудио и субтитров)!
echo --------------------------
echo Y - Просто скачай видео для меня...
echo D - Скачать Видео/Плейлист/Канал (С возможностью загрузки субтитров, превью и описаний)
echo V - Скачать видео без аудио (Видео, Плейлист или Канал)
echo A - Скачать только аудио (Видео, Плейлист или Канал)
echo S - Download Subtitles only (Видео, Плейлист или Канал)
echo F - Посмотреть варианты битрейтов, форматов и кодеков видео
echo R - Скачать в определённом формате (Только для одного видео)
echo H - Помощь по yt-dlp
echo L - Режим командной строки, тут вы можете самостоятельно написать команду для yt-dlp
echo G - Yt-Dlp GitHub
echo M - Список поддерживаемых сайтов
echo E - Вернуться в ffmpeg
echo --------------------------
echo ЗАМЕТКА! Если вам нужно выполнять разные операции, например смену кодека или формата, или добавление субтитров и многое другое, вы можете использовать наш инструмент для ffmpeg.
choice /C DPCHLGEYASFMVR /N

if %errorlevel%==1 goto DlWith
if %errorlevel%==4 cls && yt-dlp --help && pause
if %errorlevel%==5 goto SUPERCUSTOMMODE
if %errorlevel%==6 goto git
if %errorlevel%==7 Ffmpeg_ComandlineInterfaceProject.bat
if %errorlevel%==8 goto DlVidOnly
if %errorlevel%==9 goto DlAudOnly
if %errorlevel%==10 goto DlSubtitlesOnly
if %errorlevel%==11 goto getinfo
if %errorlevel%==12 explorer.exe "yt-dlp_supportedsites.txt"
if %errorlevel%==13 goto DlVidVid
if %errorlevel%==14 goto specFormat
goto welcome

:DlWith
cls
echo --------------------------
echo D - Скачать видео (Вместе можно скачать субтитры, превью или описания)
echo P - Скачать плейлист (Вместе можно скачать субтитры, превью или описания)
echo C - Скачать весь канал (Вместе можно скачать субтитры, превью или описания)
echo --------------------------
ЗАМЕТКА! Если вам нужно выполнять разные операции, например смену кодека или формата, или добавление субтитров и многое другое, вы можете использовать наш инструмент для ffmpeg.
choice /C DPC /N

if %errorlevel%==1 goto Dlvid
if %errorlevel%==2 goto DlPlaylist
if %errorlevel%==3 goto DlChannel

:SUPERCUSTOMMODE
cls
echo В этом режиме вы можете ввести свою команду
echo (Пример: yt-dlp "https://www.youtube.com/watch?v=dQw4w9WgXcQ" -o "%%(uploader)s/%%(title)s" -f "bestvideo+bestaudio/best"
echo Закройте окно чтобы выйти
echo ----------------------------
set /p SUPERCUSTOMMODE=
color a
color f
%SUPERCUSTOMMODE%
pause
goto SUPERCUSTOMMODE

:getinfo
cls
color c
echo ЗАМЕТЬТЕ! Некоторые видео могут начать скачиваться вместо того чтобы просто посмотрить список доступных форматов
pause
echo Скорее всего это не наша ошибка, мы никак не можем устранить это...
pause
echo Чтож... Если вы увидете прогресс скачивания в процентах, просто закройте окно как можно скорее, ладно?
pause
cls
color e
echo Вставьте ссылку
set /p url=
cls
yt-dlp "%url%" --list-formats --skip-download
pause
goto welcome

:git
cls
echo --------------------------
echo L - Gitgub yt-dl
echo P - Github yt-dlp
echo --------------------------
choice /C LP /N

if %errorlevel%==1 explorer.exe "https://github.com/ytdl-org/youtube-dl"
if %errorlevel%==2 explorer.exe "https://github.com/yt-dlp/yt-dlp"
goto welcome

:Dlvid
echo Вставьте ссылку
set /p url=
cls
echo Выберите папку вывода
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo Скачать превью в отдельный файл? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(uploader)s/%%(title)s"
if %errorlevel%==2 set thumbnail=
cls
echo Записать описание в файл .description? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo Скачать субтитры? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(uploader)s/%%(title)s"
if %errorlevel%==2 set subtitles=
cls

yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5
pause
goto welcome

:DlVidOnly
echo Вставьте ссылку
set /p url=
cls
echo Выберите папку вывода
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %

yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestvideo[height<=?8401]+bestaudio[abr<=?51024]/best" --retries 5
pause
goto welcome

:DlPlaylist
echo Input Playlist Link
set /p url=
cls
echo Выберите папку вывода
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo Создать отдельную папку для каждого видео Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set subfolder=/%%(title)s.%%(ext)s
if %errorlevel%==2 set subfolder=
cls
echo Скачать превью в отдельный файл? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(playlist_title)s/%%(title)s %subfolder%"
if %errorlevel%==2 set thumbnail=
cls
echo Записать описание в файл .description? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo Скачать субтитры? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(playlist_title)s/%%(title)s %subfolder%"
if %errorlevel%==2 set subtitles=
cls

yt-dlp "%url%" -o "%folder%/%%(playlist_title)s/%%(title)s %subfolder%" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5 --no-abort-on-error
pause
goto welcome

:DlChannel
echo Вставьте ссылку на канал...
set /p url=
cls
echo Выберите папку вывода
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo Создать отдельную папку для каждого видео Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set subfolder=/%%(title)s.%%(ext)s
if %errorlevel%==2 set subfolder=
cls
echo Скачать превью в отдельный файл? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(uploader)s/%%(title)s %subfolder%"
if %errorlevel%==2 set thumbnail=
cls
echo Записать описание в файл .description? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo Скачать субтитры? Y - Да, N - Нет
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(uploader)s/%%(title)s %subfolder%"
if %errorlevel%==2 set subtitles=
cls

yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s %subfolder%" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5 --no-abort-on-error
pause
goto welcome

:DlAudOnly
echo Вставьте ссылку на видео/плейлист/канал...
set /p url=
cls
echo Выберите папку вывода
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestaudio[abr<=?51024]" -x --audio-format mp3 --retries 5 --no-abort-on-error
pause
goto welcome

:DlSubtitlesOnly
echo Вставьте ссылку на видео/плейлист/канал...
set /p url=
cls
echo Выберите папку вывода
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s/%%(title)s" --skip-download --write-subs --sub-langs "all" --retries 5 --no-abort-on-error
pause
goto welcome

:DlVidVid
echo Вставьте ссылку на видео/плейлист/канал...
set /p url=
cls
echo Выберите папку вывода
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestvideo[height<=?8401]" --retries 5 --no-abort-on-error
pause
goto welcome

:specFormat
cls
color c
echo Для некоторых сайтов этот иснтрумент может не работать. В этом случае, используйте обычные инструменты. 
echo Библиотека поддерживает огромное количество сайтов, и мы не можем проверить все из них. Смотрите лист поддерживаемых сайтов в главном меню
pause
cls
color e
echo Вставьте ссылку
set /p url=
cls
echo Выберите папку вывода
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" --list-formats --skip-download
echo !!!!!!!!!!!!!!!!!!
echo Вставьте формат из таблицы который вы хотите скачать. Форматы отображены в колонке "ID" и подсвечены зелёным (Пример: hls-1080p) (Пример: 337)
echo В случае с YouTube и некоторыми другими сервисами, вы можете скачать формат видео+аудио (Пример: 337+251). ffmpeg попробует мультиплексировать эти потоки в 1 файл
echo Введите ID формата(ов) которые вам нужны
set /p formats=
yt-dlp "%url%" -o "%folder%/%%(title)s.%%(ext)s" -f "%formats%" --retries 5 --no-abort-on-error
pause
goto welcome