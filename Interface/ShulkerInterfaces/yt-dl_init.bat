@echo off
rem Available variables: %url% %thumbnail% %descriptions% %subtitles% %thumbpath% %subpath% %folder% %subfolder% %formats%
yt-dlp --rm-cache-dir
chcp 866
cls
color a
echo �������� ���� ��� ����� ����� �㭪樨 ����� �������� � �����㬥�� ��� ����� �訡�� �� ����� ��ࠢ���.
echo ��ਯ� �᭮��� �� yt-dlp. yt-dlp �� �⢥⢫���� youtube-dl �᭮������� �� �뭥 ����⨢��� youtube-dlc.
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
echo yt-dlp: �⢥⢫���� youtube-dl � �������⥫�묨 �㭪�ﬨ � 䨪ᠬ�
echo ����������� ��: youtube-dl - �ணࠬ�� ��� ��������� ��ப� ��� ����㧪� ����� � �㤨� � Youtube � ��㣨� ᠩ⮢
echo --Script-version 1.3 -stable --copyright "SHULKER Play" --yt-dlp (2022.09.01)
echo //////////////////////////////
echo ����� ���������� � ������������� ��������� ����� (��� �㤨� � ����஢)!
echo --------------------------
echo Y - ���� ᪠砩 ����� ��� ����...
echo D - ������ �����/��������/����� (� ������������ ����㧪� ����஢, �ॢ�� � ���ᠭ��)
echo V - ������ ����� ��� �㤨� (�����, �������� ��� �����)
echo A - ������ ⮫쪮 �㤨� (�����, �������� ��� �����)
echo S - Download Subtitles only (�����, �������� ��� �����)
echo F - ��ᬮ���� ��ਠ��� ���३⮢, �ଠ⮢ � ������� �����
echo R - ������ � ��।��񭭮� �ଠ� (���쪮 ��� ������ �����)
echo H - ������ �� yt-dlp
echo L - ����� ��������� ��ப�, ��� �� ����� ᠬ����⥫쭮 ������� ������� ��� yt-dlp
echo G - Yt-Dlp GitHub
echo M - ���᮪ �����ন������ ᠩ⮢
echo E - �������� � ffmpeg
echo --------------------------
echo �������! �᫨ ��� �㦭� �믮����� ࠧ�� ����樨, ���ਬ�� ᬥ�� ������ ��� �ଠ�, ��� ���������� ����஢ � ������ ��㣮�, �� ����� �ᯮ�짮���� ��� �����㬥�� ��� ffmpeg.
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
echo D - ������ ����� (����� ����� ᪠��� ������, �ॢ�� ��� ���ᠭ��)
echo P - ������ �������� (����� ����� ᪠��� ������, �ॢ�� ��� ���ᠭ��)
echo C - ������ ���� ����� (����� ����� ᪠��� ������, �ॢ�� ��� ���ᠭ��)
echo --------------------------
�������! �᫨ ��� �㦭� �믮����� ࠧ�� ����樨, ���ਬ�� ᬥ�� ������ ��� �ଠ�, ��� ���������� ����஢ � ������ ��㣮�, �� ����� �ᯮ�짮���� ��� �����㬥�� ��� ffmpeg.
choice /C DPC /N

if %errorlevel%==1 goto Dlvid
if %errorlevel%==2 goto DlPlaylist
if %errorlevel%==3 goto DlChannel

