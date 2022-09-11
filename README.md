> README также доступен на [русском языке](README_RU.md)

*If you have Windows 7 and below, then look for the version with a note in the file name "Windows7" [in the releases](https://github.com/SHULKERPLAY/FFpepeg/releases)*

*The version for Windows 8.1 and higher can be [downloaded in releases](https://github.com/SHULKERPLAY/FFpepeg/releases), or use the script to [automatically build the release from GitHub](https://www.dropbox.com/s/w5wayk86bi8ip8t/ReleaseAutoBuilder.bat?dl=1) with the latest [commits](https://github.com/SHULKERPLAY/FFpepeg/commits/FFmpeg-Batch).*
# FFmpeg and Yt-Dlp Batch
*The script that lets you to convert and perform operations with photos, videos, audio via FFmpeg in a few clicks on the keyboard.*

These scripts were created for easier use of [FFmpeg](https://ffmpeg.org/) and [Yt-Dlp](https://github.com/yt-dlp/yt-dlp). It combines different tools 
- for content creators, such as extracting multiple audio tracks from a video. 
- For professionals in FFmpeg, for example, a manual configuration tool.
- For people who are looking for an easy way to convert video, audio, and even photos.
- And also a tool for downloading videos from hundreds of different resources, with different functions, up to downloading previews and subtitles.

And much more. This tool is designed to let people to save time on some tasks

### What is FFmpeg?
> FFmpeg is the leading multimedia framework, able to **decode**, **encode**, **transcode**, **mux**, **demux**, **stream**, **filter** and **play** pretty much anything that humans and machines have created.

### What is Yt-DLP?
> yt-dlp is a youtube-dl fork based on the now inactive youtube-dlc. The main focus of this project is adding new features and patches while also keeping up to date with the original project. Yt-Dlp is a media downloader.

### What are the pros of our tool?
- People will be able to use these tools in their tasks without knowing the instructions
- You do not need to specify the file paths manually, with Powershell you can use the file selector
- Simple presets that are updating and save your time

![I Love FFmpeg](assets/iloveffmpeg.png)
# Available tool functions in v0.9
### For FFmpeg
- Presets
   - Converting any mediafile to `Webm` (VP9) `mpeg` (mpeg-1/2) `avi` (Mpeg-4/Xvid) `GIF` 
   
   with additional settings, transparency support for VP9, and video trimming in `gif` preset
   - Optimizing video for YouTube Upload according to [Youtube recommendations](https://support.google.com/youtube/answer/1722171), also for [HDR](https://support.google.com/youtube/answer/7126552)
   - Converting any Photo format in `PNG` `JPG` `Webp` `TIFF` `BMP`
   
   With transparency support in `PNG` and `Webp`, and animation support in `Webp` (New features will appear in the future)
   - Converting any Audio format in `MP3` `AAC` `Opus` `Vorbis (.ogg)` `FLAC` `ALAC (.m4a)` `any PCM (.wav)`
   - Remux with the option of embedding your own audio or subtitles
- Tools
   - Extract multiple audio streams from video (extract audio to .mp3 or .mka up to 6 streams)
   - Upscale or downscale video using `Lanczos` `Sinc` `Spline` `Bicubic` `Bilinear` `Gauss` methods
   
 - ***CONFIGURATORS FOR DIFFERENT CODECS ARE STILL IN DEVELOPMENT***
 - Custom configuration mode, which will simplify the creation of unusual combinations that are not in the presets
 - Commandline Mode
 > And much more will be added
 
 ### For Yt-Dlp
 - The ability to download a single video/audio, playlist or channel
 - In addition to this, you can download Previews, video descriptions and subtitles with all playlist or channel
 - View all existing formats for download at your link
 - The ability to download exactly the format you need from the available
 - Commandline Mode
 
 ### Note that Yt-dlp has a huge number of supported sites. You can download not only videos from different platforms, but also music, for example from soundcloud. And also whole profiles, or playlists. [Check list of supported yt-dlp websites](Interface/ShulkerInterfaces/yt-dlp_supportedsites.txt)
 
 # Development and plans
 This tool was created for me, but I decided to expand it and show it to everyone to save even more time for people and make their lives easier.
 
 You can support our work, and also offer ideas of your presets and tools that we can add. You can send them to the [issues section](https://github.com/SHULKERPLAY/FFpepeg/issues)
 ### Of course, we have some plans, and here are what we would like to announce. Not all of them can be done, but...
 - [ ] Finally, someday to finish the configurators for different codecs
 - [ ] Add features such as color space selection in the photo converter
 - [x] Don't make this repository abandoned
 - [ ] Add more info about script for people who want to create a preset for themselves, and help in development
 - [ ] Create a designer of your presets
 
***This tool is still in development, but it is workable in most cases. I will be very glad if I can help someone by creating this script.***

In the distant future, if the script is needed to someone, I would like to...
 - [ ] **Release a version of the tool with a UI made on Powershell**
 
 ### Thanks to the [FFmpeg](https://ffmpeg.org/) and [Yt-Dlp](https://github.com/yt-dlp/yt-dlp) teams for creating such wonderful command-line programs
 ### Thanks to [7-zip](https://www.7-zip.org/) for the high-quality compression of our releases. Also thanks to the [Powershell Team](https://github.com/PowerShell) for the external Powershell that helps our tool work on Windows 7
 ### :heart_on_fire:
