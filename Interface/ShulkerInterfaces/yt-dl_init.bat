@echo off
rem Available variables: %url% %thumbnail% %descriptions% %subtitles% %thumbpath% %subpath% %folder% %subfolder% %formats%
yt-dlp --rm-cache-dir
cls
color a
echo Please let us know what features we can add to this tool or what bugs we can fix.
echo Script based on yt-dlp. yt-dlp is a youtube-dl fork based on the now inactive youtube-dlc.
echo https://github.com/yt-dlp/yt-dlp
timeout /t 3
cls
:welcome
title Main Menu - FFpepeg script (v0.10)
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
echo yt-dlp: A youtube-dl fork with additional features and fixes
echo FORK FROM: youtube-dl - Command-line program to download videos from YouTube and other video sites
echo --Script-version 1.4 -stable --copyright "SHULKER Play" --yt-dlp (2022.09.01)
echo //////////////////////////////
echo WELCOME TO THE UNIVERSAL VIDEO (or audio and subtitles) DOWNLOADER!
echo --------------------------
echo Y - Just Download video for me...
echo D - Download video/playlist/channel (With optional subtitles or previews or descriptions to download)
echo V - Download video without audio (Video, Playlist, or Channel)
echo A - Download Audio only (Video, Playlist, or Channel)
echo S - Download Subtitles only (Video, Playlist, or Channel)
echo F - Check all available video bitrates, formats and codecs
echo R - Download in a specific format (Only for 1 video)
echo H - yt-dlp Help
echo L - Command line mode, here you can write a command for yt-dlp yourself
echo G - Yt-Dlp GitHub
echo M - List of supported sites
echo E - Back to ffmpeg
echo --------------------------
echo NOTE! If you need to perform various operations, such as changing the codec or format, or adding subtitles and much more, you can use our ffmpeg tool.
choice /C DPCHLGEYASFMVR /N

rem Свободны: (P - if %errorlevel%==2), (C - if %errorlevel%==3)

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
title Download ... - FFpepeg script [YT-DLP]
cls
echo --------------------------
echo D - Download video (Also choose subtitles or previews or description to download)
echo P - Download Playlist (Also choose subtitles or previews or description to download)
echo C - Download All Channel (Also choose subtitles or previews or description to download)
echo --------------------------
echo NOTE! If you need to perform various operations, such as changing the codec or format, or adding subtitles and much more, you can use our ffmpeg tool.
choice /C DPC /N

if %errorlevel%==1 goto Dlvid
if %errorlevel%==2 goto DlPlaylist
if %errorlevel%==3 goto DlChannel