:SUPERCUSTOMMODE
cls
echo � �⮬ ०��� �� ����� ����� ᢮� �������
echo (�ਬ��: yt-dlp "https://www.youtube.com/watch?v=dQw4w9WgXcQ" -o "%%(uploader)s/%%(title)s" -f "bestvideo+bestaudio/best"
echo ���ன� ���� �⮡� ���
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
echo ��������! ������� ����� ����� ����� ᪠稢����� ����� ⮣� �⮡� ���� ��ᬮ���� ᯨ᮪ ����㯭�� �ଠ⮢
pause
echo ���॥ �ᥣ� �� �� ��� �訡��, �� ����� �� ����� ���࠭��� ��...
pause
echo �⮦... �᫨ �� 㢨��� �ண��� ᪠稢���� � ��業��, ���� ���ன� ���� ��� ����� ᪮॥, �����?
pause
cls
color e
echo ��⠢�� ��뫪�
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
echo ��⠢�� ��뫪�
set /p url=
cls
echo �롥�� ����� �뢮��
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo ������ �ॢ�� � �⤥��� 䠩�? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(uploader)s/%%(title)s"
if %errorlevel%==2 set thumbnail=
cls
echo ������� ���ᠭ�� � 䠩� .description? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo ������ ������? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(uploader)s/%%(title)s"
if %errorlevel%==2 set subtitles=
cls

yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5
pause
goto welcome

:DlVidOnly
echo ��⠢�� ��뫪�
set /p url=
cls
echo �롥�� ����� �뢮��
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %

yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestvideo[height<=?8401]+bestaudio[abr<=?51024]/best" --retries 5
pause
goto welcome

:DlPlaylist
echo Input Playlist Link
set /p url=
cls
echo �롥�� ����� �뢮��
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo ������� �⤥���� ����� ��� ������� ����� Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set subfolder=/%%(title)s.%%(ext)s
if %errorlevel%==2 set subfolder=
cls
echo ������ �ॢ�� � �⤥��� 䠩�? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(playlist_title)s/%%(title)s %subfolder%"
if %errorlevel%==2 set thumbnail=
cls
echo ������� ���ᠭ�� � 䠩� .description? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo ������ ������? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(playlist_title)s/%%(title)s %subfolder%"
if %errorlevel%==2 set subtitles=
cls

yt-dlp "%url%" -o "%folder%/%%(playlist_title)s/%%(title)s %subfolder%" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5 --no-abort-on-error
pause
goto welcome

:DlChannel
echo ��⠢�� ��뫪� �� �����...
set /p url=
cls
echo �롥�� ����� �뢮��
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
echo ������� �⤥���� ����� ��� ������� ����� Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set subfolder=/%%(title)s.%%(ext)s
if %errorlevel%==2 set subfolder=
cls
echo ������ �ॢ�� � �⤥��� 䠩�? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set thumbnail= --write-thumbnail && set thumbpath= -o "thumbnail:%folder%/%%(uploader)s/%%(title)s %subfolder%"
if %errorlevel%==2 set thumbnail=
cls
echo ������� ���ᠭ�� � 䠩� .description? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set descriptions= --write-description
if %errorlevel%==2 set descriptions=
cls
echo ������ ������? Y - ��, N - ���
choice /C YN /N
if %errorlevel%==1 set subtitles= --write-subs --sub-langs "all" && set subpath= -o "subtitle:%folder%/%%(uploader)s/%%(title)s %subfolder%"
if %errorlevel%==2 set subtitles=
cls

yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s %subfolder%" %subpath% %thumbpath% -f "bestvideo[height<=?8401]+bestaudio[abr<=?1024]/best" %subtitles% %thumbnail% %descriptions% --retries 5 --no-abort-on-error
pause
goto welcome

:DlAudOnly
echo ��⠢�� ��뫪� �� �����/��������/�����...
set /p url=
cls
echo �롥�� ����� �뢮��
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestaudio[abr<=?51024]" -x --audio-format mp3 --retries 5 --no-abort-on-error
pause
goto welcome

:DlSubtitlesOnly
echo ��⠢�� ��뫪� �� �����/��������/�����...
set /p url=
cls
echo �롥�� ����� �뢮��
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s/%%(title)s" --skip-download --write-subs --sub-langs "all" --retries 5 --no-abort-on-error
pause
goto welcome

:DlVidVid
echo ��⠢�� ��뫪� �� �����/��������/�����...
set /p url=
cls
echo �롥�� ����� �뢮��
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" -o "%folder%/%%(uploader)s/%%(title)s.%%(ext)s" -f "bestvideo[height<=?8401]" --retries 5 --no-abort-on-error
pause
goto welcome

:specFormat
cls
color c
echo ��� �������� ᠩ⮢ ��� ����㬥�� ����� �� ࠡ����. � �⮬ ��砥, �ᯮ���� ����� �����㬥���. 
echo ������⥪� �����ন���� ��஬��� ������⢮ ᠩ⮢, � �� �� ����� �஢���� �� �� ���. ������ ���� �����ন������ ᠩ⮢ � ������� ����
pause
cls
color e
echo ��⠢�� ��뫪�
set /p url=
cls
echo �롥�� ����� �뢮��
for /F "usebackq" %%a in (`powershell -executionpolicy bypass -file GetFolderPath.ps1`) do if not "%%a" == "Cancel" if not "%%a" == "OK" set decode2=%%a
set folder=%decode2:?= %
cls
yt-dlp "%url%" --list-formats --skip-download
echo !!!!!!!!!!!!!!!!!!
echo ��⠢�� �ଠ� �� ⠡���� ����� �� ��� ᪠���. ��ଠ�� �⮡ࠦ��� � ������� "ID" � ���ᢥ祭� ����� (�ਬ��: hls-1080p) (�ਬ��: 337)
echo � ��砥 � YouTube � ������묨 ��㣨�� �ࢨᠬ�, �� ����� ᪠��� �ଠ� �����+�㤨� (�ਬ��: 337+251). ffmpeg ���஡�� ���⨯����஢��� �� ��⮪� � 1 䠩�
echo ������ ID �ଠ�(��) ����� ��� �㦭�
set /p formats=
yt-dlp "%url%" -o "%folder%/%%(title)s.%%(ext)s" -f "%formats%" --retries 5 --no-abort-on-error
pause
goto welcome