:SUPERCUSTOMMODE
title FREE CMD
cls
echo In this mode you can run your command
echo (Example: yt-dlp "https://www.youtube.com/watch?v=dQw4w9WgXcQ" -o "%%(uploader)s/%%(title)s" -f "bestvideo+bestaudio/best"
echo Close the window to exit
echo ----------------------------
set /p SUPERCUSTOMMODE=
color a
color f
%SUPERCUSTOMMODE%
pause
goto SUPERCUSTOMMODE

:getinfo
title Formats Info - FFpepeg script [YT-DLP]
cls
color c
echo PLEASE NOTE! Some videos may start downloading instead of just looking at a list of existing formats
pause
echo This is not our mistake, we haven't managed to get around it yet...
pause
echo Well... If you see a progress bar in percentages, just close the window as soon as possible. Okay?
pause
cls
color e
echo Input video Link
set /p url=
cls
yt-dlp "%url%" --list-formats --skip-download
pause
goto welcome

:git
title GitHub - FFpepeg script [YT-DLP]
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
title Download Video - FFpepeg script [YT-DLP]
echo Input video Link
set /p url=
cls
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 3`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo Download thumbnail as a separate file? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(uploader)s/%%(title)s"
if %errorlevel%==2 set thumbnail=
cls
echo Write Descriptions to a .description file? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo Download subtitles? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(uploader)s/%%(title)s"
if %errorlevel%==2 set subtitles=
cls
title DOWNLOADING... [YT-DLP]
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5
explorer.exe %folder%
pause
goto welcome

:DlVidOnly
title Download Only Video - FFpepeg script [YT-DLP]
echo Input video Link
set /p url=
cls
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 3`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
title DOWNLOADING... [YT-DLP]
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestvideo[height<=?8401]+bestaudio[abr<=?51024]/best" --retries 5
explorer.exe %folder%
pause
goto welcome

:DlPlaylist
title Download Playlist - FFpepeg script [YT-DLP]
echo Input Playlist Link
set /p url=
cls
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 3`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo Create a separate folder for each video? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set subfolder=/%%(title)s.%%(ext)s
if %errorlevel%==2 set subfolder=
cls
echo Download thumbnail as a separate file? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(playlist_title)s/%%(title)s %subfolder%"
if %errorlevel%==2 set thumbnail=
cls
echo Write Descriptions to a .description file? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo Download subtitles? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(playlist_title)s/%%(title)s %subfolder%"
if %errorlevel%==2 set subtitles=
cls
title DOWNLOADING... [YT-DLP]
yt-dlp "%url%" -o "%folder%/%%(playlist_title)s/%%(title)s %subfolder%" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5 --no-abort-on-error
explorer.exe %folder%
pause
goto welcome

:DlChannel
title Download Channel - FFpepeg script [YT-DLP]
echo Input Channel Link
set /p url=
cls
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 3`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo Create a separate folder for each video? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set subfolder=/%%(title)s.%%(ext)s
if %errorlevel%==2 set subfolder=
cls
echo Download thumbnail as a separate file? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(uploader)s/%%(title)s %subfolder%"
if %errorlevel%==2 set thumbnail=
cls
echo Write Descriptions to a .description file? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo Download subtitles? Y - Yes, N - No
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(uploader)s/%%(title)s %subfolder%"
if %errorlevel%==2 set subtitles=
cls
title DOWNLOADING... [YT-DLP]
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s %subfolder%" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5 --no-abort-on-error
explorer.exe %folder%
pause
goto welcome

:DlAudOnly
title Download Audio Only - FFpepeg script [YT-DLP]
echo Input Video/Playlist/Channel Link
set /p url=
cls
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 3`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
title DOWNLOADING... [YT-DLP]
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestaudio[abr<=?51024]" -x --audio-format mp3 --retries 5 --no-abort-on-error
explorer.exe %folder%
pause
goto welcome

:DlSubtitlesOnly
title Download Subtitles Only - FFpepeg script [YT-DLP]
echo Input Video/Playlist/Channel Link
set /p url=
cls
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 3`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
title DOWNLOADING... [YT-DLP]
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s/%%(title)s" --skip-download --write-subs --sub-langs "all" --retries 5 --no-abort-on-error
explorer.exe %folder%
pause
goto welcome

:DlVidVid
title Download Video Without Audio - FFpepeg script [YT-DLP]
echo Input Video/Playlist/Channel Link
set /p url=
cls
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 3`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
title DOWNLOADING... [YT-DLP]
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestvideo[height<=?8401]" --retries 5 --no-abort-on-error
explorer.exe %folder%
pause
goto welcome

:specFormat
title CUSTOM FORMAT - FFpepeg script [YT-DLP]
cls
color c
echo For some sites, this tool may not work. In this case, use the usual tools. 
echo The Library supports a lot of sites and we are not able to check them all. See the list of supported sites in the main menu
pause
cls
color e
echo Input Video Link
set /p url=
cls
echo select output folder
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file Get-Path.ps1 3`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" --list-formats --skip-download
echo !!!!!!!!!!!!!!!!!!
echo Enter the video format that you want to download from the table. The formats are displayed in the ID column and highlighted in green (example: hls-1080p) (example: 337)
echo In the case of YouTube and some other services, you can download the video+audio format (example: 337+251). ffmpeg will try to merge the formats into 1 file
echo Enter the format(s) ID you want
set /p formats=
title DOWNLOADING... [YT-DLP]
yt-dlp "%url%" -o "%folder%/%%(title)s.%%(ext)s" -f "%formats%" --retries 5 --no-abort-on-error
explorer.exe %folder%
pause
goto welcome